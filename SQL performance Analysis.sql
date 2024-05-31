SELECT *
  FROM [AdventureWorks2019].[Production].[WorkOrder]
  WHERE StockedQty = '11';

  /*
Missing Index Details from SQLQuery20.sql - DESKTOP-RJTMMVH.AdventureWorks2019 (DESKTOP-RJTMMVH\acer (71))
The Query Processor estimates that implementing the following index could improve the query cost by 99.2554%.
*/


USE [AdventureWorks2019]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Production].[WorkOrder] ([StockedQty])
INCLUDE ([ProductID],[OrderQty],[ScrappedQty],[StartDate],[EndDate],[DueDate],[ScrapReasonID],[ModifiedDate])
GO