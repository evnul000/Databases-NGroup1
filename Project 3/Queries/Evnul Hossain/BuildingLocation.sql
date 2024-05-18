-- Find the Room Number with its corresponding Building Name not the abbreviation.
SELECT
    RL.RoomNumber,
    RL.BuildingId,
    CASE BL.BuildingName
        WHEN 'KG' THEN 'King Hall'
        WHEN 'KY' THEN 'Kiely Hall'
        WHEN 'PH' THEN 'Powermaker Hall'
        WHEN 'SU' THEN 'Student Union'
        WHEN 'SB' THEN 'Science Building'
        WHEN 'QH' THEN 'Queens Hall'
        WHEN 'HH' THEN 'Honor Hall'
        WHEN 'IB' THEN 'I Building'
        WHEN 'JH' THEN 'Jefferson Hall'
        WHEN 'GB' THEN 'G Building'
        WHEN 'RE' THEN 'Remsen Hall'
        WHEN 'RZ' THEN 'Razran Hall'
        WHEN 'RA' THEN 'Rathaus Hall'
        WHEN 'GC' THEN 'Gertz Center'
        WHEN 'FH' THEN 'Frese Hall'
		WHEN 'MU' THEN 'Music Hall'
		WhEN 'RO' THEN 'Rosenthal Library'
		WHEN 'FG' THEN 'FitzGeral Gym'
		WHEN 'KP' THEN 'Klapper Hall'
		WHEN 'GT' THEN 'Goldstein Theather'
		WHEN 'CH' THEN 'Colwin Hall'
		WHEN 'DY' THEN 'Delany Hall'
        ELSE BL.BuildingName
    END AS FullBuildingName
FROM
    LocationManagement.RoomLocation AS RL
JOIN
    LocationManagement.BuildingLocation AS BL ON RL.BuildingId = BL.BuildingId;