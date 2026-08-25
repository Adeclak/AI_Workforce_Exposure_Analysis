USE ai_anxiety;

CREATE TABLE job_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    job_category VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO job_categories (job_category)
SELECT DISTINCT job_category 
FROM ai_job_exposure 
WHERE job_category IS NOT NULL;

CREATE TABLE education_levels (
    education_id INT AUTO_INCREMENT PRIMARY KEY,
    education_required VARCHAR(255) NOT NULL UNIQUE,
    education_rank INT
);

INSERT INTO education_levels (education_required)
SELECT DISTINCT education_required 
FROM ai_job_exposure 
WHERE education_required IS NOT NULL;

UPDATE education_levels
SET education_rank = CASE
    WHEN education_required LIKE '%No formal%' THEN 1
    WHEN education_required LIKE '%High school%' THEN 2
    WHEN education_required LIKE '%Some college%' THEN 3
    WHEN education_required LIKE '%Postsecondary%' THEN 4
    WHEN education_required LIKE '%Associate%' THEN 5
    WHEN education_required LIKE '%Bachelor%' THEN 6
    WHEN education_required LIKE '%Master%' THEN 7
    WHEN education_required LIKE '%Doctoral%' OR education_required LIKE '%Professional%' THEN 8
    ELSE 9 
END;

CREATE TABLE occupations AS
SELECT 
    raw.soc_code,
    raw.occupation_title,
    c.category_id,
    ed.education_id,
    raw.employment,
    raw.annual_wage,
    raw.ai_exposure,
    raw.ai_exposure_llm_human,
    raw.ai_exposure_aioe,
    raw.exposure_level,
    raw.verbal_ability,
    raw.quant_ability,
    raw.spatial_ability,
    raw.reasoning_ability
FROM ai_job_exposure raw
LEFT JOIN job_categories c ON raw.job_category = c.job_category
LEFT JOIN education_levels ed ON raw.education_required = ed.education_required;

ALTER TABLE occupations ADD PRIMARY KEY (soc_code);
