CREATE OR REPLACE FUNCTION postgisftw.africa_admin_by_name(
	search_name text,
	result_limit integer DEFAULT 5)
    RETURNS TABLE(bbox text, centroid text, gid integer, area double precision, level integer, name_0 text, name_1 text, name_2 text, gid_0 text, gid_1 text, gid_2 text, geom geometry, place_name text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
	RETURN QUERY
		SELECT t.bbox::text, t.centroid::text, t.gid::integer, t.area::float, t.level::integer, t.name_0::text, t.name_1::text, t.name_2::text, t.gid_0::text, t.gid_1::text, t.gid_2::text, t.geom,
    	CASE WHEN t.gid_2 is not null THEN CONCAT(t.name_2, ', ', t.name_1, ', ', t.name_0) 
		WHEN t.gid_1 is not null THEN CONCAT(t.name_1, ', ',t.name_0) 
		WHEN t.gid_0 is not null THEN t.name_0 END AS place_name FROM pgadapter.africa_gadm36_political_boundaries t
		WHERE LOWER(t.name_0) LIKE '%' || search_name || '%' OR LOWER(t.simple_nam) LIKE '%' || search_name || '%' OR LOWER(t.name_1) 
		LIKE '%' || search_name || '%' OR LOWER(t.simple_n_1) LIKE '%' || search_name || '%' OR LOWER(t.name_2) LIKE '%' || search_name || '%' OR 
		LOWER(t.simple_n_2) LIKE '%' || search_name || '%' ORDER BY level LIMIT result_limit;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.africa_admin_by_name(text, integer)
    IS 'Search africa admin boundaries by name';
