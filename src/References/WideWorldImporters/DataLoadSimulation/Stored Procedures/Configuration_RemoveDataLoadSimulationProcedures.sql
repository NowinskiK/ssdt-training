
CREATE PROCEDURE DataLoadSimulation.Configuration_RemoveDataLoadSimulationProcedures
WITH EXECUTE AS OWNER
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DROP PROCEDURE IF EXISTS DataLoadSimulation.ActivateWebsiteLogons;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.AddCustomers;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.AddSpecialDeals;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.AddStockItems;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.ChangePasswords;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.CreateCustomerOrders;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.DailyProcessToCreateHistory;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.InvoicePickedOrders;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.MakeTemporalChanges;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.PaySuppliers;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.PerformStocktake;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.PickStockForCustomerOrders;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.PlaceSupplierOrders;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.ProcessCustomerPayments;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.ReceivePurchaseOrders;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.RecordColdRoomTemperatures;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.RecordDeliveryVanTemperatures;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.RecordInvoiceDeliveries;
	DROP PROCEDURE IF EXISTS DataLoadSimulation.UpdateCustomFields;
	DROP FUNCTION IF EXISTS DataLoadSimulation.GetAreaCode;
END;