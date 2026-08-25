
ALTER TABLE occupations MODIFY soc_code VARCHAR(50);

ALTER TABLE occupations ADD PRIMARY KEY (soc_code);