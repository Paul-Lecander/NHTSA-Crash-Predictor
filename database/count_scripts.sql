-- number of accidents
SELECT COUNT(*) AS "number_of_accidents" FROM public.accident;

-- number of vehicles
SELECT COUNT(*) AS "number_of_vehicles" FROM public.vehicle;

-- number of people
SELECT COUNT(*) AS "number_of_people" FROM public.person';

-- number of injuires
SELECT COUNT(*) AS "number_of_injuries", (CAST(COUNT(*) AS NUMERIC) / (SELECT COUNT(*) FROM public.person) * 100) AS "percent"
FROM public.person per
WHERE per.injsev_imname = 'Suspected Serious Injury (A)'
OR per.injsev_imname = 'Possible Injury (C)'
OR per.injsev_imname = 'Suspected Minor Injury (B)'
OR per.injsev_imname = 'Fatal Injury (K)'
OR per.injsev_imname = 'Injured, Severity Unknown'
OR per.injsev_imname = 'Died Prior to Crash*';

-- number of serious injuries
SELECT COUNT(*) AS "number_of_serious_injuries", (CAST(COUNT(*) AS NUMERIC) / (SELECT COUNT(*) FROM public.person) * 100) AS "percent"
FROM public.person per
WHERE per.injsev_imname = 'Suspected Serious Injury (A)';

-- number of fatalities
SELECT COUNT(*) AS "number_of_fatalities", (CAST(COUNT(*) AS NUMERIC) / (SELECT COUNT(*) FROM public.person) * 100) AS "percent"
FROM public.person per
WHERE per.injsev_imname = 'Fatal Injury (K)'
OR per.injsev_imname = 'Died Prior to Crash*';

