CREATE OR REPLACE FUNCTION postgisftw.africa_adm1_list(
	country_iso text)
    RETURNS TABLE(id text, name text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
 RETURN QUERY
  SELECT t.gid_1::text as id,
            t.name_1::text as name
    FROM pgadapter.africa_gadm36_adm1 t
    WHERE t.gid_0 = country_iso
    ORDER BY t.name_1;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.africa_adm1_list(text)
    IS 'Filter africa admin1 boundaries by country iso';