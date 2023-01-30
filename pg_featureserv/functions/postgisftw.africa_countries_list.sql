CREATE OR REPLACE FUNCTION postgisftw.africa_countries_list(
	country_iso text DEFAULT ''::text)
    RETURNS TABLE(iso text, name text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
    IF coalesce(TRIM(country_iso), '') = '' THEN
        RETURN QUERY
            SELECT t.gid_0::text as iso,
                t.name_0::text as name
            FROM pgadapter.africa_gadm36_countries t
            ORDER BY t.name_1;
    ELSE
        RETURN QUERY
            SELECT t.gid_0::text as iso,
                    t.name_0::text as name
            FROM pgadapter.africa_gadm36_countries t
            WHERE t.gid_0 = country_iso
            ORDER BY t.name_1;
    END IF;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.africa_countries_list(text)
    IS 'Get all africa countries, filtering by iso if needed';