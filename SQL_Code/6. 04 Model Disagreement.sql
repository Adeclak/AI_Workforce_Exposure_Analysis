SELECT 
    occupation_title,
    ai_exposure_llm_human,
    ai_exposure_aioe,
    ABS(ai_exposure_llm_human - ai_exposure_aioe) AS exposure_divergence
FROM occupations
ORDER BY exposure_divergence DESC
LIMIT 50;