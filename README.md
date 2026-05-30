
# HW01-B — SQL Performance & Metabase

A hands-on SQL optimization task using a real Airbnb dataset on a shared PostgreSQL server.

## What it does

- Connects to the `qbc12_airbnb` database and inspects core tables.
- Builds a baseline neighbourhood summary query with CTEs.
- Runs `EXPLAIN ANALYZE` to identify performance bottlenecks.
- Creates a materialized view with indexes to speed up dashboard queries.
- Compares latency (baseline vs. materialized view) and reports the speedup.
- The Metabase dashboard part was cancelled by the instructor.

## Deliverables

- `sql/01_baseline_neighbourhood_summary.sql`
- `sql/02_create_materialized_view.sql`
- `reports/baseline_explain_analyze.txt`
- `reports/explain_notes.md`
- `reports/hw01_b_sql_performance.md`

## How to run

1. Install dependencies:

   ```bash
   pip install pandas sqlalchemy psycopg2-binary jupyter
   ```

2. Open the notebook:

   ```bash
   jupyter notebook 02_sql_performance_metabase_student.ipynb
   ```

3. Follow the cells — you’ll need your DB credentials (provided separately).

4. All output files will be generated inside the `sql/` and `reports/` folders.
