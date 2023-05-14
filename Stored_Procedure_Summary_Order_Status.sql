CREATE OR REPLACE PROCEDURE summary_order_status @StatusID int 
AS
BEGIN
	SELECT
		f.OrderID,
		dc.CustomerName,
		dp.ProductName,
		f.Quantity,
		dso.StatusOrder
	FROM FactSalesOrder f
	JOIN DimCustomer dc ON f.CustomerID = dc.CustomerID
	JOIN DimProduct dp ON f.ProductID = dp.ProductID
	JOIN DimStatusOrder dso ON f.StatusID = dso.StatusID
	WHERE f.StatusID = @StatusID
END;