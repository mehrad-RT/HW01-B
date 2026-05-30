# Observations from EXPLAIN ANALYZE

1. **Efficient date filter via existing index**: The `calendar_day` table uses `idx_calendar_date` to retrieve the most recent date and the 30-day window, avoiding a full sequential scan.
2. **In-memory hash joins**: Both hash joins (listing ↔ calendar_30, listing ↔ review) fit entirely in memory with a single batch and no disk spill.
3. **Parallel sequential scan on review**: The aggregation on `core.review` uses a parallel sequential scan because no index on `listing_id` exists; however, the parallel workers keep the aggregation time acceptable.
