SELECT acc.casenum
      ,acc.urbancityname
      ,acc.ve_total
      ,acc.permvit
      ,acc.num_inj
      ,acc."month"
      ,acc."year"
      ,acc.wrk_zonename
      ,acc.wkdy_imname
      ,acc.hour_im
      ,acc.lgtcon_imname
      ,acc.weathr_imname
      ,acc.maxsev_imname
      ,acc.no_inj_im
      ,acc.alchl_imname 
      ,veh.veh_no
      ,veh.numoccs
      ,veh.m_harmname
      ,veh.makename
      ,veh.tow_vehname
      ,veh.trav_speed
      ,veh.deformedname
      ,veh.towedname
      ,veh.speedrelname
      ,veh.vtrafwayname
      ,veh.vspd_lim
      ,veh.bdytyp_imname
      ,veh.mdlyr_im
      ,veh.pcrash1_imname
      ,per.ve_forms
      ,per.per_no
      ,per.rest_usename
      ,per.helm_usename
      ,per.helm_misname
      ,per.rest_misname
      ,per.drinkingname
      ,per.alc_resname
      ,per.drugsname
      ,per.hospitalname
      ,per.locationname
      ,per.sex_imname
      ,per.injsev_imname
      ,per.peralch_imname
      ,per.seat_imname
      ,per.age_im
FROM accident acc
LEFT JOIN vehicle veh ON (acc.casenum = veh.casenum)
LEFT JOIN person per ON (veh.casenum = per.casenum
                         AND veh.veh_no = per.veh_no)
ORDER BY acc.casenum
        ,veh.veh_no
        ,per.per_no;
