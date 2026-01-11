CREATE INDEX idx_psPatitem_rendate
ON psPatitem (rendate, FK_iwItemsREN)
INCLUDE (renqty, retqty, FK_psPatRegisters, FK_mscWarehouse);

CREATE INDEX idx_psPatRegisters
ON vwReportPatientProfile (pk_pspatregisters, age2);
