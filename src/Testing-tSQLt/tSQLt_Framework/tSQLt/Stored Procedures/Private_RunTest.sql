
CREATE PROCEDURE tSQLt.Private_RunTest
   @TestName NVARCHAR(MAX),
   @SetUp NVARCHAR(MAX) = NULL
AS
BEGIN
    DECLARE @Msg NVARCHAR(MAX); SET @Msg = '';
    DECLARE @Msg2 NVARCHAR(MAX); SET @Msg2 = '';
    DECLARE @Cmd NVARCHAR(MAX); SET @Cmd = '';
    DECLARE @TestClassName NVARCHAR(MAX); SET @TestClassName = '';
    DECLARE @TestProcName NVARCHAR(MAX); SET @TestProcName = '';
    DECLARE @Result NVARCHAR(MAX);
    DECLARE @TranName CHAR(32); EXEC tSQLt.GetNewTranName @TranName OUT;
    DECLARE @TestResultId INT;
    DECLARE @PreExecTrancount INT;
    DECLARE @TestObjectId INT;

    DECLARE @VerboseMsg NVARCHAR(MAX);
    DECLARE @Verbose BIT;
    SET @Verbose = ISNULL((SELECT CAST(Value AS BIT) FROM tSQLt.Private_GetConfiguration('Verbose')),0);
    
    TRUNCATE TABLE tSQLt.CaptureOutputLog;
    CREATE TABLE #ExpectException(ExpectException INT,ExpectedMessage NVARCHAR(MAX), ExpectedSeverity INT, ExpectedState INT, ExpectedMessagePattern NVARCHAR(MAX), ExpectedErrorNumber INT, FailMessage NVARCHAR(MAX));
    CREATE TABLE #SkipTest(SkipTestMessage NVARCHAR(MAX) DEFAULT '');

    IF EXISTS (SELECT 1 FROM sys.extended_properties WHERE name = N'SetFakeViewOnTrigger')
    BEGIN
      RAISERROR('Test system is in an invalid state. SetFakeViewOff must be called if SetFakeViewOn was called. Call SetFakeViewOff after creating all test case procedures.', 16, 10) WITH NOWAIT;
      RETURN -1;
    END;

    SELECT @Cmd = 'EXEC ' + @TestName;
    
    SELECT @TestClassName = OBJECT_SCHEMA_NAME(OBJECT_ID(@TestName)), --tSQLt.Private_GetCleanSchemaName('', @TestName),
           @TestProcName = tSQLt.Private_GetCleanObjectName(@TestName),
           @TestObjectId = OBJECT_ID(@TestName);
           
    INSERT INTO tSQLt.TestResult(Class, TestCase, TranName, Result) 
        SELECT @TestClassName, @TestProcName, @TranName, 'A severe error happened during test execution. Test did not finish.'
        OPTION(MAXDOP 1);
    SELECT @TestResultId = SCOPE_IDENTITY();

    IF(@Verbose = 1)
    BEGIN
      SET @VerboseMsg = 'tSQLt.Run '''+@TestName+'''; --Starting';
      EXEC tSQLt.Private_Print @Message =@VerboseMsg, @Severity = 0;
    END;


    SET @Result = 'Success';
    BEGIN TRAN;
    SAVE TRAN @TranName;

    SET @PreExecTrancount = @@TRANCOUNT;

    
    TRUNCATE TABLE tSQLt.TestMessage;

    BEGIN TRY
      EXEC tSQLt.Private_ProcessTestAnnotations @TestObjectId=@TestObjectId;

      DECLARE @TmpMsg NVARCHAR(MAX);
      DECLARE @TestEndTime DATETIME; SET @TestEndTime = NULL;
      BEGIN TRY
        IF(NOT EXISTS(SELECT 1 FROM #SkipTest))
        BEGIN
          IF (@SetUp IS NOT NULL) EXEC @SetUp;
          EXEC (@Cmd);
          IF(EXISTS(SELECT 1 FROM #ExpectException WHERE ExpectException = 1))
          BEGIN
            SET @TmpMsg = COALESCE((SELECT FailMessage FROM #ExpectException)+' ','')+'Expected an error to be raised.';
            EXEC tSQLt.Fail @TmpMsg;
          END
        END;
        ELSE
        BEGIN
          SELECT 
              @Result = 'Skipped',
              @Msg = ST.SkipTestMessage 
            FROM #SkipTest AS ST;
          SET @TmpMsg = '-->'+@TestName+' skipped: '+@Msg;
          EXEC tSQLt.Private_Print @Message = @TmpMsg;
        END;
        SET @TestEndTime = GETDATE();
      END TRY
      BEGIN CATCH
          SET @TestEndTime = ISNULL(@TestEndTime,GETDATE());
          IF ERROR_MESSAGE() LIKE '%tSQLt.Failure%'
          BEGIN
              SELECT @Msg = Msg FROM tSQLt.TestMessage;
              SET @Result = 'Failure';
          END
          ELSE
          BEGIN
            DECLARE @ErrorInfo NVARCHAR(MAX);
            SELECT @ErrorInfo = 
              COALESCE(ERROR_MESSAGE(), '<ERROR_MESSAGE() is NULL>') + 
              '[' +COALESCE(LTRIM(STR(ERROR_SEVERITY())), '<ERROR_SEVERITY() is NULL>') + ','+COALESCE(LTRIM(STR(ERROR_STATE())), '<ERROR_STATE() is NULL>') + ']' +
              '{' + COALESCE(ERROR_PROCEDURE(), '<ERROR_PROCEDURE() is NULL>') + ',' + COALESCE(CAST(ERROR_LINE() AS NVARCHAR), '<ERROR_LINE() is NULL>') + '}';

            IF(EXISTS(SELECT 1 FROM #ExpectException))
            BEGIN
              DECLARE @ExpectException INT;
              DECLARE @ExpectedMessage NVARCHAR(MAX);
              DECLARE @ExpectedMessagePattern NVARCHAR(MAX);
              DECLARE @ExpectedSeverity INT;
              DECLARE @ExpectedState INT;
              DECLARE @ExpectedErrorNumber INT;
              DECLARE @FailMessage NVARCHAR(MAX);
              SELECT @ExpectException = ExpectException,
                     @ExpectedMessage = ExpectedMessage, 
                     @ExpectedSeverity = ExpectedSeverity,
                     @ExpectedState = ExpectedState,
                     @ExpectedMessagePattern = ExpectedMessagePattern,
                     @ExpectedErrorNumber = ExpectedErrorNumber,
                     @FailMessage = FailMessage
                FROM #ExpectException;

              IF(@ExpectException = 1)
              BEGIN
                SET @Result = 'Success';
                SET @TmpMsg = COALESCE(@FailMessage+' ','')+'Exception did not match expectation!';
                IF(ERROR_MESSAGE() <> @ExpectedMessage)
                BEGIN
                  SET @TmpMsg = @TmpMsg +CHAR(13)+CHAR(10)+
                             'Expected Message: <'+@ExpectedMessage+'>'+CHAR(13)+CHAR(10)+
                             'Actual Message  : <'+ERROR_MESSAGE()+'>';
                  SET @Result = 'Failure';
                END
                IF(ERROR_MESSAGE() NOT LIKE @ExpectedMessagePattern)
                BEGIN
                  SET @TmpMsg = @TmpMsg +CHAR(13)+CHAR(10)+
                             'Expected Message to be like <'+@ExpectedMessagePattern+'>'+CHAR(13)+CHAR(10)+
                             'Actual Message            : <'+ERROR_MESSAGE()+'>';
                  SET @Result = 'Failure';
                END
                IF(ERROR_NUMBER() <> @ExpectedErrorNumber)
                BEGIN
                  SET @TmpMsg = @TmpMsg +CHAR(13)+CHAR(10)+
                             'Expected Error Number: '+CAST(@ExpectedErrorNumber AS NVARCHAR(MAX))+CHAR(13)+CHAR(10)+
                             'Actual Error Number  : '+CAST(ERROR_NUMBER() AS NVARCHAR(MAX));
                  SET @Result = 'Failure';
                END
                IF(ERROR_SEVERITY() <> @ExpectedSeverity)
                BEGIN
                  SET @TmpMsg = @TmpMsg +CHAR(13)+CHAR(10)+
                             'Expected Severity: '+CAST(@ExpectedSeverity AS NVARCHAR(MAX))+CHAR(13)+CHAR(10)+
                             'Actual Severity  : '+CAST(ERROR_SEVERITY() AS NVARCHAR(MAX));
                  SET @Result = 'Failure';
                END
                IF(ERROR_STATE() <> @ExpectedState)
                BEGIN
                  SET @TmpMsg = @TmpMsg +CHAR(13)+CHAR(10)+
                             'Expected State: '+CAST(@ExpectedState AS NVARCHAR(MAX))+CHAR(13)+CHAR(10)+
                             'Actual State  : '+CAST(ERROR_STATE() AS NVARCHAR(MAX));
                  SET @Result = 'Failure';
                END
                IF(@Result = 'Failure')
                BEGIN
                  SET @Msg = @TmpMsg;
                END
              END 
              ELSE
              BEGIN
                  SET @Result = 'Failure';
                  SET @Msg = 
                    COALESCE(@FailMessage+' ','')+
                    'Expected no error to be raised. Instead this error was encountered:'+
                    CHAR(13)+CHAR(10)+
                    @ErrorInfo;
              END
            END;
            ELSE
            BEGIN
              SET @Result = 'Error';
              SET @Msg = @ErrorInfo;
            END; 
          END;
      END CATCH;
    END TRY
    BEGIN CATCH
        SET @Result = 'Error';
        SET @Msg = ERROR_MESSAGE();
    END CATCH

    BEGIN TRY
        ROLLBACK TRAN @TranName;
    END TRY
    BEGIN CATCH
        DECLARE @PostExecTrancount INT;
        SET @PostExecTrancount = @PreExecTrancount - @@TRANCOUNT;
        IF (@@TRANCOUNT > 0) ROLLBACK;
        BEGIN TRAN;
        IF(   @Result <> 'Success'
           OR @PostExecTrancount <> 0
          )
        BEGIN
          SELECT @Msg = COALESCE(@Msg, '<NULL>') + ' (There was also a ROLLBACK ERROR --> ' + COALESCE(ERROR_MESSAGE(), '<ERROR_MESSAGE() is NULL>') + '{' + COALESCE(ERROR_PROCEDURE(), '<ERROR_PROCEDURE() is NULL>') + ',' + COALESCE(CAST(ERROR_LINE() AS NVARCHAR), '<ERROR_LINE() is NULL>') + '})';
          SET @Result = 'Error';
        END;
    END CATCH;  

    If(@Result NOT IN ('Success','Skipped'))
    BEGIN
      SET @Msg2 = @TestName + ' failed: (' + @Result + ') ' + @Msg;
      EXEC tSQLt.Private_Print @Message = @Msg2, @Severity = 0;
    END;

    IF EXISTS(SELECT 1 FROM tSQLt.TestResult WHERE Id = @TestResultId)
    BEGIN
        UPDATE tSQLt.TestResult SET
            Result = @Result,
            Msg = @Msg,
            TestEndTime = @TestEndTime
         WHERE Id = @TestResultId;
    END;
    ELSE
    BEGIN
        INSERT tSQLt.TestResult(Class, TestCase, TranName, Result, Msg)
        SELECT @TestClassName, 
               @TestProcName,  
               '?', 
               'Error', 
               'TestResult entry is missing; Original outcome: ' + @Result + ', ' + @Msg;
    END;    
    COMMIT;

    IF(@Verbose = 1)
    BEGIN
    SET @VerboseMsg = 'tSQLt.Run '''+@TestName+'''; --Finished';
      EXEC tSQLt.Private_Print @Message =@VerboseMsg, @Severity = 0;
    END;

END;
