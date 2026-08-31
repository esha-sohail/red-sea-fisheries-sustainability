
--creating table
CREATE TABLE fishries_data (
    area_name VARCHAR(100),
	area_type VARCHAR(50),
	 data_layer VARCHAR(100),
	uncertainty_score NUMERIC(10,4),
	 year INT,
	 scientific_name VARCHAR(150),
	  common_name VARCHAR(150),
	  functional_group VARCHAR(100),
	   commercial_group VARCHAR(100),
    fishing_entity VARCHAR(100),
    fishing_sector VARCHAR(100),
   catch_type VARCHAR(100),
    reporting_status VARCHAR(100),
    gear_type VARCHAR(100),
    end_use_type VARCHAR(100),
    tonnes NUMERIC(15,2),
    landed_value NUMERIC(18,2)
   
);
 select * from fishries_data;