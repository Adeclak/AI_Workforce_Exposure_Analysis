SELECT 
    jc.job_category,
    ROUND(AVG(o.ai_exposure), 4) AS avg_category_exposure
FROM occupations o
JOIN job_categories jc ON o.category_id = jc.category_id
GROUP BY jc.job_category
ORDER BY avg_category_exposure DESC;