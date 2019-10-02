/*Please add ; after each select statement*/
CREATE PROCEDURE habitatArea()
BEGIN
    -- SET @numbers := (SELECT GROUP_CONCAT(CONCAT(x, ' ', y) SEPARATOR ', ') FROM places);
    -- SET @numbers := (SELECT GROUP_CONCAT(CONCAT(x, ' ', y) ORDER BY (y / x) DESC, x ASC SEPARATOR '; ') FROM places WHERE x / y is not null);
    -- SET @numbers2 := (SELECT CONCAT(x, ' ', y) FROM places LIMIT 1);
    -- SET @poly2 := (SELECT CONCAT('Polygon((', @numbers , ' , ', @numbers2,'))'));
    -- SELECT ST_Area(ST_ConvexHull(ST_GeomFromText(@poly2))) as area;
    -- SELECT @poly2;
    SET @geo := (SELECT CONCAT('MULTIPOINT(', GROUP_CONCAT(x,' ',y SEPARATOR ','), ')') FROM places);
    SELECT ST_AREA(ST_ConvexHull(ST_GeomFromText(@geo))) as area;
END