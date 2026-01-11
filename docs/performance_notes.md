# Performance Notes – CSR RBGM Utilisation Report

## Overview
This document outlines the key performance considerations applied to the
CSR RBGM Utilisation Report dataset. The goal is to ensure the query remains
efficient, predictable, and scalable when executed against large transactional
datasets.

---

## Query Design Principles

### Set-Based Processing
- The dataset is implemented using set-based SQL logic.
- All scalar user-defined functions (UDFs) were replaced with relational joins.
- This avoids row-by-row execution and significantly improves execution time
  for large result sets.

---

## Join Strategy
- All joins are explicit and based on indexed primary and foreign keys.
- Join order reflects logical data relationships:
  - Transaction → Patient → Item → Department
- This structure supports efficient query optimisation by the SQL Server
  query planner.

---

## Parameter Handling

### Date Parameters
- Mandatory date range parameters enforce bounded queries.
- Prevents accidental full-table scans.
- Supports predictable execution plans.

### Optional Item Parameter
- Optional filtering logic allows:
  - Specific item analysis, or
  - Broader category-level reporting
- Implemented using conditional logic to avoid dynamic SQL.

---

## Filtering Logic
- Business rules applied at the dataset level:
  - Excludes zero or negative quantities
  - Excludes returned items
- Reduces dataset size early in query execution.

---

## Indexing Considerations
Recommended non-clustered index:

```sql
CREATE INDEX idx_psPatitem_rendate
ON psPatitem (rendate, FK_iwItemsREN)
INCLUDE (renqty, retqty, FK_psPatRegisters, FK_mscWarehouse);
