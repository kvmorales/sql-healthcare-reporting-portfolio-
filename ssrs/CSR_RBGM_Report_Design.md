# CSR RBGM Utilisation Report – SSRS Design

## Report Purpose
The CSR RBGM Utilisation Report provides visibility into **Respiratory Breathing Gas Management (RBGM)**
consumable usage across clinical and operational departments.

The report supports:
- Operational monitoring
- Audit review
- Analytical reporting

---

## Report Layout
The report is designed as a **tabular SSRS report** with:

- Grouping by Department
- Secondary sorting by Item Description
- Chronological ordering by Rendered Date

---

## Report Sections

### Header
- Report title
- Selected parameter values
- Report execution timestamp

### Body
| Column | Description |
|------|------------|
| Patient Name | Displayed for reporting context |
| Age | Patient age at time of service |
| Item Code | Consumable identifier |
| Item Description | Item name |
| Rendered Qty | Quantity used |
| Rendered Date | Date of service |
| Department | Clinical or operational unit |

---

## Sorting & Grouping
- Primary group: Department
- Secondary sort: Item Description
- Tertiary sort: Rendered Date (ascending)

This structure supports:
- Department-level review
- Item-level analysis
- Time-based trend identification

---

## Performance Considerations
- JOIN-based dataset design
- Date-bounded filtering
- Index-aware query structure

---

## Reusability
The dataset can be reused for:
- Additional SSRS reports
- BI tools and dashboards
- Spreadsheet-based analysis

---

## Data Protection
- Sensitive data anonymised or masked
- Designed for internal reporting and portfolio demonstration
