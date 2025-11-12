--dropped views which are now ephemeral and will be used for other logic
DROP VIEW AIRBNB.DEV.SRC_HOSTS;
DROP VIEW AIRBNB.DEV.SRC_LISTINGS;
DROP VIEW AIRBNB.DEV.SRC_REVIEWS;


select * from AIRBNB.DEV.SCD_RAW_LISTINGS where id = 3176


--testing if will update in scd raw listing snapshot for SCD2
update AIRBNB.RAW.RAW_LISTINGS
set MINIMUM_NIGHTS = 30,
updated_at=current_timestamp()
WHERE ID=3176;




-- view of full_moon reviews
WITH fullmoon_reviews AS (
    SELECT * FROM AIRBNB.DEV.mart_fullmoon_reviews
)
SELECT
    is_full_moon,
    review_sentiment,
    COUNT(*) as reviews
FROM
    fullmoon_reviews
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    is_full_moon,
    review_sentiment




--view of our new audit_log
SELECT *
FROM AIRBNB.dev.audit_log