SELECT 
    exposure_level,
    ROUND(AVG(verbal_ability), 2) AS avg_verbal,
    ROUND(AVG(quant_ability), 2) AS avg_quant,
    ROUND(AVG(spatial_ability), 2) AS avg_spatial,
    ROUND(AVG(reasoning_ability), 2) AS avg_reasoning
FROM occupations
WHERE exposure_level IS NOT NULL
GROUP BY exposure_level
ORDER BY 
    CASE exposure_level
        WHEN 'High' THEN 3
        WHEN 'Medium' THEN 2
        WHEN 'Low' THEN 1
        ELSE 0
    END DESC;