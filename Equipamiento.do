/*
Código para generar la base de gastos en equipamiento
*/


clear all
set more off

*Cambiar "path" por la carpeta donde estén guardados los archivos
local path "C:\Users\VictorF\Documents\ENGH 2012"
cd "`path'\bases_datos_engho2012"

use "engho_equipamiento.dta"

#delimit;

* Recodificar variables;

gen temp=.;
replace temp=11 if subregion=="1A";
replace temp=12 if subregion=="1B";
replace temp=21 if subregion=="2A";
replace temp=22 if subregion=="2B";
replace temp=23 if subregion=="2C";
replace temp=31 if subregion=="3A";
replace temp=32 if subregion=="3B";
replace temp=41 if subregion=="4A";
replace temp=42 if subregion=="4B";
replace temp=5  if subregion=="5";
replace temp=61 if subregion=="6A";
replace temp=62 if subregion=="6B";
drop subregion;
rename temp subregion;

* Etiquetas de valores;

destring clave, replace;

destring art_equip, replace;
label define ART_EQUIP
	541101 "Cocina con horno"
	541102 "Horno a microondas"
	541104 "Heladera con freezer"
	541105 "Freezer"
	541106 "Lavavajilla"
	541202 "Computadora"
	541203 "Conexión a Internet"
	541205 "Televisor"
	541207 "Video casetera/reproductora"
	541301 "Aspiradora"
	541302 "Estufa a gas tiro balanceado"
	541303 "Extractor de aire/purificador"
	541305 "Lavarropa no automático"
	541306 "Teléfono celular"
	541307 "Teléfono inalámbrico"
	541308 "Termotanque"
	541403 "Bicicleta"
	541103 "Heladera sin freezer"
	541201 "Cámara fotográfica digital"
	541206 "Video cámara digital"
	541304 "Lavarropa automático"
	541401 "Automóvil"
	541204 "DVD"
	541107 "Multiprocesadora"
	541402 "Camioneta"
	541309 "Aire Acondicionado"
	541404 "Moto, motocicleta, cuatriciclo"
;

destring provincia, replace;
label define PROVINCIA
	 2 "Ciudad de Buenos Aires"
	 6 "Buenos Aires"
	10 "Catamarca"
	14 "Córdoba"
	18 "Corrientes"
	22 "Chaco"
	26 "Chubut"
	30 "Entre Ríos"
	34 "Formosa"
	38 "Jujuy"
	42 "La Pampa"
	46 "La Rioja"
	50 "Mendoza"
	54 "Misiones"
	58 "Neuquén"
	62 "Río Negro"
	66 "Salta"
	70 "San Juan"
	74 "San Luis"
	78 "Santa Cruz"
	82 "Santa Fe"
	86 "Santiago del Estero"
	90 "Tucumán"
	94 "Tierra del Fuego"
;

destring region, replace;
label define REGION
	1 "Gran Buenos Aires"
	2 "Pampeana"
	3 "Noroeste"
	4 "Noreste"
	5 "Cuyo"
	6 "Patagónica"	
;

label define SUBREGION
	11 "Ciudad de Buenos Aires"
	12 "Partidos de Gran Buenos Aires"
	21 "Córdoba y La Pampa"
	22 "Santa Fe y Entre Ríos"
	23 "Buenos Aires"
	31 "Jujuy, Salta y Tucumán"
	32 "Catamarca, La Rioja y Santiago del Estero"
	41 "Misiones y Corrientes"
	42 "Chaco y Formosa"
	5  "San Juan, Mendoza y San Luis"
	61 "Neuquén, Río Negro"
	62 "Chubut, Santa Cruz y Tierra del Fuego"
;

destring cg55, replace;
label define CG55
	1 "Si"
	2 "No"
	9 "NS/NC"
;	

label values art_equip ART_EQUIP;
label values provincia PROVINCIA;
label values region REGION;
label values subregion SUBREGION;	
label values cg55 CG55;

* Etiquetas de variables;

label variable clave "Clave del hogar";
label variable art_equip "Artículo";
label variable provincia "Provincia";
label variable region "Región";
label variable subregion "Sub región";
label variable expan "Factor de expansión";
label variable cg55 "Tiene en funcionamiento";

compress;
saveold "`path'\Cleaned\Equipamiento.dta", replace;
