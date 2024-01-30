use youtube_statistics;


-- Common Table Expressions

SELECT * FROM youtube_statistics.`youtube statistics`;

-- Total Number of Views By Continent 

WITH Continent_data AS (

SELECT `video views`,
        country,
        CASE
     WHEN Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     WHEN Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
         "Ukraine","United Kingdom","Vatican City") then 'Europe'

     WHEN Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     WHEN Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
        "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     WHEN Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

     WHEN Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
         "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
	END as continents
 FROM youtube_statistics.`youtube statistics` )
 
 SELECT sum(`video views`) as Total_views_by_continent, continents
 from Continent_data
 group by continents
 order by 1 desc;
 
 
 
 
 
 -- Create a Consistency  scale using uploads, and find the pay by the papularity scale 
 
 SELECT max(uploads) as Max_uploads , min(uploads) as Min_uploads
 FROM youtube_statistics.`youtube statistics`;
 
 WITH Level_data AS (
 SELECT 
     CASE 
     WHEN uploads < 75000 THEN 'Level 1'
     WHEN uploads BETWEEN  75000 AND  150000 THEN 'Level 2'
     WHEN uploads BETWEEN  150001 AND  225000 THEN 'Level 3'
     WHEN uploads > 225001  THEN  'Level 4'
     END as  Consistency_status ,
     uploads, Youtuber, highest_yearly_earnings
FROM youtube_statistics.`youtube statistics`)

 SELECT sum(highest_yearly_earnings) as Total_earnings,
 avg(highest_yearly_earnings) as Avg_earnings,
 Consistency_status
 from Level_data
 group by Consistency_status
 order by 1 desc;





 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


