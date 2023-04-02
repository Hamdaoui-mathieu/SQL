<!--------------exos_1--------------->

SELECT hot_nom, hot_ville
FROM hotel;


<!--------------exos_2--------------->

SELECT cli_nom, cli_prenom, cli_adresse
FROM `client`
WHERE cli_nom LIKE 'White';

<!--------------exos_3--------------->

SELECT sta_nom, sta_altitude
FROM station
WHERE sta_altitude<=1000; 

<!--------------exos_4--------------->

SELECT cha_numero, cha_capacite
FROM chambre
WHERE cha_capacite > 1;


<!--------------exos_5--------------->

SELECT cli_nom, cli_ville
FROM `client`
WHERE cli_ville
NOT LIKE 'londres';

<!--------------exos_6--------------->

SELECT hot_nom, hot_ville, hot_categorie
FROM hotel
WHERE hot_ville LIKE 'Bretou' AND hot_categorie > 3;


<!---------------exos7---------------->

SELECT sta_nom, hot_nom, hot_categorie, hot_ville
FROM hotel
JOIN station ON hot_sta_id = sta_id;

<!---------------exos8---------------->

SELECT hot_nom, hot_categorie, hot_ville, cha_numero
FROM hotel
JOIN chambre ON cha_hot_id = hot_id;

<!---------------exos9--------------->

SELECT hot_nom AS 'hotel', hot_categorie AS 'catégorie',
hot_ville AS 'ville séjours',
cha_numero AS 'numéro de chambre',
cha_capacite AS 'capacité personne'
FROM hotel
JOIN chambre ON cha_hot_id = hot_id;

<!---------------exos10--------------->

SELECT cli_nom AS 'client',
hot_nom AS 'hotel',
res_date_debut AS 'date reservation'
FROM `client`
JOIN hotel ON hot_id= cli_id
JOIN reservation ON res_id = cli_id
<!--------------exos11---------------->

SELECT sta_nom, hot_nom, cha_numero, cha_capacite
FROM station
JOIN hotel ON hot_sta_id = sta_id
JOIN chambre ON cha_hot_id = sta_id;

<!--------------exos12---------------->

SELECT
cli_nom AS 'client',
hot_nom AS 'hotel',
res_date_debut AS 'reservation',
DATEDIFF (res_date_fin, res_date_debut) AS 'durée du séjour'
FROM `client`
JOIN reservation ON res_cli_id = cli_id
JOIN hotel ON hot_id = cli_id;

<!-------------exos13--------------->

SELECT sta_id AS 'Station', COUNT(*) AS 'nbr d\'hotel'
FROM station 
JOIN hotel ON hot_sta_id = sta_id
GROUP BY sta_id;

            <!-----ou------>

SELECT sta_nom AS 'Station', COUNT(*) AS 'nbr d\'hotel'
FROM station 
JOIN hotel ON hot_sta_id = sta_id
GROUP BY sta_id;

<!-------------exos 14------------->

SELECT  sta_nom, COUNT(cha_capacite) AS 'Nbr de chambre'
FROM hotel
JOIN chambre ON cha_hot_id = hot_sta_id
JOIN station ON sta_id = hot_sta_id
GROUP BY  hot_sta_id;

<!----------exos15------------>

SELECT  sta_nom, COUNT(cha_capacite) AS 'Nbr de chambre'
FROM hotel
JOIN chambre ON cha_hot_id = hot_sta_id
JOIN station ON sta_id = hot_sta_id
WHERE (cha_capacite) >1
GROUP BY  hot_sta_id;

<!-----------exos16------------>

SELECT hot_nom AS NomHotel, 
		 cha_numero AS NumeroChambre, 
		 res_date AS DateReservation, 
		 cli_nom AS NomClient

FROM hotel
JOIN chambre ON hot_id = cha_hot_id
JOIN reservation ON cha_id = res_cha_id
JOIN client ON res_cli_id = cli_id
WHERE cli_nom = 'Squire';

<!----------exos17---------->

SELECT sta_nom AS 'Nom de station',
       avg(datediff(res_date_fin,res_date_debut)) AS 'Moyenne de séjour'
FROM reservation
JOIN chambre ON cha_id = res_cha_id
JOIN hotel ON hot_id = cha_hot_id
JOIN station ON sta_id = hot_sta_id
GROUP BY sta_nom;


<!------NB=il y a une erreur de synthaxe dans les réservations---->
