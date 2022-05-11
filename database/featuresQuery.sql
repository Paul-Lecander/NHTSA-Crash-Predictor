SELECT acc.casenum
      --TODO add interesting accident features
      ,veh.veh_no
      --TODO add interesting vehicle features
      ,per.per_no
      --TODO add interesting person features
FROM accident acc
LEFT JOIN vehicle veh ON (acc.casenum = veh.casenum)
LEFT JOIN person per ON (veh.casenum = per.casenum
                         AND veh.veh_no = per.veh_no)
ORDER BY acc.casenum
        ,veh.veh_no
        ,per.per_no;
