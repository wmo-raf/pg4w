CREATE OR REPLACE FUNCTION postgisftw.repair_geojson_geometry(
	geojson_str text,
	geometry_type integer)
    RETURNS TABLE(geojson text) 
    LANGUAGE 'plpgsql'
    COST 100
    STABLE PARALLEL SAFE 
    ROWS 1000

AS $BODY$
BEGIN
	RETURN QUERY
    SELECT ST_AsGeoJson(ST_CollectionExtract(st_MakeValid(ST_GeomFromGeoJSON(geojson_str)), geometry_type)) as geojson;
END;
$BODY$;

COMMENT ON FUNCTION postgisftw.repair_geojson_geometry(text, integer)
    IS 'Repair geoJSON geometry';