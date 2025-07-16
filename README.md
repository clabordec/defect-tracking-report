# Production Downtime Reporting Requirements

## Purpose

Capture and identify the causes of unplanned production downtime to reduce its impact and improve operational efficiency.

## Functional Requirements

1. **Downtime Event Entry via WinCC**
   - Operators should use a WinCC SCADA interface at their station to log events.

2. **Operator Input Fields**
   - Name
   - Station ID
   - Time
   - Reason for downtime
   - Duration (in minutes)
   - Comments

3. **Repair Technician Input**
   - Ability to append comments to operator-submitted downtime records.

4. **Reporting**
   - Generate reports on a **weekly** basis or on demand.
   - Reports should summarize downtime events for analysis.

## Implementation Notes

- The system should be intuitive and integrated into existing WinCC workflows.
- Historical data must be preserved and easily exportable (e.g., CSV, Excel).
