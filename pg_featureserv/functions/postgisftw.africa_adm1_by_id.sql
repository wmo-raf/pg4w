CREATE OR REPLACE FUNCTION postgisftw.africa_adm1_by_id(
	adm1_id text)
    RETURNS TABLE(id text, name_0 text, name_1 text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
 RETURN QUERY
  SELECT t.gid_1::text as id,
            t.name_0::text as name_0,
            t.name_1::text as name_1
        FROM pgadapter.africa_gadm36_adm1 t
        WHERE t.gid_1 = adm1_id
        ORDER BY t.name_1;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.africa_adm1_by_id(text)
    IS 'Filter africa admin1 boundaries by id';
