CREATE TRIGGER trg_before_insert_order
ON Orders
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'Before Insert Trigger: Orders'
END;

CREATE TRIGGER trg_after_insert_order
ON Orders
AFTER INSERT
AS
BEGIN
    PRINT 'After Insert Trigger: Orders'
END;

CREATE TRIGGER trg_before_update_product
ON Products
INSTEAD OF UPDATE
AS
BEGIN
    PRINT 'Before Update Trigger: Products'
END;

CREATE TRIGGER trg_after_update_product
ON Products
AFTER UPDATE
AS
BEGIN
    PRINT 'After Update Trigger: Products'
END;
