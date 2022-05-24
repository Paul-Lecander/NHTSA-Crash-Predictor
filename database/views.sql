CREATE accident_vehicle_person
 AS
 SELECT acc.casenum,
    acc.urbancity,
    acc.ve_total,
    acc.ve_forms,
    acc.permvit,
    acc.num_inj,
    acc.month,
    acc.year,
    acc.day_week,
    acc.hour,
    acc.alcohol,
    acc.max_sev,
    acc.wrk_zone,
    acc.lgt_cond,
    acc.weather,
    veh.veh_no,
    veh.numoccs,
    veh.m_harmname,
    veh.makename,
    veh.tow_vehname,
    veh.trav_speed,
    veh.deformedname,
    veh.towedname,
    veh.speedrelname,
    veh.vtrafwayname,
    veh.vspd_lim,
    veh.bdytyp_imname,
    veh.mod_year,
    veh.p_crash1name,
    per.per_no,
    per.rest_usename,
    per.rest_misname,
    per.helm_usename,
    per.helm_misname,
    per.drinkingname,
    per.alc_resname,
    per.drugsname,
    per.hospitalname,
    per.locationname,
    per.sex_imname,
    per.injsev_imname,
    per.peralch_imname,
    per.seat_imname,
    per.age_im
 FROM accident acc
 LEFT JOIN vehicle veh ON acc.casenum = veh.casenum
 LEFT JOIN person per ON veh.casenum = per.casenum AND veh.veh_no = per.veh_no;
 
SELECT COUNT(*) AS number_of_people,
       CASE
           WHEN person.age_im < 10 THEN '0-10'
           WHEN person.age_im < 20 THEN '10-20'
		   WHEN person.age_im < 30 THEN '20-30'
		   WHEN person.age_im < 40 THEN '30-40'
		   WHEN person.age_im < 50 THEN '40-50'
		   WHEN person.age_im < 60 THEN '50-60'
		   WHEN person.age_im < 70 THEN '60-70'
		   WHEN person.age_im < 80 THEN '70-80'
		   WHEN person.age_im < 90 THEN '80-90'
           ELSE '90+'
       END AS bucket
FROM person
WHERE age_im NOT IN (999, 998)
GROUP BY bucket
ORDER BY bucket;