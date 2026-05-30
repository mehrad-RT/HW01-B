
WITH calendar_30 AS (
    WITH recent_date AS (
        SELECT MAX(date) AS max_date FROM core.calendar_day
    )
    SELECT
        listing_id,
        AVG(price) FILTER (WHERE available = 't') AS avg_calendar_price_30,
        COUNT(*) FILTER (WHERE available = 't')::numeric / 30 AS availability_30_rate
    FROM core.calendar_day, recent_date
    WHERE date > max_date - 30
    GROUP BY listing_id
),
review_counts AS (
    SELECT listing_id, COUNT(*) AS total_reviews
    FROM core.review
    GROUP BY listing_id
)
SELECT
    l.neighbourhood_id AS neighbourhood,
    COUNT(l.listing_id) AS num_listings,
    AVG(l.listing_price) AS avg_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY l.listing_price) AS median_price,
    AVG(l.minimum_nights) AS avg_minimum_nights,
    SUM(COALESCE(r.total_reviews, 0)) AS total_reviews,
    SUM(COALESCE(r.total_reviews, 0))::float / COUNT(l.listing_id) AS reviews_per_listing,
    AVG(COALESCE(c.availability_30_rate, 0)) AS availability_30_rate
FROM core.listing l
LEFT JOIN calendar_30 c ON l.listing_id = c.listing_id
LEFT JOIN review_counts r ON l.listing_id = r.listing_id
GROUP BY l.neighbourhood_id
ORDER BY num_listings DESC;
