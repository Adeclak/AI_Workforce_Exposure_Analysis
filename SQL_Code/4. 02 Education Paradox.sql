SELECT 
    el.education_required,
    el.education_rank,
    ROUND(AVG(o.ai_exposure), 4) AS avg_exposure,
    SUM(o.employment) AS total_employment_affected
FROM occupations o
JOIN education_levels el ON o.education_id = el.education_id
GROUP BY el.education_required, el.education_rank
ORDER BY el.education_rank ASC;