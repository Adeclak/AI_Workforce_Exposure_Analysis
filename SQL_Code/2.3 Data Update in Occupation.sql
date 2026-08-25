UPDATE occupations o
JOIN ai_job_exposure raw ON o.soc_code = raw.soc_code
SET o.ai_exposure_llm_gpt4 = raw.ai_exposure_llm_gpt4;