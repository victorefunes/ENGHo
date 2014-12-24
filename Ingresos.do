/*
Código para generar la base de ingresos de los hogares
*/

clear all
set more off

*Cambiar "path" por la carpeta donde estén guardados los archivos
local path "C:\Users\VictorF\Documents\ENGH 2012"
cd "`path'\bases_datos_engho2012"

use "engho_ingresos.dta"

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

destring condocup, replace;
label define CONDOCUP
	0 "NS/NC"
	1 "Ocupado"
	2 "No ocupado"
;

destring catocup, replace;
label define CATOCUP
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Patrón"
	4 "Trabajador familiar sin remuneración"
;

destring catocup_s, replace;
label define CATOCUP_S
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Patrón"
	4 "Trabajador familiar sin remuneración"	
;

destring catocup_a, replace;
label define CATOCUP_A
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Patrón"	
	4 "Trabajador familiar sin remuneración"	
;

destring cp24, replace;
label define CP24
	0 "NS/NC"
	1 "Un solo empleo/ocupación"
	2 "Dos empleos/ocupaciones"
	3 "Tres o más empleos/ocupaciones"
;

destring m_ingtotp, replace;
label define M_INGTOTP
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_inglabt, replace;
label define M_INGLABT
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_ingocpal, replace;
label define M_INGOCPAL
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_ingocsec, replace;
label define M_INGOCSEC
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_ingocant, replace;
label define M_INGOCANT
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_ijubilacion, replace;
label define M_IJUBILACION
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_itransfermon, replace;
label define M_ITRANSFERMON
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_iautoconsumo, replace;
label define M_IAUTOCONSUMO	
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

destring m_irent, replace;
label define M_IRENTAS	
	0 "Ingreso sin imputar/completo"
	1 "Ingreso imputado/incompleto"
	2 "No corresponde"
;

label values provincia PROVINCIA;
label values region REGION;
label values subregion SUBREGION;
label values condocup CONDOCUP;
label values catocup CATOCUP;
label values catocup_s CATOCUP_S;
label values catocup_a CATOCUP_A;
label values cp24 CP24;
label values m_ingtotp M_INGTOTP;
label values m_inglabt M_INGLABT;
label values m_ingocpal M_INGOCPAL;
label values m_ingocsec M_INGOCSEC;
label values m_ingocant M_INGOCANT;
label values m_ijubilacion M_IJUBILACION;
label values m_itransfermon M_ITRANSFERMON;
label values m_iautoconsumo M_IAUTOCONSUMO;
label values m_irent M_IRENTAS;

* Etiquetas de variables;

label variable clave "Clave del hogar";
label variable provincia "Provincia";
label variable region "Región";
label variable subregion "Sub región";
label variable expan "Factor de expansión";
label variable miembro "Número de miembro";
label variable condocup "Condición de ocupación";
label variable catocup "Categoría ocupacional";
label variable catocup_s "Categoría ocupacional de la ocupación secundaria";
label variable catocup_a "Categoría ocupacional de la ocupación anterior";
label variable cp24 "La semana pasada tenía";
label variable ingtotp "Ingreso total del perceptor";
label variable m_ingtotp "Marca de imputación del ingreso total del perceptor";
label variable ingtotp_imp "Monto imputado del ingreso total del perceptor";
label variable cantftot "Cantidad de percepciones";
label variable cantfimp "Cantidad de percepciones imputadas";
label variable inglabt "Ingreso neto laboral total del perceptor";
label variable m_inglabt "Monto imputado del ingreso neto laboral total del perceptor";
label variable inglabt_imp "Monto imputado del ingreso neto laboral total del perceptor";
label variable ingocpal "Ingreso neto de la ocupación principal";
label variable m_ingocpal "Monto imputado del ingreso neto de la ocupación principal";
label variable ingocsec "Ingreso neto de la ocupación secundaria";
label variable m_ingocsec "Monto imputado del ingreso neto de la ocupación secundaria";
label variable ingocant "Ingreso neto de la ocupación anterior";
label variable m_ingocant "Monto imputado del ingreso neto de la ocupación anterior";
label variable ijubilacion "Ingreso neto por jubilación/pensión";
label variable m_ijubilacion "Monto imputado del ingreso neto por jubilación/pensión";
label variable itransfermon "Ingreso neto por transferencias monetarias";
label variable m_itransfermon "Monto imputado del ingreso neto por transferencias monetarias";
label variable iautoconsumo"Ingreso neto por producción realizada para el consumo del hogar";
label variable m_iautoconsumo "Monto imputado del ingreso neto por producción realizada para el consumo del hogar";
label variable irentas "Ingreso neto por cobro de alquileres, dividendos e intereses";
label variable m_irent "Monto imputado del ingreso neto por cobro de alquileres, dividendos e intereses";

compress;
saveold "`path'\Cleaned\Ingresos.dta", replace;
