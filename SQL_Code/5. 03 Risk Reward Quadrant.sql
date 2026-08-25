WITH dataset_averages AS (
    SELECT 
        AVG(annual_wage) AS avg_wage, 
        AVG(ai_exposure) AS avg_exposure 
    FROM occupations
)
SELECT 
    occupation_title,
    annual_wage,
    ai_exposure,
    CASE 
        WHEN annual_wage >= (SELECT avg_wage FROM dataset_averages) AND ai_exposure >= (SELECT avg_exposure FROM dataset_averages) THEN 'High Wage / High Risk'
        WHEN annual_wage >= (SELECT avg_wage FROM dataset_averages) AND ai_exposure < (SELECT avg_exposure FROM dataset_averages) THEN 'High Wage / Low Risk'
        WHEN annual_wage < (SELECT avg_wage FROM dataset_averages) AND ai_exposure >= (SELECT avg_exposure FROM dataset_averages) THEN 'Low Wage / High Risk'
        ELSE 'Low Wage / Low Risk'
    END AS risk_reward_quadrant
FROM occupations
ORDER BY annual_wage DESC, ai_exposure DESC;