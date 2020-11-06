
CREATE PROCEDURE DataLoadSimulation.Configuration_ApplyDataLoadSimulationProcedures
WITH EXECUTE AS OWNER
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	EXEC DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad;

	DECLARE @SQL nvarchar(max);

	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE name = N'GetAreaCode'
	                                         AND type = N'FN'
											 AND SCHEMA_NAME(schema_id) = N'DataLoadSimulation')
	BEGIN
		SET @SQL = N'
CREATE FUNCTION DataLoadSimulation.GetAreaCode
(
    @StateProvinceCode nvarchar(2)
)
RETURNS INT
WITH EXECUTE AS OWNER
AS
BEGIN
    DECLARE @AreaCode int;

    WITH AreaCodes
    AS
    (
        SELECT StateProvinceCode, AreaCode
        FROM
        (VALUES (''NJ'', 201),
                (''DC'', 202),
                (''CT'', 203),
                (''MB'', 204),
                (''AL'', 205),
                (''WA'', 206),
                (''ME'', 207),
                (''ID'', 208),
                (''CA'', 209),
                (''TX'', 210),
                (''NY'', 212),
                (''CA'', 213),
                (''TX'', 214),
                (''PA'', 215),
                (''OH'', 216),
                (''IL'', 217),
                (''MN'', 218),
                (''IN'', 219),
                (''OH'', 220),
                (''IL'', 224),
                (''LA'', 225),
                (''ON'', 226),
                (''MS'', 228),
                (''GA'', 229),
                (''MI'', 231),
                (''OH'', 234),
                (''BC'', 236),
                (''FL'', 239),
                (''MD'', 240),
                (''MI'', 248),
                (''BC'', 250),
                (''AL'', 251),
                (''NC'', 252),
                (''WA'', 253),
                (''TX'', 254),
                (''AL'', 256),
                (''IN'', 260),
                (''WI'', 262),
                (''PA'', 267),
                (''MI'', 269),
                (''KY'', 270),
                (''PA'', 272),
                (''VA'', 276),
                (''MI'', 278),
                (''TX'', 281),
                (''OH'', 283),
                (''ON'', 289),
                (''MD'', 301),
                (''DE'', 302),
                (''CO'', 303),
                (''WV'', 304),
                (''FL'', 305),
                (''SK'', 306),
                (''WY'', 307),
                (''NE'', 308),
                (''IL'', 309),
                (''CA'', 310),
                (''IL'', 312),
                (''MI'', 313),
                (''MO'', 314),
                (''NY'', 315),
                (''KS'', 316),
                (''IN'', 317),
                (''LA'', 318),
                (''IA'', 319),
                (''MN'', 320),
                (''FL'', 321),
                (''CA'', 323),
                (''TX'', 325),
                (''OH'', 330),
                (''IL'', 331),
                (''AL'', 334),
                (''NC'', 336),
                (''LA'', 337),
                (''MA'', 339),
                (''VI'', 340),
                (''CA'', 341),
                (''ON'', 343),
                (''NY'', 347),
                (''MA'', 351),
                (''FL'', 352),
                (''WA'', 360),
                (''TX'', 361),
                (''ON'', 365),
                (''CA'', 369),
                (''OH'', 380),
                (''UT'', 385),
                (''FL'', 386),
                (''RI'', 401),
                (''NE'', 402),
                (''AB'', 403),
                (''GA'', 404),
                (''OK'', 405),
                (''MT'', 406),
                (''FL'', 407),
                (''CA'', 408),
                (''TX'', 409),
                (''MD'', 410),
                (''PA'', 412),
                (''MA'', 413),
                (''WI'', 414),
                (''CA'', 415),
                (''ON'', 416),
                (''MO'', 417),
                (''QC'', 418),
                (''OH'', 419),
                (''TN'', 423),
                (''CA'', 424),
                (''WA'', 425),
                (''TX'', 430),
                (''MB'', 431),
                (''TX'', 432),
                (''VA'', 434),
                (''UT'', 435),
                (''ON'', 437),
                (''QC'', 438),
                (''OH'', 440),
                (''CA'', 442),
                (''MD'', 443),
                (''QC'', 450),
                (''OR'', 458),
                (''IL'', 464),
                (''TX'', 469),
                (''GA'', 470),
                (''CT'', 475),
                (''GA'', 478),
                (''AR'', 479),
                (''AZ'', 480),
                (''QC'', 481),
                (''PA'', 484),
                (''AR'', 501),
                (''KY'', 502),
                (''OR'', 503),
                (''LA'', 504),
                (''NM'', 505),
                (''NB'', 506),
                (''MN'', 507),
                (''MA'', 508),
                (''WA'', 509),
                (''CA'', 510),
                (''TX'', 512),
                (''OH'', 513),
                (''QC'', 514),
                (''IA'', 515),
                (''NY'', 516),
                (''MI'', 517),
                (''NY'', 518),
                (''ON'', 519),
                (''AZ'', 520),
                (''CA'', 530),
                (''OK'', 539),
                (''VA'', 540),
                (''OR'', 541),
                (''ON'', 548),
                (''NJ'', 551),
                (''MO'', 557),
                (''CA'', 559),
                (''FL'', 561),
                (''CA'', 562),
                (''IA'', 563),
                (''WA'', 564),
                (''OH'', 567),
                (''PA'', 570),
                (''VA'', 571),
                (''MO'', 573),
                (''IN'', 574),
                (''NM'', 575),
                (''QC'', 579),
                (''OK'', 580),
                (''NY'', 585),
                (''MI'', 586),
                (''AB'', 587),
                (''MS'', 601),
                (''AZ'', 602),
                (''NH'', 603),
                (''BC'', 604),
                (''SD'', 605),
                (''KY'', 606),
                (''NY'', 607),
                (''WI'', 608),
                (''NJ'', 609),
                (''PA'', 610),
                (''MN'', 612),
                (''ON'', 613),
                (''OH'', 614),
                (''TN'', 615),
                (''MI'', 616),
                (''MA'', 617),
                (''IL'', 618),
                (''CA'', 619),
                (''KS'', 620),
                (''AZ'', 623),
                (''CA'', 626),
                (''CA'', 627),
                (''CA'', 628),
                (''TN'', 629),
                (''IL'', 630),
                (''NY'', 631),
                (''MO'', 636),
                (''SK'', 639),
                (''IA'', 641),
                (''NY'', 646),
                (''ON'', 647),
                (''CA'', 650),
                (''MN'', 651),
                (''CA'', 657),
                (''MO'', 660),
                (''CA'', 661),
                (''MS'', 662),
                (''CA'', 669),
                (''MP'', 670),
                (''GU'', 671),
                (''GA'', 678),
                (''MI'', 679),
                (''WV'', 681),
                (''TX'', 682),
                (''FL'', 689),
                (''ND'', 701),
                (''NV'', 702),
                (''VA'', 703),
                (''NC'', 704),
                (''ON'', 705),
                (''GA'', 706),
                (''CA'', 707),
                (''IL'', 708),
                (''NL'', 709),
                (''IA'', 712),
                (''TX'', 713),
                (''CA'', 714),
                (''WI'', 715),
                (''NY'', 716),
                (''PA'', 717),
                (''NY'', 718),
                (''CO'', 719),
                (''CO'', 720),
                (''PA'', 724),
                (''NV'', 725),
                (''FL'', 727),
                (''TN'', 731),
                (''NJ'', 732),
                (''MI'', 734),
                (''TX'', 737),
                (''OH'', 740),
                (''CA'', 747),
                (''FL'', 754),
                (''VA'', 757),
                (''CA'', 760),
                (''GA'', 762),
                (''MN'', 763),
                (''CA'', 764),
                (''IN'', 765),
                (''MS'', 769),
                (''GA'', 770),
                (''FL'', 772),
                (''IL'', 773),
                (''MA'', 774),
                (''NV'', 775),
                (''BC'', 778),
                (''IL'', 779),
                (''AB'', 780),
                (''MA'', 781),
                (''NS'', 782),
                (''KS'', 785),
                (''FL'', 786),
                (''PR'', 787),
                (''UT'', 801),
                (''VT'', 802),
                (''SC'', 803),
                (''VA'', 804),
                (''CA'', 805),
                (''TX'', 806),
                (''ON'', 807),
                (''HI'', 808),
                (''MI'', 810),
                (''IN'', 812),
                (''FL'', 813),
                (''PA'', 814),
                (''IL'', 815),
                (''MO'', 816),
                (''TX'', 817),
                (''CA'', 818),
                (''QC'', 819),
                (''AB'', 825),
                (''NC'', 828),
                (''TX'', 830),
                (''CA'', 831),
                (''TX'', 832),
                (''PA'', 835),
                (''SC'', 843),
                (''NY'', 845),
                (''IL'', 847),
                (''NJ'', 848),
                (''FL'', 850),
                (''NJ'', 856),
                (''MA'', 857),
                (''CA'', 858),
                (''KY'', 859),
                (''CT'', 860),
                (''NJ'', 862),
                (''FL'', 863),
                (''SC'', 864),
                (''TN'', 865),
                (''YT'', 867),
                (''AR'', 870),
                (''IL'', 872),
                (''QC'', 873),
                (''PA'', 878),
                (''TN'', 901),
                (''NS'', 902),
                (''TX'', 903),
                (''FL'', 904),
                (''ON'', 905),
                (''MI'', 906),
                (''AK'', 907),
                (''NJ'', 908),
                (''CA'', 909),
                (''NC'', 910),
                (''GA'', 912),
                (''KS'', 913),
                (''NY'', 914),
                (''TX'', 915),
                (''CA'', 916),
                (''NY'', 917),
                (''OK'', 918),
                (''NC'', 919),
                (''WI'', 920),
                (''CA'', 925),
                (''FL'', 927),
                (''AZ'', 928),
                (''NY'', 929),
                (''TN'', 931),
                (''CA'', 935),
                (''TX'', 936),
                (''OH'', 937),
                (''PR'', 939),
                (''TX'', 940),
                (''FL'', 941),
                (''MI'', 947),
                (''CA'', 949),
                (''CA'', 951),
                (''MN'', 952),
                (''FL'', 954),
                (''TX'', 956),
                (''NM'', 957),
                (''CT'', 959),
                (''CO'', 970),
                (''OR'', 971),
                (''TX'', 972),
                (''NJ'', 973),
                (''MO'', 975),
                (''MA'', 978),
                (''TX'', 979),
                (''NC'', 980),
                (''NC'', 984),
                (''LA'', 985),
                (''MI'', 989)
        ) AS AreaCodes(StateProvinceCode, AreaCode)
    )
    SELECT TOP(1) @AreaCode = AreaCode FROM AreaCodes AS ac WHERE ac.StateProvinceCode = @StateProvinceCode;

    RETURN @AreaCode;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'ActivateWebsiteLogins')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.ActivateWebsiteLogons
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    -- Approximately 1 in 8 days has a new website activation

    DECLARE @NumberOfLogonsToActivate int = CASE WHEN (RAND() * 8) <= 1 THEN 1 ELSE 0 END;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Activating '' + CAST(@NumberOfLogonsToActivate AS nvarchar(20)) + N'' logons'';
    END;

    DECLARE @Counter int = 0;
    DECLARE @PersonID int;
    DECLARE @EmailAddress nvarchar(256);
    DECLARE @HashedPassword varbinary(max);
    DECLARE @FullName nvarchar(50);
    DECLARE @UserPreferences nvarchar(max) = (SELECT UserPreferences FROM [Application].People WHERE PersonID = 1);

    WHILE @Counter < @NumberOfLogonsToActivate
    BEGIN
        SELECT TOP(1) @PersonID = PersonID,
                      @EmailAddress = EmailAddress,
                      @FullName = FullName
        FROM [Application].People
        WHERE IsPermittedToLogon = 0 AND PersonID <> 1
        ORDER BY NEWID();

        UPDATE [Application].People
        SET IsPermittedToLogon = 1,
            LogonName = @EmailAddress,
            HashedPassword = HASHBYTES(N''SHA2_256'', N''SQLRocks!00'' + @FullName),
            UserPreferences = @UserPreferences,
            [ValidFrom] = @StartingWhen
        WHERE PersonID = @PersonID;

        SET @Counter += 1;
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'AddCustomers')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.AddCustomers
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    -- add a customer one in 15 days average
    DECLARE @NumberOfCustomersToAdd int = (SELECT TOP(1) Quantity
                                              FROM (VALUES (0), (0), (0), (0), (0),
                                                           (0), (0), (0), (0), (0),
                                                           (0), (0), (0), (0), (0),
                                                           (0), (0), (0), (0), (0),
                                                           (0), (0), (0), (0), (1)) AS q(Quantity)
                                              ORDER BY NEWID());
    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Adding '' + CAST(@NumberOfCustomersToAdd AS nvarchar(20)) + N'' customers'';
    END;

    DECLARE @Counter int = 0;
    DECLARE @CityID int;
    DECLARE @CityName nvarchar(max);
    DECLARE @CityStateProvinceID int;
    DECLARE @CityStateProvinceCode nvarchar(5);
    DECLARE @AreaCode int;
    DECLARE @CustomerCategoryID int;


    DECLARE @CustomerID int;
    DECLARE @PrimaryContactFullName nvarchar(50);
    DECLARE @PrimaryContactPersonID int;
    DECLARE @PrimaryContactFirstName nvarchar(50);
    DECLARE @DeliveryMethodID int = (SELECT DeliveryMethodID FROM [Application].DeliveryMethods
                                                             WHERE DeliveryMethodName = N''Delivery Van'');
    DECLARE @DeliveryAddressLine1 nvarchar(max);
    DECLARE @DeliveryAddressLine2 nvarchar(max);
    DECLARE @DeliveryPostalCode nvarchar(max);
    DECLARE @PostalAddressLine1 nvarchar(max);
    DECLARE @PostalAddressLine2 nvarchar(max);
    DECLARE @PostalPostalCode nvarchar(max);
    DECLARE @StreetSuffix nvarchar(max);
    DECLARE @CompanySuffix nvarchar(max);
    DECLARE @StorePrefix nvarchar(max);
    DECLARE @CreditLimit int;

    WHILE @Counter < @NumberOfCustomersToAdd
    BEGIN
        WITH NamesToUse
        AS
        (
            SELECT FirstName, LastName, FullName
            FROM
            (VALUES (''Mark'', ''Korjus'', ''Mark Korjus''),
                    (''Emil'', ''Bojin'', ''Emil Bojin''),
                    (''Hue'', ''Ton'', ''Hue Ton''),
                    (''Leonardo'', ''Jozic'', ''Leonardo Jozic''),
                    (''Ivana'', ''Hadrabova'', ''Ivana Hadrabova''),
                    (''Hakan'', ''Akbulut'', ''Hakan Akbulut''),
                    (''Jayanti'', ''Pandit'', ''Jayanti Pandit''),
                    (''Judit'', ''Gyenes'', ''Judit Gyenes''),
                    (''Coralie'', ''Monty'', ''Coralie Monty''),
                    (''Hai'', ''Banh'', ''Hai Banh''),
                    (''Manuel'', ''Jaramillo'', ''Manuel Jaramillo''),
                    (''Damodar'', ''Shenoy'', ''Damodar Shenoy''),
                    (''Jatindra'', ''Bandopadhyay'', ''Jatindra Bandopadhyay''),
                    (''Kanan'', ''Malakar'', ''Kanan Malakar''),
                    (''Miloslav'', ''Fisar'', ''Miloslav Fisar''),
                    (''Sylvie'', ''Laramee'', ''Sylvie Laramee''),
                    (''Rene'', ''Saucier'', ''Rene Saucier''),
                    (''Aruna'', ''Cheema'', ''Aruna Cheema''),
                    (''Jagdish'', ''Shergill'', ''Jagdish Shergill''),
                    (''Gopichand'', ''Dutta'', ''Gopichand Dutta''),
                    (''Adrian'', ''Lindqvist'', ''Adrian Lindqvist''),
                    (''Renata'', ''Michnova'', ''Renata Michnova''),
                    (''Gunnar'', ''Bjorklund'', ''Gunnar Bjorklund''),
                    (''Binoba'', ''Dey'', ''Binoba Dey''),
                    (''Stefan'', ''Selezeanu'', ''Stefan Selezeanu''),
                    (''Amolik'', ''Chakraborty'', ''Amolik Chakraborty''),
                    (''Mai'', ''Ton'', ''Mai Ton''),
                    (''Rajendra'', ''Mulye'', ''Rajendra Mulye''),
                    (''Sushila'', ''Baruah'', ''Sushila Baruah''),
                    (''Jibek'', ''Juniskyzy'', ''Jibek Juniskyzy''),
                    (''Rabindra'', ''Kaul'', ''Rabindra Kaul''),
                    (''Lucia'', ''Hinojosa'', ''Lucia Hinojosa''),
                    (''Maija'', ''Lukstina'', ''Maija Lukstina''),
                    (''Rajanikant'', ''Pandit'', ''Rajanikant Pandit''),
                    (''Nichole '', ''Deslauriers'', ''Nichole  Deslauriers''),
                    (''Max'', ''Shand'', ''Max Shand''),
                    (''Farzana'', ''Abbasi'', ''Farzana Abbasi''),
                    (''Ekambar'', ''Bhuiyan'', ''Ekambar Bhuiyan''),
                    (''Dhanishta'', ''Pullela'', ''Dhanishta Pullela''),
                    (''Busarakham'', ''Kitjakarn'', ''Busarakham Kitjakarn''),
                    (''Manjunatha'', ''Karnik'', ''Manjunatha Karnik''),
                    (''Bianca'', ''Lack'', ''Bianca Lack''),
                    (''Viktoria'', ''Hudecova'', ''Viktoria Hudecova''),
                    (''Haarati'', ''Pendyala'', ''Haarati Pendyala''),
                    (''Bhagavateeprasaad'', ''Malladi'', ''Bhagavateeprasaad Malladi''),
                    (''Aykut'', ''ozkan'', ''Aykut ozkan''),
                    (''Essie'', ''Wimmer'', ''Essie Wimmer''),
                    (''Ivan'', ''Ignatyev'', ''Ivan Ignatyev''),
                    (''Sohail'', ''Shasthri'', ''Sohail Shasthri''),
                    (''Nils'', ''Kaulins'', ''Nils Kaulins''),
                    (''Suresh'', ''Singh'', ''Suresh Singh''),
                    (''Christian'', ''Couet'', ''Christian Couet''),
                    (''Tami'', ''Braggs'', ''Tami Braggs''),
                    (''Ian'', ''Olofsson'', ''Ian Olofsson''),
                    (''Juan'', ''Roy'', ''Juan Roy''),
                    (''Chandrani'', ''Dey'', ''Chandrani Dey''),
                    (''Esther'', ''Jobrani'', ''Esther Jobrani''),
                    (''Kristi'', ''Kuusik'', ''Kristi Kuusik''),
                    (''Abhaya'', ''Paruchuri'', ''Abhaya Paruchuri''),
                    (''Sung-Hwan'', ''Yoo'', ''Sung-Hwan Yoo''),
                    (''Amet'', ''Shergill'', ''Amet Shergill''),
                    (''Damla'', ''Yavuz'', ''Damla Yavuz''),
                    (''Naveen'', ''Scindia'', ''Naveen Scindia''),
                    (''Anurupa'', ''Mitra'', ''Anurupa Mitra''),
                    (''Raymond'', ''Beauchamp'', ''Raymond Beauchamp''),
                    (''Tara'', ''Kotadia'', ''Tara Kotadia''),
                    (''Arnost'', ''Hovorka'', ''Arnost Hovorka''),
                    (''Aive'', ''Petrov'', ''Aive Petrov''),
                    (''Tomo'', ''Vidovic'', ''Tomo Vidovic''),
                    (''Arundhati'', ''Majumdar'', ''Arundhati Majumdar''),
                    (''Marcela'', ''Mencikova'', ''Marcela Mencikova''),
                    (''Cosmina'', ''Leonte'', ''Cosmina Leonte''),
                    (''Linda'', ''Ohl'', ''Linda Ohl''),
                    (''Gulzar'', ''Sarkar'', ''Gulzar Sarkar''),
                    (''Carol'', ''Antonescu'', ''Carol Antonescu''),
                    (''Kyung-Soon'', ''Pak'', ''Kyung-Soon Pak''),
                    (''Jaroslav'', ''Fisar'', ''Jaroslav Fisar''),
                    (''Amrita'', ''Ganguly'', ''Amrita Ganguly''),
                    (''Śani'', ''Shasthri'', ''Śani Shasthri''),
                    (''Ivan'', ''Arenas'', ''Ivan Arenas''),
                    (''Miljan'', ''Stojanovic'', ''Miljan Stojanovic''),
                    (''Tereza'', ''Cermakova'', ''Tereza Cermakova''),
                    (''Harendra'', ''Sonkar'', ''Harendra Sonkar''),
                    (''Taj'', ''Syme'', ''Taj Syme''),
                    (''Rajeev'', ''Sandhu'', ''Rajeev Sandhu''),
                    (''Alok'', ''Sridhara'', ''Alok Sridhara''),
                    (''Falgun'', ''Bagchi'', ''Falgun Bagchi''),
                    (''Kashi'', ''Singh'', ''Kashi Singh''),
                    (''Bong-Soo'', ''Ha'', ''Bong-Soo Ha''),
                    (''Damodara'', ''Trivedi'', ''Damodara Trivedi''),
                    (''Nguyen'', ''Banh'', ''Nguyen Banh''),
                    (''Lan'', ''Bach'', ''Lan Bach''),
                    (''Surya'', ''Kulkarni'', ''Surya Kulkarni''),
                    (''Afsar-ud-Din'', ''Zare'', ''Afsar-ud-Din Zare''),
                    (''Dita'', ''Kreslina'', ''Dita Kreslina''),
                    (''TunC'', ''Polat'', ''TunC Polat''),
                    (''Aleksandra'', ''Semjonov'', ''Aleksandra Semjonov''),
                    (''Bianh'', ''Banh'', ''Bianh Banh''),
                    (''Promita'', ''Chattopadhyay'', ''Promita Chattopadhyay''),
                    (''Alessandro'', ''Sagese'', ''Alessandro Sagese''),
                    (''Dinh'', ''Mai'', ''Dinh Mai''),
                    (''Cam'', ''Dinh'', ''Cam Dinh''),
                    (''Shyam'', ''Sarma'', ''Shyam Sarma''),
                    (''Ramesh'', ''Das'', ''Ramesh Das''),
                    (''Inna'', ''Kask'', ''Inna Kask''),
                    (''Luis'', ''Saucedo'', ''Luis Saucedo''),
                    (''Ilgonis'', ''Prieditis'', ''Ilgonis Prieditis''),
                    (''Min-ji'', ''Nan'', ''Min-ji Nan''),
                    (''Risto'', ''Lepmets'', ''Risto Lepmets''),
                    (''Vjekoslava'', ''Brkic'', ''Vjekoslava Brkic''),
                    (''Spidols'', ''Podnieks'', ''Spidols Podnieks''),
                    (''Orions'', ''Podnieks'', ''Orions Podnieks''),
                    (''Kristine'', ''Zvaigzne'', ''Kristine Zvaigzne''),
                    (''Kalyani'', ''Benjaree'', ''Kalyani Benjaree''),
                    (''Gadhar'', ''Das'', ''Gadhar Das''),
                    (''Sashi'', ''Dev'', ''Sashi Dev''),
                    (''Bhadram'', ''Kamasamudram'', ''Bhadram Kamasamudram''),
                    (''Som'', ''Mukherjee'', ''Som Mukherjee''),
                    (''Kyle'', ''Redd'', ''Kyle Redd''),
                    (''Śani'', ''Sarkar'', ''Śani Sarkar''),
                    (''Narendra'', ''Tickoo'', ''Narendra Tickoo''),
                    (''Ganesh'', ''Majumdar'', ''Ganesh Majumdar''),
                    (''Anusuya'', ''Dutta'', ''Anusuya Dutta''),
                    (''Katarina'', ''Filipovic'', ''Katarina Filipovic''),
                    (''Dhanya'', ''Mokkapati'', ''Dhanya Mokkapati''),
                    (''Mehmet'', ''Arslan'', ''Mehmet Arslan''),
                    (''Gita'', ''Bhutia'', ''Gita Bhutia''),
                    (''Tapas'', ''Sikdar'', ''Tapas Sikdar''),
                    (''Lucija'', ''Cosic'', ''Lucija Cosic''),
                    (''Vitalijs'', ''Baltins'', ''Vitalijs Baltins''),
                    (''Kanchana'', ''Dutta'', ''Kanchana Dutta''),
                    (''Elvira'', ''Konovalova'', ''Elvira Konovalova''),
                    (''Preecha'', ''Suppamongkon'', ''Preecha Suppamongkon''),
                    (''Min-ji'', ''Shim'', ''Min-ji Shim''),
                    (''Noora'', ''Piili'', ''Noora Piili''),
                    (''Arshagouhi'', ''Deilami'', ''Arshagouhi Deilami''),
                    (''Risto'', ''Lill'', ''Risto Lill''),
                    (''Emma'', ''Van Zant'', ''Emma Van Zant''),
                    (''Hardi'', ''Laurits'', ''Hardi Laurits''),
                    (''Zoltan'', ''Gero'', ''Zoltan Gero''),
                    (''Soner'', ''Guler'', ''Soner Guler''),
                    (''Abhra'', ''Ganguly'', ''Abhra Ganguly''),
                    (''Fabrice'', ''Cloutier'', ''Fabrice Cloutier''),
                    (''Yonca'', ''Basturk'', ''Yonca Basturk''),
                    (''Nandita'', ''Bhuiyan'', ''Nandita Bhuiyan''),
                    (''Omar'', ''Lind'', ''Omar Lind''),
                    (''Mai'', ''Thai'', ''Mai Thai''),
                    (''David'', ''Novacek '', ''David Novacek ''),
                    (''Adriana'', ''Pena'', ''Adriana Pena''),
                    (''Rato'', ''Novakovic'', ''Rato Novakovic''),
                    (''Neelam'', ''Ahmadi'', ''Neelam Ahmadi''),
                    (''Phoung'', ''Du'', ''Phoung Du''),
                    (''Luca'', ''Barese'', ''Luca Barese''),
                    (''Aasaajyoeti'', ''Bhogireddy'', ''Aasaajyoeti Bhogireddy''),
                    (''Catherine'', ''Potts'', ''Catherine Potts''),
                    (''Aishwarya'', ''Tottempudi'', ''Aishwarya Tottempudi''),
                    (''Aarti'', ''Kommineni'', ''Aarti Kommineni''),
                    (''Lilli'', ''Peetre'', ''Lilli Peetre''),
                    (''Lassi'', ''Santala'', ''Lassi Santala''),
                    (''Umut'', ''Acar'', ''Umut Acar''),
                    (''Kevin'', ''Rummo'', ''Kevin Rummo''),
                    (''Nargis'', ''Shakiba'', ''Nargis Shakiba''),
                    (''Irma'', ''Berzina'', ''Irma Berzina''),
                    (''Irma'', ''Auzina'', ''Irma Auzina''),
                    (''Manindra'', ''Sidhu'', ''Manindra Sidhu''),
                    (''Aita'', ''Kasesalu'', ''Aita Kasesalu''),
                    (''Narayan'', ''Ogra'', ''Narayan Ogra''),
                    (''Amrita'', ''Shetty'', ''Amrita Shetty''),
                    (''Logan'', ''Dixon'', ''Logan Dixon''),
                    (''Celik'', ''TunC'', ''Celik TunC''),
                    (''David'', ''Jaramillo'', ''David Jaramillo''),
                    (''Gagan'', ''Sengupta'', ''Gagan Sengupta''),
                    (''Kalpana'', ''Sen'', ''Kalpana Sen''),
                    (''Charline'', ''Monjeau'', ''Charline Monjeau''),
                    (''Essie'', ''Braggs'', ''Essie Braggs''),
                    (''Teresa'', ''Fields'', ''Teresa Fields''),
                    (''Ron'', ''Williams'', ''Ron Williams''),
                    (''Daniela'', ''Lo Duca'', ''Daniela Lo Duca''),
                    (''Ashutosh'', ''Bandopadhyay'', ''Ashutosh Bandopadhyay''),
                    (''Cristina'', ''Angelo'', ''Cristina Angelo''),
                    (''Indranil'', ''Prabhupāda'', ''Indranil Prabhupāda''),
                    (''Julia'', ''Eder'', ''Julia Eder''),
                    (''Baebeesaroejini'', ''Veturi'', ''Baebeesaroejini Veturi''),
                    (''Giovanna'', ''Loggia'', ''Giovanna Loggia''),
                    (''Nicola'', ''Dellucci'', ''Nicola Dellucci''),
                    (''Pavel'', ''Bures'', ''Pavel Bures''),
                    (''Bhaamini'', ''Palagummi'', ''Bhaamini Palagummi''),
                    (''Cyrus'', ''Zardindoost'', ''Cyrus Zardindoost''),
                    (''Jautrite'', ''Avotina'', ''Jautrite Avotina''),
                    (''Matija'', ''Rusl'', ''Matija Rusl''),
                    (''Daniella'', ''Cavalcante'', ''Daniella Cavalcante''),
                    (''Vedrana'', ''Kovacevic'', ''Vedrana Kovacevic''),
                    (''Isa'', ''Hulsegge'', ''Isa Hulsegge''),
                    (''Ivana'', ''Popov'', ''Ivana Popov''),
                    (''Tuulikki'', ''Linna'', ''Tuulikki Linna''),
                    (''Allan'', ''Olofsson'', ''Allan Olofsson''),
                    (''Cosmin'', ''Vulpes'', ''Cosmin Vulpes''),
                    (''Dipti'', ''Shah'', ''Dipti Shah''),
                    (''Teresa'', ''Borgen'', ''Teresa Borgen''),
                    (''Veronika'', ''Necesana'', ''Veronika Necesana''),
                    (''Alfonso'', ''Barese'', ''Alfonso Barese''),
                    (''Erik'', ''Malk'', ''Erik Malk''),
                    (''Deepa'', ''Nandamuri'', ''Deepa Nandamuri''),
                    (''Arka'', ''Chatterjee'', ''Arka Chatterjee''),
                    (''Veronika'', ''Svancarova'', ''Veronika Svancarova''),
                    (''Felipe'', ''Robles'', ''Felipe Robles''),
                    (''Tami'', ''Shuler'', ''Tami Shuler''),
                    (''Flynn'', ''Moresby'', ''Flynn Moresby''),
                    (''Harsha'', ''Raju'', ''Harsha Raju''),
                    (''Aishwarya'', ''Dantuluri'', ''Aishwarya Dantuluri''),
                    (''Truman'', ''Schmidt'', ''Truman Schmidt''),
                    (''Divyendu'', ''Sen'', ''Divyendu Sen''),
                    (''Nhung'', ''Ton'', ''Nhung Ton''),
                    (''Cuneyt'', ''Arslan'', ''Cuneyt Arslan''),
                    (''Drishti'', ''Bose'', ''Drishti Bose''),
                    (''Farzana'', ''Habibi'', ''Farzana Habibi''),
                    (''Angelica'', ''Nilsson'', ''Angelica Nilsson''),
                    (''Arjun'', ''Bhowmick'', ''Arjun Bhowmick''),
                    (''Salamans'', ''Karklins'', ''Salamans Karklins''),
                    (''Hyun-Shik'', ''Lee'', ''Hyun-Shik Lee''),
                    (''Anand'', ''Mudaliyar'', ''Anand Mudaliyar''),
                    (''Carlos'', ''Aguayo'', ''Carlos Aguayo''),
                    (''Sharmila'', ''Bhutia'', ''Sharmila Bhutia''),
                    (''Hanita'', ''Nookala'', ''Hanita Nookala''),
                    (''Ondrej'', ''Polak'', ''Ondrej Polak''),
                    (''Serdar'', ''ozden'', ''Serdar ozden''),
                    (''Serdar'', ''ozCelik'', ''Serdar ozCelik''),
                    (''Javiera'', ''Laureano'', ''Javiera Laureano''),
                    (''Rafael'', ''Azevedo'', ''Rafael Azevedo''),
                    (''Raj'', ''Verma'', ''Raj Verma''),
                    (''Philippe'', ''Bellefeuille'', ''Philippe Bellefeuille''),
                    (''Arda'', ''Gunes'', ''Arda Gunes''),
                    (''Marcello'', ''Longo'', ''Marcello Longo''),
                    (''Marcela'', ''Antunes'', ''Marcela Antunes''),
                    (''Matteo'', ''Cattaneo'', ''Matteo Cattaneo''),
                    (''Prasad'', ''Raju'', ''Prasad Raju''),
                    (''Peep'', ''Lill'', ''Peep Lill''),
                    (''Chompoo'', ''Atitarn'', ''Chompoo Atitarn''),
                    (''Emma'', ''Salpa'', ''Emma Salpa''),
                    (''Le'', ''Chu'', ''Le Chu''),
                    (''Kailash'', ''Mittal'', ''Kailash Mittal''),
                    (''Pinja'', ''Pekkanen'', ''Pinja Pekkanen''),
                    (''Karita'', ''Jantunen'', ''Karita Jantunen''),
                    (''Antonio Carlos'', ''Rocha'', ''Antonio Carlos Rocha''),
                    (''Kim-ly'', ''Vanh'', ''Kim-ly Vanh''),
                    (''Cuc'', ''Du'', ''Cuc Du''),
                    (''Chaowalit'', ''Rojumanong'', ''Chaowalit Rojumanong''),
                    (''Maria'', ''Nechita'', ''Maria Nechita''),
                    (''Shirley'', ''Doane'', ''Shirley Doane''),
                    (''Roberto'', ''Sal'', ''Roberto Sal''),
                    (''Damyanti'', ''Bhamidipati'', ''Damyanti Bhamidipati''),
                    (''Aleksandrs'', ''Purins'', ''Aleksandrs Purins''),
                    (''Alen'', ''Kustrin'', ''Alen Kustrin''),
                    (''Urve'', ''Kasesalu'', ''Urve Kasesalu''),
                    (''David'', ''Serbanescu'', ''David Serbanescu''),
                    (''Nadir'', ''Seddigh'', ''Nadir Seddigh''),
                    (''Dhirendro'', ''Ghatak'', ''Dhirendro Ghatak''),
                    (''Monika'', ''Kozakova'', ''Monika Kozakova''),
                    (''Riccardo'', ''Esposito'', ''Riccardo Esposito''),
                    (''Aleksandra'', ''Abola'', ''Aleksandra Abola''),
                    (''Agrita'', ''Abele'', ''Agrita Abele''),
                    (''Sabrina'', ''Baresi'', ''Sabrina Baresi''),
                    (''Mudar'', ''Mihajlovik'', ''Mudar Mihajlovik''),
                    (''Liga'', ''Dumina'', ''Liga Dumina''),
                    (''Buu'', ''Tran'', ''Buu Tran''),
                    (''Annette '', ''Hetu'', ''Annette  Hetu''),
                    (''Sami'', ''Lundin'', ''Sami Lundin''),
                    (''Sylvie'', ''Methot'', ''Sylvie Methot''),
                    (''Petr'', ''Spousta'', ''Petr Spousta''),
                    (''Lorenzo'', ''Howland'', ''Lorenzo Howland''),
                    (''Fatima'', ''Pulido'', ''Fatima Pulido''),
                    (''Rui'', ''Carvalho'', ''Rui Carvalho'')) AS Names(FirstName, LastName, FullName)
        ),
        UnusedNames
        AS
        (
            SELECT *
            FROM NamesToUse AS ntu
            WHERE NOT EXISTS (SELECT 1 FROM [Application].People AS p WHERE p.FullName = ntu.FullName)
        )
        SELECT TOP(1) @PrimaryContactFullName = un.FullName,
                      @PrimaryContactFirstName = un.FirstName
        FROM UnusedNames AS un
        ORDER BY NEWID();

        SET @CustomerID = NEXT VALUE FOR Sequences.CustomerID;
        SET @CustomerCategoryID = (SELECT TOP(1) CustomerCategoryID
                                   FROM Sales.CustomerCategories
                                   WHERE CustomerCategoryName IN (N''Novelty Shop'', N''Supermarket'', N''Computer Store'', N''Gift Store'', N''Corporate'')
                                   ORDER BY NEWID());
        SET @CityID = (SELECT TOP(1) CityID FROM [Application].Cities AS c
                                            ORDER BY NEWID());
        SET @CityName = (SELECT CityName FROM [Application].Cities WHERE CityID = @CityID);
        SET @CityStateProvinceID = (SELECT StateProvinceID FROM [Application].Cities WHERE CityID = @CityID);
        SET @CityStateProvinceCode = (SELECT StateProvinceCode
                                      FROM [Application].StateProvinces
                                      WHERE StateProvinceID = @CityStateProvinceID);
        SET @AreaCode = DataLoadSimulation.GetAreaCode(@CityStateProvinceCode);
        SET @StreetSuffix = (SELECT TOP(1) StreetType
                             FROM (VALUES(N''Street''), (N''Lane''), (N''Avenue''), (N''Boulevard''), (N''Crescent''), (N''Road'')) AS st(StreetType)
                             ORDER BY NEWID());
        SET @CompanySuffix = (SELECT TOP(1) CompanySuffix
                              FROM (VALUES(N''Inc''), (N''Corp''), (N''LLC'')) AS cs(CompanySuffix)
                              ORDER BY NEWID());
        SET @StorePrefix = (SELECT TOP(1) StorePrefix
                            FROM (VALUES(N''Shop''), (N''Suite''), (N''Unit'')) AS sp(StorePrefix)
                            ORDER BY NEWID());
        SET @CreditLimit = CEILING(RAND() * 30) * 100 + 1000;

        SET @DeliveryAddressLine1 = @StorePrefix + N'' '' + CAST(CEILING(RAND() * 30) + 1 AS nvarchar(20));
        SET @DeliveryAddressLine2 = CAST(CEILING(RAND() * 2000) + 1 AS nvarchar(20)) + N'' ''
                                  + (SELECT TOP(1) PreferredName FROM [Application].People ORDER BY NEWID())
                                  + N'' '' + @StreetSuffix;
        SET @DeliveryPostalCode = CAST(CEILING(RAND() * 800) + 90000 AS nvarchar(20));
        SET @PostalAddressLine1 = N''PO Box '' + CAST(CEILING(RAND() * 10000) + 10 AS nvarchar(20));
        SET @PostalAddressLine2 = (SELECT TOP(1) PreferredName FROM [Application].People ORDER BY NEWID()) + N''ville'';
        SET @PostalPostalCode = @DeliveryPostalCode;

        SET @PrimaryContactPersonID = NEXT VALUE FOR Sequences.PersonID;

        BEGIN TRAN;

        INSERT [Application].People
            (PersonID, FullName, PreferredName, IsPermittedToLogon, LogonName,
             IsExternalLogonProvider, HashedPassword, IsSystemUser, IsEmployee,
             IsSalesperson, UserPreferences, PhoneNumber, FaxNumber,
             EmailAddress, LastEditedBy, ValidFrom, ValidTo)
        VALUES
            (@PrimaryContactPersonID, @PrimaryContactFullName, @PrimaryContactFirstName, 0, N''NO LOGON'',
             0, NULL, 0, 0,
             0, NULL, N''('' + CAST(@AreaCode AS nvarchar(20)) + N'') 555-0100'', N''('' + CAST(@AreaCode AS nvarchar(20)) + N'') 555-0101'',
             LOWER(REPLACE(@PrimaryContactFirstName, N'''''''', N'''')) + N''@example.com'', 1, @CurrentDateTime, @EndOfTime);

        INSERT Sales.Customers
            (CustomerID, CustomerName, BillToCustomerID, CustomerCategoryID,
             BuyingGroupID, PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID,
             DeliveryCityID, PostalCityID, CreditLimit, AccountOpenedDate, StandardDiscountPercentage,
             IsStatementSent, IsOnCreditHold, PaymentDays, PhoneNumber, FaxNumber,
             DeliveryRun, RunPosition, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2,
             DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2,
             PostalPostalCode, LastEditedBy, ValidFrom, ValidTo)
         VALUES
            (@CustomerID, @PrimaryContactFullName, @CustomerID, @CustomerCategoryID,
             NULL, @PrimaryContactPersonID, NULL, @DeliveryMethodID,
             @CityID, @CityID, @CreditLimit, @StartingWhen, 0,
             0, 0, 7, N''('' + CAST(@AreaCode AS nvarchar(20)) + N'') 555-0100'', N''('' + CAST(@AreaCode AS nvarchar(20)) + N'') 555-0101'',
             NULL, NULL, N''http://www.microsoft.com/'', @DeliveryAddressLine1, @DeliveryAddressLine2,
             @DeliveryPostalCode, (SELECT TOP(1) Location FROM [Application].Cities WHERE CityID = @CityID),
             @PostalAddressLine1, @PostalAddressLine2,
             @PostalPostalCode, 1, @CurrentDateTime, @EndOfTime);

        COMMIT;

        SET @Counter += 1;
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'AddSpecialDeals')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.AddSpecialDeals
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF CAST(@CurrentDateTime AS date) = ''20151231''
    BEGIN
        BEGIN TRAN;

        INSERT Sales.SpecialDeals
            (StockItemID, CustomerID, BuyingGroupID, CustomerCategoryID, StockGroupID,
             DealDescription, StartDate, EndDate, DiscountAmount, DiscountPercentage,
             UnitPrice, LastEditedBy, LastEditedWhen)
        VALUES
            (NULL, NULL, (SELECT BuyingGroupID FROM Sales.BuyingGroups WHERE BuyingGroupName = N''Wingtip Toys''),
             NULL, (SELECT StockGroupID FROM Warehouse.StockGroups WHERE StockGroupName = N''USB Novelties''),
             N''10% 1st qtr USB Wingtip'', ''20160101'', ''20160331'', NULL, 10, NULL,
             2, @StartingWhen);

        INSERT Sales.SpecialDeals
            (StockItemID, CustomerID, BuyingGroupID, CustomerCategoryID, StockGroupID,
             DealDescription, StartDate, EndDate, DiscountAmount, DiscountPercentage,
             UnitPrice, LastEditedBy, LastEditedWhen)
        VALUES
            (NULL, NULL, (SELECT BuyingGroupID FROM Sales.BuyingGroups WHERE BuyingGroupName = N''Tailspin Toys''),
             NULL, (SELECT StockGroupID FROM Warehouse.StockGroups WHERE StockGroupName = N''USB Novelties''),
             N''15% 2nd qtr USB Tailspin'', ''20160401'', ''20160630'', NULL, 15, NULL,
             2, @StartingWhen);

        COMMIT;

    END;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Adding special deals'';
    END;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'AddStockItems')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.AddStockItems
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @NumberOfStockItems int = 0;

    IF CAST(@CurrentDateTime AS date) = ''20160101''
    BEGIN
        SET @NumberOfStockItems = 2;

        BEGIN TRAN;

        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (220,''Novelty chilli chocolates 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8302039293929'',10,8.55,12.23,0.25,''Watch your friends faces when they eat these'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (221,''Novelty chilli chocolates 500g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''500g'',3,12,1,''8302039293647'',10,14.5,20.74,0.5,''Watch your friends faces when they eat these'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (220,360,''CH-1'',360,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (221,12,''CH-2'',12,8.75,120,250,1,@CurrentDateTime);
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 220, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 221, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');

        COMMIT;

    END ELSE IF CAST(@CurrentDateTime AS date) = ''20160102''
    BEGIN
        SET @NumberOfStockItems = 2;

        BEGIN TRAN;

        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (222,''Chocolate beetles 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293820'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (223,''Chocolate echidnas 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293728'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (222,120,''CH-3'',120,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (223,120,''CH-4'',120,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 222, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 223, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');

        COMMIT;

    END ELSE IF CAST(@CurrentDateTime AS date) = ''20160104''
    BEGIN
        SET @NumberOfStockItems = 2;

        BEGIN TRAN;

        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (224,''Chocolate frogs 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293987'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (225,''Chocolate sharks 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293234'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (224,144,''CH-5'',144,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (225,160,''CH-6'',160,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 224, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 225, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');

        COMMIT;

    END ELSE IF CAST (@CurrentDateTime AS date) = ''20160105''
    BEGIN
        SET @NumberOfStockItems = 2;

        BEGIN TRAN;

        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (226,''White chocolate snow balls 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293236'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItems (StockItemID, StockItemName, SupplierID, ColorID,  UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields, LastEditedBy, ValidFrom, ValidTo) VALUES (227,''White chocolate moon rocks 250g'',(SELECT SupplierID FROM Purchasing.Suppliers WHERE SupplierName = N''A Datum Corporation''),(SELECT ColorID FROM Warehouse.Colors WHERE ColorName = N''NULL''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Bag''),(SELECT PackageTypeID FROM Warehouse.PackageTypes WHERE PackageTypeName = N''Carton''),NULL,''250g'',3,24,1,''8792838293289'',10,8.55,12.23,0.25,''Perfect for your child''''s party'',NULL,NULL,NULL,1,@CurrentDateTime,@EndOfTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (226,24,''CH-7'',24,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemHoldings (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy, LastEditedWhen) VALUES (227,48,''CH-8'',48,4.75,240,500,1,@CurrentDateTime);
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 226, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');
        INSERT Warehouse.StockItemStockGroups (StockItemID, StockGroupID, LastEditedBy, LastEditedWhen) SELECT 227, sg.StockGroupID, 1, @CurrentDateTime FROM Warehouse.StockGroups AS sg WHERE sg.StockGroupName IN (N''Novelty Items'', N''Edible Novelties'');

        COMMIT;
    END;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Adding '' + CAST(@NumberOfStockItems AS nvarchar(20)) + N'' stock items'';
    END;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'ChangePasswords')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.ChangePasswords
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    -- 1 in 4 days will be 1 password change, 1 in 8 days will be 2 passwords changed

    DECLARE @NumberOfPasswordsToChange int = (SELECT TOP(1) Quantity
                                              FROM (VALUES (0), (0), (0), (0), (0), (1), (1), (2)) AS q(Quantity)
                                              ORDER BY NEWID());
    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Changing '' + CAST(@NumberOfPasswordsToChange AS nvarchar(20)) + N'' passwords'';
    END;

    DECLARE @Counter int = 0;
    DECLARE @PersonID int;
    DECLARE @EmailAddress nvarchar(256);
    DECLARE @HashedPassword varbinary(max);
    DECLARE @FullName nvarchar(50);

    WHILE @Counter < @NumberOfPasswordsToChange
    BEGIN
        SELECT TOP(1) @PersonID = PersonID,
                      @EmailAddress = EmailAddress,
                      @FullName = FullName
        FROM [Application].People
        WHERE IsPermittedToLogon <> 0 AND PersonID <> 1
        ORDER BY NEWID();

        UPDATE [Application].People
        SET HashedPassword = HASHBYTES(N''SHA2_256'', N''SQLRocks!00'' + @FullName),
            [ValidFrom] = @StartingWhen
        WHERE PersonID = @PersonID;

        SET @Counter += 1;
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'CreateCustomerOrders')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.CreateCustomerOrders
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@NumberOfCustomerOrders int,
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Creating '' + CAST(@NumberOfCustomerOrders AS nvarchar(20)) + N'' customer orders'';
    END;

    DECLARE @OrderCounter int = 0;
    DECLARE @OrderLineCounter int = 0;
    DECLARE @CustomerID int;
    DECLARE @OrderID int;
    DECLARE @PrimaryContactPersonID int;
    DECLARE @SalespersonPersonID int;
    DECLARE @ExpectedDeliveryDate date = DATEADD(day, 1, @CurrentDateTime);
    DECLARE @OrderDateTime datetime = @StartingWhen;
    DECLARE @NumberOfOrderLines int;
    DECLARE @StockItemID int;
    DECLARE @StockItemName nvarchar(100);
    DECLARE @UnitPackageID int;
    DECLARE @QuantityPerOuter int;
    DECLARE @Quantity int;
    DECLARE @CustomerPrice decimal(18,2);
    DECLARE @TaxRate decimal(18,3);

    -- No deliveries on weekends

    SET DATEFIRST 7;

    WHILE DATEPART(weekday, @ExpectedDeliveryDate) IN (1, 7)
    BEGIN
        SET @ExpectedDeliveryDate = DATEADD(day, 1, @ExpectedDeliveryDate);
    END;

    -- Generate the required orders

    WHILE @OrderCounter < @NumberOfCustomerOrders
    BEGIN

        BEGIN TRAN;

        SET @OrderID = NEXT VALUE FOR Sequences.OrderID;

        SELECT TOP(1) @CustomerID = c.CustomerID,
                      @PrimaryContactPersonID = c.PrimaryContactPersonID
        FROM Sales.Customers AS c
        WHERE c.IsOnCreditHold = 0
        ORDER BY NEWID();

        SET @SalespersonPersonID = (SELECT TOP(1) PersonID
                                    FROM [Application].People
                                    WHERE IsSalesperson <> 0
                                    ORDER BY NEWID());

        INSERT Sales.Orders
            (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID, OrderDate,
             ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments,
             PickingCompletedWhen, LastEditedBy, LastEditedWhen)
        VALUES
            (@OrderID, @CustomerID, @SalespersonPersonID, NULL, @PrimaryContactPersonID, NULL, @CurrentDateTime,
             @ExpectedDeliveryDate, CAST(CEILING(RAND() * 10000) + 10000 AS nvarchar(20)), 1, NULL, NULL, NULL,
             NULL, 1, @OrderDateTime);

        SET @NumberOfOrderLines = 1 + CEILING(RAND() * 4);
        SET @OrderLineCounter = 0;

        WHILE @OrderLineCounter < @NumberOfOrderLines
        BEGIN
            SELECT TOP(1) @StockItemID = si.StockItemID,
                          @StockItemName = si.StockItemName,
                          @UnitPackageID = si.UnitPackageID,
                          @QuantityPerOuter = si.QuantityPerOuter,
                          @TaxRate = si.TaxRate
            FROM Warehouse.StockItems AS si
            WHERE NOT EXISTS (SELECT 1 FROM Sales.OrderLines AS ol
                                       WHERE ol.OrderID = @OrderID
                                       AND ol.StockItemID = si.StockItemID)
            ORDER BY NEWID();

            SET @Quantity = @QuantityPerOuter * (1 + FLOOR(RAND() * 10));
            SET @CustomerPrice = Website.CalculateCustomerPrice(@CustomerID, @StockItemID, @CurrentDateTime);

            INSERT Sales.OrderLines
                (OrderID, StockItemID, [Description], PackageTypeID, Quantity, UnitPrice,
                 TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
            VALUES
                (@OrderID, @StockItemID, @StockItemName, @UnitPackageID, @Quantity, @CustomerPrice,
                 @TaxRate, 0, NULL, 1, @StartingWhen);

            SET @OrderLineCounter += 1;
        END;

        COMMIT;

        SET @OrderCounter += 1;
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'InvoicePickedOrders')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.InvoicePickedOrders
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Invoicing picked orders'';
    END;

    DECLARE @OrderID int;
    DECLARE @InvoiceID int;
    DECLARE @PickingCompletedWhen datetime;
    DECLARE @BackorderOrderID int;
    DECLARE @BillToCustomerID int;
    DECLARE @InvoicingPersonID int = (SELECT TOP(1) PersonID FROM [Application].People WHERE IsEmployee <> 0 ORDER BY NEWID());
    DECLARE @PackedByPersonID int = (SELECT TOP(1) PersonID FROM [Application].People WHERE IsEmployee <> 0 ORDER BY NEWID());
    DECLARE @TotalDryItems int;
    DECLARE @TotalChillerItems int;
    DECLARE @TransactionAmount decimal(18,2);
    DECLARE @TaxAmount decimal(18,2);
    DECLARE @ReturnedDeliveryData nvarchar(max);
    DECLARE @DeliveryEvent nvarchar(max);

    DECLARE OrderList CURSOR FAST_FORWARD READ_ONLY
    FOR
    SELECT o.OrderID, o.PickingCompletedWhen, c.BillToCustomerID
    FROM Sales.Orders AS o
    INNER JOIN Sales.Customers AS c
    ON o.CustomerID = c.CustomerID
    WHERE NOT EXISTS (SELECT 1 FROM Sales.Invoices AS i WHERE i.OrderID = o.OrderID)  -- not already invoiced
    AND c.IsOnCreditHold = 0                                                          -- and customer not on credit hold
    AND ((o.PickingCompletedWhen IS NOT NULL)                                         -- order completely picked
        OR (o.PickingCompletedWhen IS NULL                                            -- order not picked but customer happy
            AND o.IsUndersupplyBackordered <> 0                                       -- for part shipments and at least one
            AND EXISTS (SELECT 1 FROM Sales.OrderLines AS ol                          -- order line has been picked
                                 WHERE ol.OrderID = o.OrderID
                                 AND ol.PickingCompletedWhen IS NOT NULL)));

    OPEN OrderList;
    FETCH NEXT FROM OrderList INTO @OrderID, @PickingCompletedWhen, @BillToCustomerID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @PickingCompletedWhen IS NULL
        BEGIN -- need to reorder undersupplied items

            BEGIN TRAN;

            SET @BackorderOrderID = NEXT VALUE FOR Sequences.OrderID;
            SET @PickingCompletedWhen = @StartingWhen;

            -- create the backorder order
            INSERT Sales.Orders
                (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID,
                 OrderDate, ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered,
                 Comments, DeliveryInstructions, InternalComments, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
            SELECT @BackorderOrderID, o.CustomerID, o.SalespersonPersonID, NULL, o.ContactPersonID, NULL,
                   o.OrderDate, o.ExpectedDeliveryDate, o.CustomerPurchaseOrderNumber, 1,
                   o.Comments, o.DeliveryInstructions, o.InternalComments, NULL, @InvoicingPersonID, @StartingWhen
            FROM Sales.Orders AS o
            WHERE o.OrderID = @OrderID;

            -- move the items that haven''t been supplied to the new order
            UPDATE Sales.OrderLines
            SET OrderID = @BackorderOrderID,
                LastEditedBy = @InvoicingPersonID,
                LastEditedWhen = @StartingWhen
            WHERE OrderID = @OrderID
            AND PickingCompletedWhen IS NULL;

            -- flag the original order as backordered and picking completed
            UPDATE Sales.Orders
            SET BackorderOrderID = @BackorderOrderID,
                PickingCompletedWhen = @PickingCompletedWhen,
                LastEditedBy = @InvoicingPersonID,
                LastEditedWhen = @StartingWhen
            WHERE OrderID = @OrderID;

            COMMIT;
        END;

        SELECT @TotalDryItems = SUM(CASE WHEN si.IsChillerStock <> 0 THEN 0 ELSE 1 END),
               @TotalChillerItems = SUM(CASE WHEN si.IsChillerStock <> 0 THEN 1 ELSE 0 END)
        FROM Sales.OrderLines AS ol
        INNER JOIN Warehouse.StockItems AS si
        ON ol.StockItemID = si.StockItemID
        WHERE ol.OrderID = @OrderID;

        -- now invoice whatever is left on the order
        BEGIN TRAN;

        SET @InvoiceID = NEXT VALUE FOR Sequences.InvoiceID;

        SET @ReturnedDeliveryData = N''{"Events": []}'';
        SET @DeliveryEvent = N''{ }'';

        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Event'', N''Ready for collection'');
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.EventTime'', CONVERT(nvarchar(20), @StartingWhen, 126));
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.ConNote'', N''EAN-125-'' + CAST(@InvoiceID + 1050 AS nvarchar(20)));

        SET @ReturnedDeliveryData = JSON_MODIFY(@ReturnedDeliveryData, N''append $.Events'', JSON_QUERY(@DeliveryEvent));

        INSERT Sales.Invoices
            (InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID, ContactPersonID, AccountsPersonID,
             SalespersonPersonID, PackedByPersonID, InvoiceDate, CustomerPurchaseOrderNumber,
             IsCreditNote, CreditNoteReason, Comments, DeliveryInstructions, InternalComments,
             TotalDryItems, TotalChillerItems,
             DeliveryRun, RunPosition, ReturnedDeliveryData, LastEditedBy, LastEditedWhen)
        SELECT @InvoiceID, c.CustomerID, @BillToCustomerID, @OrderID, c.DeliveryMethodID, o.ContactPersonID, btc.PrimaryContactPersonID,
               o.SalespersonPersonID, @PackedByPersonID, @StartingWhen, o.CustomerPurchaseOrderNumber,
               0, NULL, NULL, c.DeliveryAddressLine1 + N'', '' + c.DeliveryAddressLine2, NULL,
               @TotalDryItems, @TotalChillerItems,
               c.DeliveryRun, c.RunPosition, @ReturnedDeliveryData, @InvoicingPersonID, @StartingWhen
        FROM Sales.Orders AS o
        INNER JOIN Sales.Customers AS c
        ON o.CustomerID = c.CustomerID
        INNER JOIN Sales.Customers AS btc
        ON btc.CustomerID = c.BillToCustomerID
        WHERE o.OrderID = @OrderID;

        INSERT Sales.InvoiceLines
            (InvoiceID, StockItemID, [Description], PackageTypeID,
             Quantity, UnitPrice, TaxRate, TaxAmount, LineProfit, ExtendedPrice,
             LastEditedBy, LastEditedWhen)
        SELECT @InvoiceID, ol.StockItemID, ol.[Description], ol.PackageTypeID,
               ol.PickedQuantity, ol.UnitPrice, ol.TaxRate,
               ROUND(ol.PickedQuantity * ol.UnitPrice * ol.TaxRate / 100.0, 2),
               ROUND(ol.PickedQuantity * (ol.UnitPrice - sih.LastCostPrice), 2),
               ROUND(ol.PickedQuantity * ol.UnitPrice, 2)
                 + ROUND(ol.PickedQuantity * ol.UnitPrice * ol.TaxRate / 100.0, 2),
               @InvoicingPersonID, @StartingWhen
        FROM Sales.OrderLines AS ol
        INNER JOIN Warehouse.StockItems AS si
        ON ol.StockItemID = si.StockItemID
        INNER JOIN Warehouse.StockItemHoldings AS sih
        ON si.StockItemID = sih.StockItemID
        WHERE ol.OrderID = @OrderID
        ORDER BY ol.OrderLineID;

        INSERT Warehouse.StockItemTransactions
            (StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID,
             TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen)
        SELECT il.StockItemID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Stock Issue''),
               i.CustomerID, i.InvoiceID, NULL, NULL,
               @StartingWhen, 0 - il.Quantity, @InvoicingPersonID, @StartingWhen
        FROM Sales.InvoiceLines AS il
        INNER JOIN Sales.Invoices AS i
        ON il.InvoiceID = i.InvoiceID
        WHERE i.InvoiceID = @InvoiceID
        ORDER BY il.InvoiceLineID;

        WITH StockItemTotals
        AS
        (
            SELECT il.StockItemID, SUM(il.Quantity) AS TotalQuantity
            FROM Sales.InvoiceLines aS il
            WHERE il.InvoiceID = @InvoiceID
            GROUP BY il.StockItemID
        )
        UPDATE sih
        SET sih.QuantityOnHand -= sit.TotalQuantity,
            sih.LastEditedBy = @InvoicingPersonID,
            sih.LastEditedWhen = @StartingWhen
        FROM Warehouse.StockItemHoldings AS sih
        INNER JOIN StockItemTotals AS sit
        ON sih.StockItemID = sit.StockItemID;

        SELECT @TransactionAmount = SUM(il.ExtendedPrice),
               @TaxAmount = SUM(il.TaxAmount)
        FROM Sales.InvoiceLines AS il
        WHERE il.InvoiceID = @InvoiceID;

        INSERT Sales.CustomerTransactions
            (CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID,
             TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount,
             OutstandingBalance, FinalizationDate, LastEditedBy, LastEditedWhen)
        VALUES
            (@BillToCustomerID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Customer Invoice''),
             @InvoiceID, NULL,
             @StartingWhen, @TransactionAmount - @TaxAmount, @TaxAmount, @TransactionAmount,
             @TransactionAmount, NULL, @InvoicingPersonID, @StartingWhen);

        COMMIT;
        FETCH NEXT FROM OrderList INTO @OrderID, @PickingCompletedWhen, @BillToCustomerID;
    END;

    CLOSE OrderList;
    DEALLOCATE OrderList;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'MakeTemporalChanges')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.MakeTemporalChanges
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Counter int;
    DECLARE @RowsToModify int;
    DECLARE @StaffMember int = (SELECT TOP(1) PersonID FROM [Application].People WHERE IsEmployee <> 0 ORDER BY NEWID());

    IF DAY(@StartingWhen) = 1 AND MONTH(@StartingWhen) = 7
    BEGIN
        SET @Counter = 0;
        SET @RowsToModify = CEILING(RAND() * 20);

        WHILE @Counter < @RowsToModify
        BEGIN
            UPDATE [Application].Cities
            SET LatestRecordedPopulation = LatestRecordedPopulation * 1.04,
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE CityID = (SELECT TOP(1) CityID FROM [Application].Cities ORDER BY NEWID());
            SET @Counter += 1;
        END;
    END;

    IF DAY(@StartingWhen) = 1 AND MONTH(@StartingWhen) = 7
    BEGIN
        SET @Counter = 0;
        SET @RowsToModify = CEILING(RAND() * 20);

        WHILE @Counter < @RowsToModify
        BEGIN
            UPDATE [Application].StateProvinces
            SET LatestRecordedPopulation = LatestRecordedPopulation * 1.04,
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE StateProvinceID = (SELECT TOP(1) StateProvinceID FROM [Application].StateProvinces ORDER BY NEWID());
            SET @Counter += 1;
        END;
    END;

    IF DAY(@StartingWhen) = 1 AND MONTH(@StartingWhen) = 7
    BEGIN
        SET @Counter = 0;
        SET @RowsToModify = CEILING(RAND() * 20);

        WHILE @Counter < @RowsToModify
        BEGIN
            UPDATE [Application].Countries
            SET LatestRecordedPopulation = LatestRecordedPopulation * 1.04,
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE CountryID = (SELECT TOP(1) CountryID FROM [Application].Countries ORDER BY NEWID());
            SET @Counter += 1;
        END;
    END;

    IF CAST(@StartingWhen AS date) = ''20150101''
    BEGIN
        UPDATE [Application].DeliveryMethods
            SET DeliveryMethodName = N''Chilled Van'',
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE DeliveryMethodName = N''Van with Chiller'';
    END;

    IF CAST(@StartingWhen AS date) = ''20160101''
    BEGIN
        UPDATE [Application].PaymentMethods
            SET PaymentMethodName = N''Credit-Card'',
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE PaymentMethodName = N''Credit Card'';

        INSERT [Application].TransactionTypes
            (TransactionTypeName, LastEditedBy, ValidFrom, ValidTo)
        VALUES
            (N''Contra'', @StaffMember, @StartingWhen, @EndOfTime);

        UPDATE [Application].TransactionTypes
            SET TransactionTypeName = N''Customer Contra'',
                LastEditedBy = @StaffMember,
                ValidFrom = DATEADD(minute, 5, @StartingWhen)
            WHERE TransactionTypeName = N''Contra'';

        UPDATE Warehouse.Colors
            SET ColorName = N''Steel Gray'',
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE ColorName = N''Gray'';

        INSERT Warehouse.PackageTypes
            (PackageTypeName, LastEditedBy, ValidFrom, ValidTo)
        VALUES
            (N''Bin'', @StaffMember, @StartingWhen, @EndOfTime);

        DELETE Warehouse.PackageTypes WHERE PackageTypeName = N''Bin'';

        UPDATE Warehouse.StockGroups
            SET StockGroupName = N''Furry Footwear'',
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE StockGroupName = N''Footwear'';
    END;

    IF CAST(@StartingWhen AS date) = ''20150101''
    BEGIN
        UPDATE Purchasing.SupplierCategories
            SET SupplierCategoryName = N''Courier Services Supplier'',
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE SupplierCategoryName = N''Courier'';
    END;

    IF CAST(@StartingWhen AS date) = ''20140101''
    BEGIN
        INSERT Sales.CustomerCategories
            (CustomerCategoryName, LastEditedBy, ValidFrom, ValidTo)
        VALUES
            (N''Retailer'', 1, @StartingWhen, @EndOfTime);

        UPDATE Sales.CustomerCategories
            SET CustomerCategoryName = N''General Retailer'',
                LastEditedBy = @StaffMember,
                ValidFrom = DATEADD(minute, 15, @StartingWhen)
            WHERE CustomerCategoryName = N''Retailer'';
    END;

    IF DAY(@StartingWhen) = 1 AND MONTH(@StartingWhen) = 7
    BEGIN
        SET @Counter = 0;
        SET @RowsToModify = CEILING(RAND() * 20);

        WHILE @Counter < @RowsToModify
        BEGIN
            UPDATE Sales.Customers
            SET CreditLimit = CreditLimit * 1.05,
                LastEditedBy = @StaffMember,
                ValidFrom = @StartingWhen
            WHERE CustomerID = (SELECT TOP(1) CustomerID FROM Sales.Customers WHERE CreditLimit > 0 ORDER BY NEWID());
            SET @Counter += 1;
        END;
    END;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Modifying a few temporal items '';
    END;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'PaySuppliers')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.PaySuppliers
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Paying suppliers'';
    END;

    DECLARE @StaffMemberPersonID int = (SELECT TOP(1) PersonID
                                        FROM [Application].People
                                        WHERE IsEmployee <> 0
                                        ORDER BY NEWID());

    DECLARE @TransactionsToPay TABLE
    (
        SupplierTransactionID int,
        SupplierID int,
        PurchaseOrderID int NULL,
        SupplierInvoiceNumber nvarchar(20) NULL,
        OutstandingBalance decimal(18,2)
    );

    INSERT @TransactionsToPay
        (SupplierTransactionID, SupplierID, PurchaseOrderID, SupplierInvoiceNumber, OutstandingBalance)
    SELECT SupplierTransactionID, SupplierID, PurchaseOrderID, SupplierInvoiceNumber, OutstandingBalance
    FROM Purchasing.SupplierTransactions
    WHERE IsFinalized = 0;

    BEGIN TRAN;

    UPDATE Purchasing.SupplierTransactions
    SET OutstandingBalance = 0,
        FinalizationDate = @StartingWhen,
        LastEditedBy = @StaffMemberPersonID,
        LastEditedWhen = @StartingWhen
    WHERE SupplierTransactionID IN (SELECT SupplierTransactionID FROM @TransactionsToPay);

    INSERT Purchasing.SupplierTransactions
        (SupplierID, TransactionTypeID, PurchaseOrderID, PaymentMethodID,
         SupplierInvoiceNumber, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount,
         OutstandingBalance, FinalizationDate, LastEditedBy, LastEditedWhen)
    SELECT ttp.SupplierID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Supplier Payment Issued''),
           NULL, (SELECT PaymentMethodID FROM [Application].PaymentMethods WHERE PaymentMethodName = N''EFT''),
           NULL, CAST(@StartingWhen AS date), 0, 0, 0 - SUM(ttp.OutstandingBalance),
           0, CAST(@StartingWhen AS date), @StaffMemberPersonID, @StartingWhen
    FROM @TransactionsToPay AS ttp
    GROUP BY ttp.SupplierID;

    COMMIT;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'PerformStocktake')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.PerformStocktake
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Performing stocktake'';
    END;

    DECLARE @StaffMemberPersonID int = (SELECT TOP(1) PersonID
                                        FROM [Application].People
                                        WHERE IsEmployee <> 0
                                        ORDER BY NEWID());

    DECLARE @Counter int = 0;
    DECLARE @NumberOfAdjustedStockItems int = (SELECT CEILING(RAND() * 5));
    DECLARE @StockItemIDToAdjust int;
    DECLARE @QuantityToAdjust int;

    BEGIN TRAN;

    UPDATE Warehouse.StockItemHoldings
    SET LastStocktakeQuantity = QuantityOnHand,
        LastEditedBy = @StaffMemberPersonID,
        LastEditedWhen = @StartingWhen;

    WHILE @Counter < @NumberOfAdjustedStockItems
    BEGIN
        SET @QuantityToAdjust = 5 - CEILING(RAND() * 10);
        SET @StockItemIDToAdjust = (SELECT TOP(1) StockItemID
                                    FROM Warehouse.StockItemHoldings
                                    WHERE (QuantityOnHand + @QuantityToAdjust) >= 0
                                    ORDER BY NEWID());

        IF @StockItemIDToAdjust IS NOT NULL
        BEGIN

            UPDATE Warehouse.StockItemHoldings
            SET LastStocktakeQuantity += @QuantityToAdjust,
                LastEditedBy = @StaffMemberPersonID,
                LastEditedWhen = @StartingWhen
            WHERE StockItemID = @StockItemIDToAdjust;

            INSERT Warehouse.StockItemTransactions
                (StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID,
                 TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen)
            VALUES
                (@StockItemIDToAdjust,
                 (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Stock Adjustment at Stocktake''),
                 NULL, NULL, NULL, NULL,
                 @StartingWhen, @QuantityToAdjust, @StaffMemberPersonID, @StartingWhen);
        END;
        SET @Counter += 1;
    END;

    COMMIT;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'PickStockForCustomerOrders')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.PickStockForCustomerOrders
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Picking stock for customer orders'';
    END;

    SET XACT_ABORT ON;

    DECLARE @UninvoicedOrders TABLE
    (
        OrderID int PRIMARY KEY
    );

    INSERT @UninvoicedOrders
    SELECT o.OrderID
    FROM Sales.Orders AS o
    WHERE NOT EXISTS (SELECT 1 FROM Sales.Invoices AS i WHERE i.OrderID = o.OrderID);

    DECLARE @StockAlreadyAllocated TABLE
    (
        StockItemID int PRIMARY KEY,
        QuantityAllocated int
    );

    WITH StockAlreadyAllocated
    AS
    (
        SELECT ol.StockItemID, SUM(ol.PickedQuantity) AS TotalPickedQuantity
        FROM Sales.OrderLines AS ol
        INNER JOIN @UninvoicedOrders AS uo
        ON ol.OrderID = uo.OrderID
        WHERE ol.PickingCompletedWhen IS NULL
        GROUP BY ol.StockItemID
    )
    INSERT @StockAlreadyAllocated (StockItemID, QuantityAllocated)
    SELECT sa.StockItemID, sa.TotalPickedQuantity
    FROM StockAlreadyAllocated AS sa;

    DECLARE OrderLineList CURSOR FAST_FORWARD READ_ONLY
    FOR
    SELECT ol.OrderID, ol.OrderLineID, ol.StockItemID, ol.Quantity
    FROM Sales.OrderLines AS ol
    WHERE ol.PickingCompletedWhen IS NULL
    ORDER BY ol.OrderID, ol.OrderLineID;

    DECLARE @OrderID int;
    DECLARE @OrderLineID int;
    DECLARE @StockItemID int;
    DECLARE @Quantity int;
    DECLARE @AvailableStock int;
    DECLARE @PickingPersonID int = (SELECT TOP(1) PersonID
                                    FROM [Application].People
                                    WHERE IsEmployee <> 0
                                    ORDER BY NEWID());

    OPEN OrderLineList;
    FETCH NEXT FROM OrderLineList INTO @OrderID, @OrderLineID, @StockItemID, @Quantity;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- work out available stock for this stock item (on hand less allocated)
        SET @AvailableStock = (SELECT QuantityOnHand FROM Warehouse.StockItemHoldings AS sih WHERE sih.StockItemID = @StockItemID);
        SET @AvailableStock -= COALESCE((SELECT QuantityAllocated FROM @StockAlreadyAllocated AS saa WHERE saa.StockItemID = @StockItemID), 0);

        IF @AvailableStock >= @Quantity
        BEGIN
            BEGIN TRAN;

            MERGE @StockAlreadyAllocated AS saa
            USING (VALUES (@StockItemID, @Quantity)) AS sa(StockItemID, Quantity)
            ON saa.StockItemID = sa.StockItemID
            WHEN MATCHED THEN
                UPDATE SET saa.QuantityAllocated += sa.Quantity
            WHEN NOT MATCHED THEN
                INSERT (StockItemID, QuantityAllocated) VALUES (sa.StockItemID, sa.Quantity);

            -- reserve the required stock
            UPDATE Sales.OrderLines
            SET PickedQuantity = @Quantity,
                PickingCompletedWhen = @StartingWhen,
                LastEditedBy = @PickingPersonID,
                LastEditedWhen = @StartingWhen
            WHERE OrderLineID = @OrderLineID;

            -- mark the order as ready to invoice (picking complete) if all lines picked
            IF NOT EXISTS (SELECT 1 FROM Sales.OrderLines AS ol
                                    WHERE ol.OrderID = @OrderID
                                    AND ol.PickingCompletedWhen IS NULL)
            BEGIN
                UPDATE Sales.Orders
                SET PickingCompletedWhen = @StartingWhen,
                    PickedByPersonID = @PickingPersonID,
                    LastEditedBy = @PickingPersonID,
                    LastEditedWhen = @StartingWhen
                WHERE OrderID = @OrderID;
            END;

            COMMIT;
        END;

        FETCH NEXT FROM OrderLineList INTO @OrderID, @OrderLineID, @StockItemID, @Quantity;
    END;

    CLOSE OrderLineList;
    DEALLOCATE OrderLineList;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'PlaceSupplierOrders')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.PlaceSupplierOrders
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Placing supplier orders'';
    END;

    DECLARE @ContactPersonID int = (SELECT TOP(1) PersonID FROM [Application].People WHERE IsEmployee <> 0 ORDER BY NEWID());

    DECLARE @Orders TABLE
    (
        SupplierID int,
        PurchaseOrderID int NULL,
        DeliveryMethodID int,
        ContactPersonID int,
        SupplierReference nvarchar(20) NULL
    );

    DECLARE @OrderLines TABLE
    (
        StockItemID int,
        [Description] nvarchar(100),
        SupplierID int,
        QuantityOfOuters int,
        LeadTimeDays int,
        OuterPackageID int,
        LastOuterCostPrice decimal(18,2)
    );

    BEGIN TRAN;

    WITH StockItemsToCheck
    AS
    (
        SELECT si.StockItemID,
               si.StockItemName AS [Description],
               si.SupplierID,
               sih.TargetStockLevel,
               sih.ReorderLevel,
               si.QuantityPerOuter,
               si.LeadTimeDays,
               si.OuterPackageID,
               sih.QuantityOnHand,
               sih.LastCostPrice,
               COALESCE((SELECT SUM(ol.Quantity)
                         FROM Sales.OrderLines AS ol
                         WHERE ol.StockItemID = si.StockItemID
                         AND ol.PickingCompletedWhen IS NULL), 0) AS StockNeededForOrders,
               COALESCE((SELECT si.QuantityPerOuter * SUM(pol.OrderedOuters - pol.ReceivedOuters)
                         FROM Purchasing.PurchaseOrderLines AS pol
                         WHERE pol.StockItemID = si.StockItemID
                         AND pol.IsOrderLineFinalized = 0), 0) AS StockOnOrder
        FROM Warehouse.StockItems AS si
        INNER JOIN Warehouse.StockItemHoldings AS sih
        ON si.StockItemID = sih.StockItemID
    ),
    StockItemsToOrder
    AS
    (
        SELECT sitc.StockItemID,
               sitc.[Description],
               sitc.SupplierID,
               (sitc.QuantityOnHand + sitc.StockOnOrder - sitc.StockNeededForOrders) AS EffectiveStockLevel,
               sitc.TargetStockLevel,
               sitc.QuantityPerOuter,
               sitc.LeadTimeDays,
               sitc.OuterPackageID,
               sitc.LastCostPrice
        FROM StockItemsToCheck AS sitc
        WHERE (sitc.QuantityOnHand + sitc.StockOnOrder - sitc.StockNeededForOrders) < sitc.ReorderLevel
        AND sitc.QuantityPerOuter <> 0
    )
    INSERT @OrderLines (StockItemID, [Description], SupplierID, QuantityOfOuters, LeadTimeDays, OuterPackageID, LastOuterCostPrice)
    SELECT sito.StockItemID,
           sito.[Description],
           sito.SupplierID,
           CEILING((sito.TargetStockLevel - sito.EffectiveStockLevel) / sito.QuantityPerOuter) AS OutersRequired,
           sito.LeadTimeDays,
           sito.OuterPackageID,
           ROUND(sito.LastCostPrice * sito.QuantityPerOuter, 2) AS LastOuterCostPrice
    FROM StockItemsToOrder AS sito;

    INSERT @Orders (SupplierID, PurchaseOrderID, DeliveryMethodID, ContactPersonID, SupplierReference)

    SELECT s.SupplierID, NEXT VALUE FOR Sequences.PurchaseOrderID, s.DeliveryMethodID,
           (SELECT TOP(1) PersonID FROM [Application].People WHERE IsEmployee <> 0),
           s.SupplierReference
    FROM Purchasing.Suppliers AS s
    WHERE s.SupplierID IN (SELECT SupplierID FROM @OrderLines);

    INSERT Purchasing.PurchaseOrders
        (PurchaseOrderID, SupplierID, OrderDate, DeliveryMethodID, ContactPersonID,
         ExpectedDeliveryDate, SupplierReference, IsOrderFinalized, Comments,
         InternalComments, LastEditedBy, LastEditedWhen)
    SELECT o.PurchaseOrderID, o.SupplierID, CAST(@StartingWhen AS date), o.DeliveryMethodID, o.ContactPersonID,
           DATEADD(day, (SELECT MAX(LeadTimeDays) FROM @OrderLines), CAST(@StartingWhen AS date)),
           o.SupplierReference, 0, NULL,
           NULL, 1, @StartingWhen
    FROM @Orders AS o;

    INSERT Purchasing.PurchaseOrderLines
        (PurchaseOrderID, StockItemID, OrderedOuters, [Description],
         ReceivedOuters, PackageTypeID, ExpectedUnitPricePerOuter, LastReceiptDate,
         IsOrderLineFinalized, LastEditedBy, LastEditedWhen)
    SELECT o.PurchaseOrderID, ol.StockItemID, ol.QuantityOfOuters, ol.[Description],
           0, ol.OuterPackageID, ol.LastOuterCostPrice, NULL,
           0, @ContactPersonID, @StartingWhen
    FROM @OrderLines AS ol
    INNER JOIN @Orders AS o
    ON ol.SupplierID = o.SupplierID;

    COMMIT;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'ProcessCustomerPayments')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.ProcessCustomerPayments
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Processing customer payments'';
    END;

    DECLARE @StaffMemberPersonID int = (SELECT TOP(1) PersonID
                                        FROM [Application].People
                                        WHERE IsEmployee <> 0
                                        ORDER BY NEWID());

    DECLARE @TransactionsToReceive TABLE
    (
        CustomerTransactionID int,
        CustomerID int,
        InvoiceID int NULL,
        OutstandingBalance decimal(18,2)
    );

    INSERT @TransactionsToReceive
        (CustomerTransactionID, CustomerID, InvoiceID, OutstandingBalance)
    SELECT CustomerTransactionID, CustomerID, InvoiceID, OutstandingBalance
    FROM Sales.CustomerTransactions
    WHERE IsFinalized = 0;

    BEGIN TRAN;

    UPDATE Sales.CustomerTransactions
    SET OutstandingBalance = 0,
        FinalizationDate = @StartingWhen,
        LastEditedBy = @StaffMemberPersonID,
        LastEditedWhen = @StartingWhen
    WHERE CustomerTransactionID IN (SELECT CustomerTransactionID FROM @TransactionsToReceive);

    INSERT Sales.CustomerTransactions
        (CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID, TransactionDate,
         AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance,
         FinalizationDate, LastEditedBy, LastEditedWhen)
    SELECT ttr.CustomerID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Customer Payment Received''),
           NULL, (SELECT PaymentMethodID FROM [Application].PaymentMethods WHERE PaymentMethodName = N''EFT''),
           CAST(@StartingWhen AS date), 0, 0, 0 - SUM(ttr.OutstandingBalance),
           0, CAST(@StartingWhen AS date), @StaffMemberPersonID, @StartingWhen
    FROM @TransactionsToReceive AS ttr
    GROUP BY ttr.CustomerID;

    COMMIT;

END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'ReceivePurchaseOrders')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.ReceivePurchaseOrders
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Receiving stock from purchase orders'';
    END;

    DECLARE @StaffMemberPersonID int = (SELECT TOP(1) PersonID
                                        FROM [Application].People
                                        WHERE IsEmployee <> 0
                                        ORDER BY NEWID());
    DECLARE @PurchaseOrderID int;
    DECLARE @SupplierID int;
    DECLARE @TotalExcludingTax decimal(18,2);
    DECLARE @TotalIncludingTax decimal(18,2);

    DECLARE PurchaseOrderList CURSOR FAST_FORWARD READ_ONLY
    FOR
    SELECT PurchaseOrderID, SupplierID
    FROM Purchasing.PurchaseOrders AS po
    WHERE po.IsOrderFinalized = 0
    AND po.ExpectedDeliveryDate >= @StartingWhen;

    OPEN PurchaseOrderList;
    FETCH NEXT FROM PurchaseOrderList INTO @PurchaseOrderID, @SupplierID;

    WHILE @@FETCH_STATUS = 0
    BEGIN

        BEGIN TRAN;

        UPDATE Purchasing.PurchaseOrderLines
        SET ReceivedOuters = OrderedOuters,
            IsOrderLineFinalized = 1,
            LastReceiptDate = CAST(@StartingWhen as date),
            LastEditedBy = @StaffMemberPersonID,
            LastEditedWhen = @StartingWhen
        WHERE PurchaseOrderID = @PurchaseOrderID;

        UPDATE sih
        SET sih.QuantityOnHand += pol.ReceivedOuters * si.QuantityPerOuter,
            sih.LastEditedBy = @StaffMemberPersonID,
            sih.LastEditedWhen = @StartingWhen
        FROM Warehouse.StockItemHoldings AS sih
        INNER JOIN Purchasing.PurchaseOrderLines AS pol
        ON sih.StockItemID = pol.StockItemID
        INNER JOIN Warehouse.StockItems AS si
        ON sih.StockItemID = si.StockItemID;

        INSERT Warehouse.StockItemTransactions
            (StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID,
             TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen)
        SELECT pol.StockItemID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Stock Receipt''),
               NULL, NULL, @SupplierID, pol.PurchaseOrderID,
               @StartingWhen, pol.ReceivedOuters * si.QuantityPerOuter, @StaffMemberPersonID, @StartingWhen
        FROM Purchasing.PurchaseOrderLines AS pol
        INNER JOIN Warehouse.StockItems AS si
        ON pol.StockItemID = si.StockItemID
        WHERE pol.PurchaseOrderID = @PurchaseOrderID;

        UPDATE Purchasing.PurchaseOrders
        SET IsOrderFinalized = 1,
            LastEditedBy = @StaffMemberPersonID,
            LastEditedWhen = @StartingWhen
        WHERE PurchaseOrderID = @PurchaseOrderID;

        SELECT @TotalExcludingTax = SUM(ROUND(pol.OrderedOuters * pol.ExpectedUnitPricePerOuter,2)),
               @TotalIncludingTax = SUM(ROUND(pol.OrderedOuters * pol.ExpectedUnitPricePerOuter,2))
                                  + SUM(ROUND(pol.OrderedOuters * pol.ExpectedUnitPricePerOuter * si.TaxRate / 100.0,2))
        FROM Purchasing.PurchaseOrderLines AS pol
        INNER JOIN Warehouse.StockItems AS si
        ON pol.StockItemID = si.StockItemID
        WHERE pol.PurchaseOrderID = @PurchaseOrderID;

        INSERT Purchasing.SupplierTransactions
            (SupplierID, TransactionTypeID, PurchaseOrderID, PaymentMethodID,
             SupplierInvoiceNumber, TransactionDate, AmountExcludingTax,
             TaxAmount, TransactionAmount, OutstandingBalance,
             FinalizationDate, LastEditedBy, LastEditedWhen)
        VALUES
            (@SupplierID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Supplier Invoice''),
             @PurchaseOrderID, (SELECT PaymentMethodID FROM [Application].PaymentMethods WHERE PaymentMethodName = N''EFT''),
             CAST(CEILING(RAND() * 10000) AS nvarchar(20)), CAST(@StartingWhen AS date), @TotalExcludingTax,
             @TotalIncludingTax - @TotalExcludingTax, @TotalIncludingTax, @TotalIncludingTax,
             NULL, @StaffMemberPersonID, @StartingWhen);

        COMMIT;

        FETCH NEXT FROM PurchaseOrderList INTO @PurchaseOrderID, @SupplierID;
    END;

    CLOSE PurchaseOrderList;
    DEALLOCATE PurchaseOrderList;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'RecordColdRoomTemperatures')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.RecordColdRoomTemperatures
@AverageSecondsBetweenReadings int,
@NumberOfSensors int,
@CurrentDateTime datetime2(7),
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Recording cold room temperatures'';
    END;

    DECLARE @TimeCounter datetime2(7) = CAST(@CurrentDateTime AS date);
    DECLARE @SensorCounter int;
    DECLARE @DelayInSeconds int;
    DECLARE @TimeToFinishForTheDay datetime2(7) = DATEADD(second, -30, DATEADD(day, 1, @TimeCounter));
    DECLARE @Temperature decimal(10,2);

    WHILE @TimeCounter < @TimeToFinishForTheDay
    BEGIN
        SET @SensorCounter = 0;
        WHILE @SensorCounter < @NumberOfSensors
        BEGIN
            SET @Temperature = 3 + RAND() * 2;

            DELETE Warehouse.ColdRoomTemperatures
            OUTPUT deleted.ColdRoomTemperatureID,
                   deleted.ColdRoomSensorNumber,
                   deleted.RecordedWhen,
                   deleted.Temperature,
                   deleted.ValidFrom,
                   @TimeCounter
            INTO Warehouse.ColdRoomTemperatures_Archive
            WHERE ColdRoomSensorNumber = @SensorCounter + 1;

            INSERT Warehouse.ColdRoomTemperatures
                (ColdRoomSensorNumber, RecordedWhen, Temperature, ValidFrom, ValidTo)
            VALUES
                (@SensorCounter + 1, @TimeCounter, @Temperature, @TimeCounter, @EndOfTime);

            SET @SensorCounter += 1;
        END;
        SET @DelayInSeconds = CEILING(RAND() * @AverageSecondsBetweenReadings);
        SET @TimeCounter = DATEADD(second, @DelayInSeconds, @TimeCounter);
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'RecordDeliveryVanTemperatures')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.RecordDeliveryVanTemperatures
@AverageSecondsBetweenReadings int,
@NumberOfSensors int,
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Recording delivery van temperatures'';
    END;

    DECLARE @VehicleRegistration nvarchar(20) = N''WWI-321-A'';

    DECLARE @TimeCounter datetime2(7) = @StartingWhen;
    DECLARE @SensorCounter int;
    DECLARE @DelayInSeconds int;
    DECLARE @MidnightToday datetime2(7) = CAST(@StartingWhen AS date);
    DECLARE @TimeToFinishForTheDay datetime2(7) = DATEADD(hour, 16, @MidnightToday);
    DECLARE @Temperature decimal(10,2);
    DECLARE @FullSensorData nvarchar(1000);
    DECLARE @Latitude decimal(18,7);
    DECLARE @Longitude decimal(18,7);
    DECLARE @IsCompressed bit;

    WHILE @TimeCounter < @TimeToFinishForTheDay
    BEGIN
        SET @SensorCounter = 0;
        WHILE @SensorCounter < @NumberOfSensors
        BEGIN
            SET @Temperature = 3 + RAND() * 2;
            SET @Latitude = 37.78352 + RAND() * 30;
            SET @Longitude = -122.4169 + RAND() * 40;

            SET @IsCompressed = CASE WHEN @TimeCounter < ''20160101'' THEN 1 ELSE 0 END;

            SET @FullSensorData = N''{"Recordings": ''
              + N''[''
              + N''{"type":"Feature", "geometry": {"type":"Point", "coordinates":[''
              + CAST(@Longitude AS nvarchar(20)) + N'','' + CAST(@Latitude AS nvarchar(20))
              + N''] }, "properties":{"rego":"'' + STRING_ESCAPE(@VehicleRegistration, N''json'')
              + N''","sensor":"'' + CAST(@SensorCounter + 1 AS nvarchar(20))
              + N'',"when":"'' + CONVERT(nvarchar(30), @TimeCounter, 126)
              + N''","temp":'' + CAST(@Temperature AS nvarchar(20))
              + N''}} ]'';

            INSERT Warehouse.VehicleTemperatures
                (VehicleRegistration, ChillerSensorNumber,
                 RecordedWhen, Temperature,
                 FullSensorData, IsCompressed, CompressedSensorData)
            VALUES
                (@VehicleRegistration, @SensorCounter + 1,
                 @TimeCounter, @Temperature,
                 CASE WHEN @IsCompressed = 0 THEN @FullSensorData END,
                 @IsCompressed,
                 CASE WHEN @IsCompressed <> 0 THEN COMPRESS(@FullSensorData) END);

            SET @SensorCounter += 1;
        END;
        SET @DelayInSeconds = CEILING(RAND() * @AverageSecondsBetweenReadings);
        SET @TimeCounter = DATEADD(second, @DelayInSeconds, @TimeCounter);
    END;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'RecordInvoiceDeliveries')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.RecordInvoiceDeliveries
@CurrentDateTime datetime2(7),
@StartingWhen datetime,
@EndOfTime datetime2(7),
@IsSilentMode bit
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @IsSilentMode = 0
    BEGIN
        PRINT N''Recording invoice deliveries'';
    END;

    DECLARE @DeliveryDriverPersonID int = (SELECT TOP(1) PersonID
                                           FROM [Application].People
                                           WHERE IsEmployee <> 0
                                           ORDER BY NEWID());

    DECLARE @ReturnedDeliveryData nvarchar(max);
    DECLARE @InvoiceID int;
    DECLARE @CustomerName nvarchar(100);
    DECLARE @PrimaryContactFullName nvarchar(50);
    DECLARE @Latitude decimal(18,7);
    DECLARE @Longitude decimal(18,7);
    DECLARE @DeliveryAttemptWhen datetime2(7);
    DECLARE @Counter int = 0;
    DECLARE @DeliveryEvent nvarchar(max);
    DECLARE @IsDelivered bit;

    DECLARE InvoiceList CURSOR FAST_FORWARD READ_ONLY
    FOR
    SELECT i.InvoiceID, i.ReturnedDeliveryData, c.CustomerName, p.FullName, ct.[Location].Lat, ct.[Location].Long
    FROM Sales.Invoices AS i
    INNER JOIN Sales.Customers AS c
    ON i.CustomerID = c.CustomerID
    INNER JOIN [Application].Cities AS ct
    ON c.DeliveryCityID = ct.CityID
    INNER JOIN [Application].People AS p
    ON c.PrimaryContactPersonID = p.PersonID
    WHERE i.ConfirmedDeliveryTime IS NULL
    AND i.InvoiceDate < CAST(@StartingWhen AS date)
    ORDER BY i.InvoiceID;

    OPEN InvoiceList;
    FETCH NEXT FROM InvoiceList INTO @InvoiceID, @ReturnedDeliveryData, @CustomerName, @PrimaryContactFullName, @Latitude, @Longitude;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Counter += 1;
        SET @DeliveryAttemptWhen = DATEADD(minute, @Counter * 5, @StartingWhen);

        SET @DeliveryEvent = N''{ }'';
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Event'', N''DeliveryAttempt'');
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.EventTime'', CONVERT(nvarchar(20), @DeliveryAttemptWhen, 126));
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.ConNote'', N''EAN-125-'' + CAST(@InvoiceID + 1050 AS nvarchar(20)));
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.DriverID'', @DeliveryDriverPersonID);
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Latitude'', @Latitude);
        SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Longitude'', @Longitude);

        SET @IsDelivered = 0;

        IF RAND() < 0.1 -- 10 % chance of non-delivery on this attempt
        BEGIN
            SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Comment'', N''Receiver not present'');
        END ELSE BEGIN -- delivered
            SET @DeliveryEvent = JSON_MODIFY(@DeliveryEvent, N''$.Status'', N''Delivered'');
            SET @IsDelivered = 1;
        END;

        SET @ReturnedDeliveryData = JSON_MODIFY(@ReturnedDeliveryData, N''append $.Events'', JSON_QUERY(@DeliveryEvent));
        SET @ReturnedDeliveryData = JSON_MODIFY(@ReturnedDeliveryData, N''$.DeliveredWhen'', CONVERT(nvarchar(20), @DeliveryAttemptWhen, 126));
        SET @ReturnedDeliveryData = JSON_MODIFY(@ReturnedDeliveryData, N''$.ReceivedBy'', @PrimaryContactFullName);

        UPDATE Sales.Invoices
        SET ReturnedDeliveryData = @ReturnedDeliveryData,
            LastEditedBy = @DeliveryDriverPersonID,
            LastEditedWhen = @StartingWhen
        WHERE InvoiceID = @InvoiceID;

        FETCH NEXT FROM InvoiceList INTO @InvoiceID, @ReturnedDeliveryData, @CustomerName, @PrimaryContactFullName, @Latitude, @Longitude;
    END;

    CLOSE InvoiceList;
    DEALLOCATE InvoiceList;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'UpdateCustomFields')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.UpdateCustomFields
@CurrentDateTime AS date
WITH EXECUTE AS OWNER
AS
BEGIN
    DECLARE @StartingWhen datetime2(7) = CAST(@CurrentDateTime AS date);

    SET @StartingWhen = DATEADD(hour, 23, @StartingWhen);

    -- Populate custom data for stock items

    UPDATE Warehouse.StockItems
    SET CustomFields = N''{ "CountryOfManufacture": ''
                     + CASE WHEN IsChillerStock <> 0 THEN N''"USA", "ShelfLife": "7 days"''
                            WHEN StockItemName LIKE N''%USB food%'' THEN N''"Japan"''
                            ELSE N''"China"''
                       END
                     + N'', "Tags": []''
                     + CASE WHEN Size IN (N''S'', N''XS'', N''XXS'', N''3XS'') THEN N'', "Range": "Children"''
                            WHEN Size IN (N''M'') THEN N'', "Range": "Teens/Young Adult"''
                            WHEN Size IN (N''L'', N''XL'', N''XXL'', N''3XL'', N''4XL'', N''5XL'', N''6XL'', N''7XL'') THEN N'', "Range": "Adult"''
                            ELSE N''''
                       END
                     + CASE WHEN StockItemName LIKE N''RC %'' THEN N'', "MinimumAge": "10"''
                            ELSE N''''
                       END
                     + N'' }'',
        ValidFrom = @StartingWhen;

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Radio Control''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''RC %'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Realistic Sound''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''RC %'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Vintage''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%vintage%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Halloween Fun''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%halloween%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Super Value''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%pack of%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''So Realistic''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%ride on%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Comfortable''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%slipper%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Long Battery Life''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%slipper%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', CASE WHEN StockItemID % 2 = 0 THEN N''32GB'' ELSE N''16GB'' END),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%USB food%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''Comedy''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%joke%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Warehouse.StockItems
    SET CustomFields = JSON_MODIFY(CustomFields, N''append $.Tags'', N''USB Powered''),
        ValidFrom = @StartingWhen
    WHERE StockItemName LIKE N''%USB%'';

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE si
    SET si.CustomFields = JSON_MODIFY(si.CustomFields, N''append $.Tags'', N''Limited Stock''),
        ValidFrom = @StartingWhen
    FROM Warehouse.StockItems AS si
    WHERE EXISTS (SELECT 1
                  FROM Warehouse.StockItemStockGroups AS sisg
                  INNER JOIN Warehouse.StockGroups AS sg
                  ON sisg.StockGroupID = sg.StockGroupID
                  WHERE si.StockItemID = sisg.StockItemID
                  AND sg.StockGroupName LIKE N''%Packaging%'');

    -- populate custom data for employees and salespeople

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    DECLARE EmployeeList CURSOR FAST_FORWARD READ_ONLY
    FOR
    SELECT PersonID, IsSalesperson
    FROM [Application].People
    WHERE IsEmployee <> 0;

    DECLARE @EmployeeID int;
    DECLARE @IsSalesperson bit;
    DECLARE @CustomFields nvarchar(max);
    DECLARE @JobTitle nvarchar(max);
    DECLARE @NumberOfAdditionalLanguages int;
    DECLARE @LanguageCounter int;
    DECLARE @OtherLanguages TABLE ( LanguageName nvarchar(50) );
    DECLARE @LanguageName nvarchar(50);

    OPEN EmployeeList;
    FETCH NEXT FROM EmployeeList INTO @EmployeeID, @IsSalesperson;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @CustomFields = N''{ "OtherLanguages": [] }'';

        SET @NumberOfAdditionalLanguages = FLOOR(RAND() * 4);
        DELETE @OtherLanguages;
        SET @LanguageCounter = 0;
        WHILE @LanguageCounter < @NumberOfAdditionalLanguages
        BEGIN
            SET @LanguageName = (SELECT TOP(1) alias
                                 FROM sys.syslanguages
                                 WHERE alias NOT LIKE N''%English%''
                                 AND alias NOT LIKE N''%Brazil%''
                                 ORDER BY NEWID());
            IF @LanguageName LIKE N''%Chinese%'' SET @LanguageName = N''Chinese'';
            IF NOT EXISTS (SELECT 1 FROM @OtherLanguages WHERE LanguageName = @LanguageName)
            BEGIN
                INSERT @OtherLanguages (LanguageName) VALUES(@LanguageName);
                SET @CustomFields = JSON_MODIFY(@CustomFields, N''append $.OtherLanguages'', @LanguageName);
            END;
            SET @LanguageCounter += 1;
        END;

        SET @CustomFields = JSON_MODIFY(@CustomFields, N''$.HireDate'',
                                        CONVERT(nvarchar(20), DATEADD(day, 0 - CEILING(RAND() * 2000) - 100, ''20130101''), 126));

        SET @JobTitle = N''Team Member'';
        SET @JobTitle = CASE WHEN RAND() < 0.05 THEN N''General Manager''
                             WHEN RAND() < 0.1 THEN N''Manager''
                             WHEN RAND() < 0.15 THEN N''Accounts Controller''
                             WHEN RAND() < 0.2 THEN N''Warehouse Supervisor''
                             ELSE @JobTitle
                        END;
        SET @CustomFields = JSON_MODIFY(@CustomFields, N''$.Title'', @JobTitle);

        IF @IsSalesperson <> 0
        BEGIN
            SET @CustomFields = JSON_MODIFY(@CustomFields, N''$.PrimarySalesTerritory'',
                                            (SELECT TOP(1) SalesTerritory FROM [Application].StateProvinces ORDER BY NEWID()));
            SET @CustomFields = JSON_MODIFY(@CustomFields, N''$.CommissionRate'',
                                            CAST(CAST(RAND() * 5 AS decimal(18,2)) AS nvarchar(20)));
        END;

        UPDATE [Application].People
        SET CustomFields = @CustomFields,
            ValidFrom = @StartingWhen
        WHERE PersonID = @EmployeeID;

        FETCH NEXT FROM EmployeeList INTO @EmployeeID, @IsSalesperson;
    END;

    CLOSE EmployeeList;
    DEALLOCATE EmployeeList;

    -- Set user preferences

    SET @StartingWhen = DATEADD(minute, 1, @StartingWhen);

    UPDATE Application.People
    SET UserPreferences = N''{"theme":"''+ (CASE (PersonID % 7)
                                              WHEN 0 THEN ''ui-darkness''
                                              WHEN 1 THEN ''blitzer''
                                              WHEN 2 THEN ''humanity''
                                              WHEN 3 THEN ''dark-hive''
                                              WHEN 4 THEN ''ui-darkness''
                                              WHEN 5 THEN ''le-frog''
                                              WHEN 6 THEN ''black-tie''
                                              ELSE ''ui-lightness''
                                          END)
                        + N''","dateFormat":"'' + CASE (PersonID % 10)
                                                    WHEN 0 THEN ''mm/dd/yy''
                                                    WHEN 1 THEN ''yy-mm-dd''
                                                    WHEN 2 THEN ''dd/mm/yy''
                                                    WHEN 3 THEN ''DD, MM d, yy''
                                                    WHEN 4 THEN ''dd/mm/yy''
                                                    WHEN 5 THEN ''dd/mm/yy''
                                                    WHEN 6 THEN ''mm/dd/yy''
                                                    ELSE ''mm/dd/yy''
                                                END
                        + N''","timeZone": "PST"''
                        + N'',"table":{"pagingType":"'' + CASE (PersonID % 5)
                                                            WHEN 0 THEN ''numbers''
                                                            WHEN 1 THEN ''full_numbers''
                                                            WHEN 2 THEN ''full''
                                                            WHEN 3 THEN ''simple_numbers''
                                                            ELSE ''simple''
                                                        END
                        + N''","pageLength": '' + CASE (PersonID % 5)
                                                    WHEN 0 THEN ''10''
                                                    WHEN 1 THEN ''25''
                                                    WHEN 2 THEN ''50''
                                                    WHEN 3 THEN ''10''
                                                    ELSE ''10''
                                                END + N''},"favoritesOnDashboard":true}'',
        ValidFrom = @StartingWhen
    WHERE UserPreferences IS NOT NULL;
END;';
		EXECUTE (@SQL);
	END;

	IF NOT EXISTS (SELECT 1 FROM sys.procedures WHERE SCHEMA_NAME(schema_id) = N'DataLoadSimulation'
	                                            AND name = N'DailyProcessToCreateHistory')
	BEGIN
		SET @SQL = N'
CREATE PROCEDURE DataLoadSimulation.DailyProcessToCreateHistory
@StartDate date,
@EndDate date,
@AverageNumberOfCustomerOrdersPerDay int,
@SaturdayPercentageOfNormalWorkDay int,
@SundayPercentageOfNormalWorkDay int,
@UpdateCustomFields bit,
@IsSilentMode bit,
@AreDatesPrinted bit
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDateTime datetime2(7) = @StartDate;
    DECLARE @EndOfTime datetime2(7) =  ''99991231 23:59:59.9999999'';
    DECLARE @StartingWhen datetime;
    DECLARE @NumberOfCustomerOrders int;
    DECLARE @IsWeekday bit;
    DECLARE @IsSaturday bit;
    DECLARE @IsSunday bit;
    DECLARE @IsMonday bit;
    DECLARE @Weekday int;
    DECLARE @IsStaffOnly bit;

    SET DATEFIRST 7;  -- Week begins on Sunday

    EXEC DataLoadSimulation.DeactivateTemporalTablesBeforeDataLoad;

    WHILE @CurrentDateTime <= @EndDate
    BEGIN
        IF @AreDatesPrinted <> 0 OR @IsSilentMode = 0
        BEGIN
            PRINT SUBSTRING(DATENAME(weekday, @CurrentDateTime), 1,3) + N'' '' + CONVERT(nvarchar(20), @CurrentDateTime, 107);
            PRINT N'' '';
        END;

      -- Calculate the days of the week - different processing happens on each day
        SET @Weekday = DATEPART(weekday, @CurrentDateTime);
        SET @IsSaturday = 0;
        SET @IsSunday = 0;
        SET @IsMonday = 0;
        SET @IsWeekday = 1;

        IF @Weekday = 7
        BEGIN
            SET @IsSaturday = 1;
            SET @IsWeekday = 0;
        END;
        IF @Weekday = 1
        BEGIN
            SET @IsSunday = 1;
            SET @IsWeekday = 0;
        END;
        IF @Weekday = 2 SET @IsMonday = 1;

    -- Purchase orders
        IF @IsWeekday <> 0
        BEGIN
            -- Start receiving purchase orders at 7AM on weekdays
            SET @StartingWhen = DATEADD(hour, 7, @CurrentDateTime);
            EXEC DataLoadSimulation.ReceivePurchaseOrders @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

    -- Password changes
        SET @StartingWhen = DATEADD(hour, 8, @CurrentDateTime);
        EXEC DataLoadSimulation.ChangePasswords @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Activate new website users
        SET @StartingWhen = DATEADD(minute, 10, DATEADD(hour, 8, @CurrentDateTime));
        EXEC DataLoadSimulation.ActivateWebsiteLogons @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Payments to suppliers
        IF DATEPART(weekday, @CurrentDateTime) = 2
        BEGIN
            SET @StartingWhen = DATEADD(hour, 9, @CurrentDateTime); -- Suppliers are paid on Monday mornings
            EXEC DataLoadSimulation.PaySuppliers @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

    -- Customer orders received
        SET @StartingWhen = DATEADD(hour, 10, @CurrentDateTime);
        SET @NumberOfCustomerOrders = @AverageNumberOfCustomerOrdersPerDay / 2
                                    + CEILING(RAND() * @AverageNumberOfCustomerOrdersPerDay);
        SET @NumberOfCustomerOrders = CASE DATEPART(weekday, @CurrentDateTime)
                                           WHEN 7
                                           THEN FLOOR(@NumberOfCustomerOrders * @SaturdayPercentageOfNormalWorkDay / 100)
                                           WHEN 1
                                           THEN FLOOR(@NumberOfCustomerOrders * @SundayPercentageOfNormalWorkDay / 100)
                                           ELSE @NumberOfCustomerOrders
                                      END;
		SET @NumberOfCustomerOrders = FLOOR(@NumberOfCustomerOrders * CASE WHEN YEAR(@StartingWhen) = 2013 THEN 1.0
		                                                                   WHEN YEAR(@StartingWhen) = 2014 THEN 1.12
																		   WHEN YEAR(@StartingWhen) = 2015 THEN 1.21
																		   WHEN YEAR(@StartingWhen) = 2016 THEN 1.23
																		   ELSE 1.26
																	  END);
        EXEC DataLoadSimulation.CreateCustomerOrders @CurrentDateTime, @StartingWhen, @EndOfTime, @NumberOfCustomerOrders, @IsSilentMode;

    -- Pick any customer orders that can be picked
        SET @StartingWhen = DATEADD(hour, 11, @CurrentDateTime);
        EXEC DataLoadSimulation.PickStockForCustomerOrders @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Process any payments from customers
        IF @Weekday <> 0
        BEGIN
            SET @StartingWhen = DATEADD(minute, 30, DATEADD(hour, 11, @CurrentDateTime));
            EXEC DataLoadSimulation.ProcessCustomerPayments @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

    -- Invoice orders that have been fully picked
        SET @StartingWhen = DATEADD(hour, 12, @CurrentDateTime);
        EXEC DataLoadSimulation.InvoicePickedOrders @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Place supplier orders
        IF @Weekday <> 0
        BEGIN
            SET @StartingWhen = DATEADD(hour, 13, @CurrentDateTime);
            EXEC DataLoadSimulation.PlaceSupplierOrders @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

    -- End of quarter stock take
        IF (MONTH(@CurrentDateTime) = 1 AND DAY(@CurrentDateTime) = 31)
            OR (MONTH(@CurrentDateTime) = 4 AND DAY(@CurrentDateTime) = 30)
            OR (MONTH(@CurrentDateTime) = 7 AND DAY(@CurrentDateTime) = 31)
            OR (MONTH(@CurrentDateTime) = 10 AND DAY(@CurrentDateTime) = 31)
        BEGIN
            SET @StartingWhen = DATEADD(hour, 14, @CurrentDateTime);
            EXEC DataLoadSimulation.PerformStocktake @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

    -- Record invoice deliveries
        SET @StartingWhen = DATEADD(hour, 7, @CurrentDateTime);
        EXEC DataLoadSimulation.RecordInvoiceDeliveries @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Add customers
        IF @Weekday <> 0
        BEGIN
            SET @StartingWhen = DATEADD(hour, 15, @CurrentDateTime);
            EXEC DataLoadSimulation.AddCustomers @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;
        END;

     -- Add stock items
        SET @StartingWhen = DATEADD(hour, 16, @CurrentDateTime);
        EXEC DataLoadSimulation.AddStockItems @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Add special deals
        SET @StartingWhen = DATEADD(hour, 16, @CurrentDateTime);
        EXEC DataLoadSimulation.AddSpecialDeals @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

     -- Temporal changes
        SET @StartingWhen = DATEADD(hour, 16, @CurrentDateTime);
        EXEC DataLoadSimulation.MakeTemporalChanges @CurrentDateTime, @StartingWhen, @EndOfTime, @IsSilentMode;

    -- Record delivery van temperatures
        IF @CurrentDateTime >= ''20160101''
        BEGIN
            SET @StartingWhen = DATEADD(hour, 7, @CurrentDateTime);
            EXEC DataLoadSimulation.RecordDeliveryVanTemperatures 300, 2, @CurrentDateTime, @StartingWhen, @IsSilentMode;
        END;

    -- Record cold room temperatures
        IF @CurrentDateTime >= ''20151220''
        BEGIN
            EXEC DataLoadSimulation.RecordColdRoomTemperatures 30, 4, @CurrentDateTime, @EndOfTime, @IsSilentMode;
        END;

        IF @IsSilentMode = 0
        BEGIN
            PRINT N'' '';
        END;

        SET @CurrentDateTime = DATEADD(day, 1, @CurrentDateTime);
    END; -- of processing each day

    IF @UpdateCustomFields <> 0
    BEGIN
        EXEC DataLoadSimulation.UpdateCustomFields @EndDate;
    END;

    EXEC DataLoadSimulation.ReactivateTemporalTablesAfterDataLoad;

    EXEC Sequences.ReseedAllSequences;

    -- Ensure RLS is applied
    EXEC [Application].Configuration_ApplyRowLevelSecurity
END;';
		EXECUTE (@SQL);
	END;

	EXEC DataLoadSimulation.ReactivateTemporalTablesAfterDataLoad;
END;