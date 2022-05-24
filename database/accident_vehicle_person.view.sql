-- View: public.accident_vehicle_person

-- DROP VIEW public.accident_vehicle_person;

CREATE OR REPLACE VIEW public.accident_vehicle_person
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
     JOIN vehicle veh ON acc.casenum::text = veh.casenum::text
     JOIN person per ON veh.casenum::text = per.casenum::text AND veh.veh_no = per.veh_no;

ALTER TABLE public.accident_vehicle_person
    OWNER TO postgres;

