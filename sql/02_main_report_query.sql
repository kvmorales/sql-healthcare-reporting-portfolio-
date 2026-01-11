SELECT
    CONCAT(p.LastName, ', ', p.FirstName, ' ', ISNULL(p.MiddleName, '')) AS [Patient Name],
    pr.age2 AS [Age],
    a.FK_iwItemsREN AS [Item Code],
    i.ItemDescription AS [Item Description],
    a.renqty AS [Rendered Qty],
    CAST(a.rendate AS date) AS [Rendered Date],
    d.DepartmentName AS [Department]

FROM psPatitem a
INNER JOIN vwReportPatientProfile pr
    ON a.FK_psPatRegisters = pr.pk_pspatregisters
INNER JOIN emdPatients p
    ON a.FK_emdPatients = p.pk_emdPatients
INNER JOIN iwItems i
    ON a.FK_iwItemsREN = i.pk_iwItems
INNER JOIN mscWarehouse d
    ON a.FK_mscWarehouse = d.pk_mscWarehouse

WHERE
    CAST(a.rendate AS date) BETWEEN @startDate AND @endDate

    AND (
        (@RBGMItem <> '' AND a.FK_iwItemsREN = @RBGMItem)
        OR
        (@RBGMItem = '' AND a.FK_iwItemsREN IN (
            'MSC0054','9','7',
            'MEDSP1040407000-1019','MEDSP1040407000-1018',
            'MEDSP1040407000-0632','MSRBGM1040407000-001',
            'MSRBGM1040407000-002','MSRBGM1040407000-003',
            'MSRBGM1040407000-004','MEDSP1040407000-1051',
            'MEDSP1040407000-0323'
        ))
    )

    AND a.renqty > 0
    AND a.retqty <> 1

ORDER BY
    d.DepartmentName,
    i.ItemDescription,
    CAST(a.rendate AS date);
