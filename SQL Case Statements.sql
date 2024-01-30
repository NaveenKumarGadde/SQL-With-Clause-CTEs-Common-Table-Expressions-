use youtube_statistics;

SELECT * FROM youtube_statistics.`youtube statistics`;

-- Using Uploads columns to create Consistency status 

SELECT max(uploads) as max_uploads, min(uploads) as min_uploads 
FROM youtube_statistics.`youtube statistics`;

-- 75000
-- 150000
-- 225000
-- 300000

SELECT 
     CASE 
     WHEN uploads < 75000 THEN 'Level 1'
     WHEN uploads BETWEEN  75000 AND  150000 THEN 'Level 2'
     WHEN uploads BETWEEN  150001 AND  225000 THEN 'Level 3'
     WHEN uploads > 225001  THEN  'Level 4'
     END as  Consistency_status ,
     uploads, Youtuber
FROM youtube_statistics.`youtube statistics`
order by 1 desc;



-- Using Country Column to create Continent Column

Select	
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
	END as continents,
    Country
FROM youtube_statistics.`youtube statistics`;



-- Using Subscribers to create a popularity score  (Comparision Operators)

SELECT max(subscribers) as max_sub, min(subscribers) as min_sub 
FROM youtube_statistics.`youtube statistics`;


SELECT 
    CASE 
    WHEN subscribers > 200000000 Then 'Top Youtubers'
    WHEN subscribers BETWEEN 100000000 AND 200000000 THEN 'Medium Youtubers'
    WHEN subscribers < 100000000 THEN 'Low Youtubers'
    END as Youtubers_Level,
    Youtuber,
    subscribers,
    Country
FROM youtube_statistics.`youtube statistics`
order by 3 desc;



-- using Income Column to create new one 

SELECT * FROM youtube_statistics.`youtube statistics`;

SELECT max(highest_yearly_earnings) as max_uploads, min(highest_yearly_earnings) as min_uploads 
FROM youtube_statistics.`youtube statistics`;

SELECT 
    CASE 
    WHEN highest_yearly_earnings > 100000000 Then 'Top Earning Youtubers'
    WHEN subscribers BETWEEN 163400000 AND 100000000 THEN 'Medium Earning Youtubers'
    WHEN subscribers < 163400000 THEN 'Low Earning Youtubers'
    END as Youtubers_Income_Level,
    Youtuber,
    subscribers,
    Country,highest_yearly_earnings
FROM youtube_statistics.`youtube statistics`
order by 5 desc;





