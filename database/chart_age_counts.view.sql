-- View: public.chart_age_counts

-- DROP VIEW public.chart_age_counts;

CREATE OR REPLACE VIEW public.chart_age_counts
 AS
 SELECT count(*) AS number_of_people,
        CASE
            WHEN person.age_im < 10 THEN '0-10'::text
            WHEN person.age_im < 20 THEN '10-20'::text
            WHEN person.age_im < 30 THEN '20-30'::text
            WHEN person.age_im < 40 THEN '30-40'::text
            WHEN person.age_im < 50 THEN '40-50'::text
            WHEN person.age_im < 60 THEN '50-60'::text
            WHEN person.age_im < 70 THEN '60-70'::text
            WHEN person.age_im < 80 THEN '70-80'::text
            WHEN person.age_im < 90 THEN '80-90'::text
            ELSE '90+'::text
        END AS bucket
   FROM person
  WHERE person.age_im <> ALL (ARRAY[999, 998])
  GROUP BY (
        CASE
            WHEN person.age_im < 10 THEN '0-10'::text
            WHEN person.age_im < 20 THEN '10-20'::text
            WHEN person.age_im < 30 THEN '20-30'::text
            WHEN person.age_im < 40 THEN '30-40'::text
            WHEN person.age_im < 50 THEN '40-50'::text
            WHEN person.age_im < 60 THEN '50-60'::text
            WHEN person.age_im < 70 THEN '60-70'::text
            WHEN person.age_im < 80 THEN '70-80'::text
            WHEN person.age_im < 90 THEN '80-90'::text
            ELSE '90+'::text
        END)
  ORDER BY (
        CASE
            WHEN person.age_im < 10 THEN '0-10'::text
            WHEN person.age_im < 20 THEN '10-20'::text
            WHEN person.age_im < 30 THEN '20-30'::text
            WHEN person.age_im < 40 THEN '30-40'::text
            WHEN person.age_im < 50 THEN '40-50'::text
            WHEN person.age_im < 60 THEN '50-60'::text
            WHEN person.age_im < 70 THEN '60-70'::text
            WHEN person.age_im < 80 THEN '70-80'::text
            WHEN person.age_im < 90 THEN '80-90'::text
            ELSE '90+'::text
        END);

ALTER TABLE public.chart_age_counts
    OWNER TO postgres;

