# CSR RBGM Report – SSRS Parameters

## Overview
This document describes the parameters used in the **CSR RBGM Utilisation Report**.
Parameters are designed to support **operational reporting, auditing, and analytical use**
while maintaining predictable query performance.

---

## Parameter: Start Date

- **Name:** `@startDate`
- **Data Type:** Date/Time
- **Prompt:** Rendered Date From
- **Required:** Yes
- **Default Value:** `=Today() - 30`

### Purpose
Defines the start of the reporting period for RBGM item usage.

### Notes
- Supports routine and ad-hoc reporting
- Required to prevent unbounded data scans

---

## Parameter: End Date

- **Name:** `@endDate`
- **Data Type:** Date/Time
- **Prompt:** Rendered Date To
- **Required:** Yes
- **Default Value:** `=Today()`

### Purpose
Defines the end of the reporting period.

### Notes
- Ensures consistent and reproducible report outputs

---

## Parameter: RBGM Item

- **Name:** `@RBGMItem`
- **Data Type:** Text
- **Prompt:** Item
- **Required:** No
- **Default Value:** Empty string (`''`)

### Purpose
Optional filter to return:
- A specific RBGM consumable item, or
- All predefined RBGM consumables when left blank

### Behaviour
- When populated → filters to selected item
- When blank → returns all RBGM-related items

### Design Rationale
Using an empty string instead of NULL:
- Simplifies parameter handling
- Avoids NULL-related execution plan variability
- Improves dataset stability

---

## Design Considerations
- Parameters enforce bounded queries
- Supports reproducible analysis
- Reduces risk of performance degradation
