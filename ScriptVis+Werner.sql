USE Billionaires_LW;
-- CREO LA VISTA Billionaires_USA (BILLONARIOS QUE VIVEN EN USA)
CREATE VIEW Billionaires_USA AS 
SELECT 
id, 
id_location, 
firstName, 
lastName, 
gender, 
age, 
resCountry
FROM billionaires
WHERE resCountry = 'United States';

-- LA UTILICE PARA BORRAR UNA VISTA
DROP VIEW Tax_Economics;

-- CREO LA VISTA Billionaires_rest (BILLONARIOS QUE NO VIVEN EN USA)
CREATE VIEW Billionaires_rest AS 
SELECT 
id,
id_location, 
firstName, 
lastName, 
gender, 
age, 
resCountry
FROM billionaires
WHERE resCountry <> 'United States';

-- CREO LA VISTA GDP_Rich (MUESTRA LA RELACION ENTRE EL GDP/PBI Y EL SELFWORTH DEL BILLONARIO QUE VIVE ALLI)
CREATE VIEW GDP_Rich AS 
SELECT DISTINCT 
b.id, 
b.id_location,
b.firstName,
b.lastName,
b.gender,
b.age,
b.resCountry,
b.finalWorth,
e.GDP
FROM billionaires b
JOIN economics e ON b.id_location = e.id_location;

-- CREO LA VISTA Business_Billionaire (RELACION ENTRE TIPO DE NEGOCIO Y BILLONARIO)
CREATE VIEW Business_Billionaire  AS 
SELECT DISTINCT   
b.id AS businessrank,
b.firstName,
b.lastName,
b.gender,
b.age,
b.resCountry,
b.finalWorth,
b.selfMade,
bu.organization,
bu.industry
FROM billionaires b
JOIN businesses bu ON b.id = bu.id_Billionaire;

-- CREO LA VISTA Wealth_Billionaire (RELACION ENTRE TIPO DE NEGOCIO, BILLONARIO Y FUENTE DE RIQUEZA)
CREATE VIEW Wealth_Billionaire AS 
SELECT DISTINCT   
bu.id AS billionaire_id,
b.firstName AS billionaire_firstName,
b.lastName AS billionaire_lastName,
bu.title,
bu.organization,
bu.category,
bu.industry,
w.source
FROM businesses bu
JOIN wealths w ON bu.id = w.id_business
JOIN billionaires b ON bu.id_billionaire = b.id;

-- CREO LA VISTA Tax_Economics (RELACION ENTRE IMPUESTOS, LOCACION Y FACTORES ECONOMICOS )
CREATE VIEW Tax_Economics AS 
SELECT DISTINCT   
l.citiCountry,
l.city,
t.totalTaxRate,
t.taxRevenue,
e.CPI,
e.CPIChanges,
e.GDP,
e.tertiaryEducation,
e.primaryEducation,
e.lifeExpectancy,
e.population
FROM economics e
JOIN taxes t ON e.id = t.id_economic
JOIN locations l ON l.id = e.id_location;


