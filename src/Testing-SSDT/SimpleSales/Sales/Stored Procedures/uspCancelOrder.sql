CREATE PROCEDURE [Sales].[uspCancelOrder]  
    @OrderID INT  
AS  
BEGIN  
    DECLARE @Delta INT, @CustomerID INT, @PriorStatus CHAR(1)  
    BEGIN TRANSACTION  
        BEGIN TRY  
            IF (NOT EXISTS(SELECT [CustomerID] from [Sales].[Orders] WHERE [OrderID] = @OrderID))  
            BEGIN  
                -- Specify WITH LOG option so that the error is  
                -- written to the application log.  
                RAISERROR( 'That order does not exist.', -- Message text  
                           16, -- severity  
                            1 -- state  
                        ) WITH LOG;  
            END  

            SELECT @Delta = [Amount], @CustomerID = [CustomerID], @PriorStatus = [Status]  
             FROM [Sales].[Orders] WHERE [OrderID] = @OrderID  

            IF @PriorStatus <> 'O'   
            BEGIN  
                -- Specify WITH LOG option so that the error is  
                -- written to the application log.  
                RAISERROR ( 'You can only cancel open orders.', -- Message text  
                            16, -- Severity  
                            1 -- State  
                            ) WITH LOG;  
            END  
            ELSE  
            BEGIN  
                -- If we make it to here, then we can cancel the order. Update the status to 'X' first...  
                UPDATE [Sales].[Orders]  
                   SET [Status] = 'X'  
                WHERE [OrderID] = @OrderID  
                -- and then remove the amount from the YTDOrders for the customer  
                UPDATE [Sales].[Customer]  
                       SET  
                           YTDOrders = YTDOrders - @Delta  
                WHERE [CustomerID] = @CustomerID  
                COMMIT TRANSACTION  
                RETURN 1; -- indicate success  
            END  
        END TRY  
        BEGIN CATCH  
            DECLARE @ErrorMessage NVARCHAR(4000);  
            DECLARE @ErrorSeverity INT;  
            DECLARE @ErrorState INT;  

            SELECT @ErrorMessage = ERROR_MESSAGE(),  
                   @ErrorSeverity = ERROR_SEVERITY(),  
                   @ErrorState = ERROR_STATE();  

            ROLLBACK TRANSACTION  
            -- Use RAISERROR inside the CATCH block to return  
            -- error information about the original error that  
            -- caused execution to jump to the CATCH block.  
            RAISERROR (@ErrorMessage, -- Mesasge text  
                       @ErrorSeverity, -- Severity  
                       @ErrorState -- State  
                      );  
            RETURN 0; -- indicate failure  
        END CATCH;  
END