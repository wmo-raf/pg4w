CREATE OR REPLACE FUNCTION postgisftw.africa_adm2_list(
	country_iso text,
	adm1 text)
    RETURNS TABLE(id text, name text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
 RETURN QUERY
  SELECT t.gid_2::text as id,
            t.name_2::text as name
    FROM pgadapter.africa_gadm36_adm2 t
    WHERE t.gid_0 = country_iso 
    AND t.gid_1 = adm1
    ORDER BY t.name_2;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.africa_adm2_list(text, text)
    IS 'Filter africa admin2 boundaries by country iso and adm1';
