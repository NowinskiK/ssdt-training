
CREATE PROCEDURE Website.InsertCustomerOrders
@Orders Website.OrderList READONLY,
@OrderLines Website.OrderLineList READONLY,
@OrdersCreatedByPersonID int,
@SalespersonPersonID int
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @OrdersToGenerate AS TABLE
    (
        OrderReference int PRIMARY KEY,   -- reference from the application
        OrderID int
    );

    -- allocate the new order numbers

    INSERT @OrdersToGenerate (OrderReference, OrderID)
    SELECT OrderReference, NEXT VALUE FOR Sequences.OrderID
    FROM @Orders;

    BEGIN TRY

        BEGIN TRAN;

        INSERT Sales.Orders
            (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID, OrderDate,
             ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments,
             PickingCompletedWhen, LastEditedBy, LastEditedWhen)
        SELECT otg.OrderID, o.CustomerID, @SalespersonPersonID, NULL, o.ContactPersonID, NULL, SYSDATETIME(),
               o.ExpectedDeliveryDate, o.CustomerPurchaseOrderNumber, o.IsUndersupplyBackordered, o.Comments, o.DeliveryInstructions, NULL,
               NULL, @OrdersCreatedByPersonID, SYSDATETIME()
        FROM @OrdersToGenerate AS otg
        INNER JOIN @Orders AS o
        ON otg.OrderReference = o.OrderReference;

        INSERT Sales.OrderLines
            (OrderID, StockItemID, [Description], PackageTypeID, Quantity, UnitPrice,
             TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
        SELECT otg.OrderID, ol.StockItemID, ol.[Description], si.UnitPackageID, ol.Quantity,
               Website.CalculateCustomerPrice(o.CustomerID, ol.StockItemID, SYSDATETIME()),
               si.TaxRate, 0, NULL, @OrdersCreatedByPersonID, SYSDATETIME()
        FROM @OrdersToGenerate AS otg
		INNER JOIN @Orders AS o
		ON otg.OrderReference = o.OrderReference
        INNER JOIN @OrderLines AS ol
        ON otg.OrderReference = ol.OrderReference
        INNER JOIN Warehouse.StockItems AS si
        ON ol.StockItemID = si.StockItemID;

        COMMIT;

    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        PRINT N'Unable to create the customer orders.';
        THROW;
        RETURN -1;
    END CATCH;

    RETURN 0;
END;