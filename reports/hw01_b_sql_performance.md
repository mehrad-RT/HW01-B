# HW01-B SQL Performance & Metabase Dashboard

## Schema
- **Source tables**: core.listing, core.calendar_day, core.review
- **Materialized view**: student_mehrad_rafiei_tabatabaei.mv_airbnb_neighbourhood_summary
- **Indexes**: idx_mv_neighbourhood, idx_mv_num_listings

## Baseline Query Runtimes
- Best: 0.39 s
- Average: 0.41 s

## Materialized View Read Runtimes
- Best: 0.11 s
- Average: 0.11 s

## Speedup
- **3.6x** faster than baseline (best case).

## What Changed
- Pre-computed all heavy aggregations (30-day price, 365-day availability, review counts) into a materialized view.
- Added indexes on `neighbourhood` and `num_listings` to accelerate filtering and sorting.
- The dashboard now reads from a static snapshot instead of joining millions of rows each time.

## Metabase Dashboard
- **Note**: The Metabase dashboard part was cancelled by the instructor due to server-side schema access limitations. No dashboard was created.
