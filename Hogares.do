/*
C�digo para generar la base de caracter�sticas de los hogares
*/

clear all
set more off

*Cambiar "path" por la carpeta donde est�n guardados los archivos
local path "C:\Users\VictorF\Documents\ENGH 2012"
cd "`path'\bases_datos_engho2012"

use "engho_hogares.dta"

#delimit;

* Recodificar variables;

rename aÑo a�o;

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
	14 "C�rdoba"
	18 "Corrientes"
	22 "Chaco"
	26 "Chubut"
	30 "Entre R�os"
	34 "Formosa"
	38 "Jujuy"
	42 "La Pampa"
	46 "La Rioja"
	50 "Mendoza"
	54 "Misiones"
	58 "Neuqu�n"
	62 "R�o Negro"
	66 "Salta"
	70 "San Juan"
	74 "San Luis"
	78 "Santa Cruz"
	82 "Santa Fe"
	86 "Santiago del Estero"
	90 "Tucum�n"
	94 "Tierra del Fuego"
;

destring region, replace;
label define REGION
	1 "Gran Buenos Aires"
	2 "Pampeana"
	3 "Noroeste"
	4 "Noreste"
	5 "Cuyo"
	6 "Patag�nica"	
;

label define SUBREGION
	11 "Ciudad de Buenos Aires"
	12 "Partidos de Gran Buenos Aires"
	21 "C�rdoba y La Pampa"
	22 "Santa Fe y Entre R�os"
	23 "Buenos Aires"
	31 "Jujuy, Salta y Tucum�n"
	32 "Catamarca, La Rioja y Santiago del Estero"
	41 "Misiones y Corrientes"
	42 "Chaco y Formosa"
	5  "San Juan, Mendoza y San Luis"
	61 "Neuqu�n, R�o Negro"
	62 "Chubut, Santa Cruz y Tierra del Fuego"
;

destring cv1a01, replace;
label define CV1A01
	1 "Si"
	2 "No"
;	

destring cv1a02, replace;

destring cv1b01_a, replace;
label define CV1B01_A
	0 "NS/NC"
	1 "Si"
	2 "No"
;	

destring cv1b01_b, replace;
label define CV1B01_B
	0 "NS/NC"
	1 "Si"
	2 "No"
;	

destring cv1b01_c, replace;
label define CV1B01_C
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring cv1b02, replace;
label define CV1B02
	0 "NS/NC"
	1 "Casa"
	2 "Rancho"
	3 "Casilla"
	4 "Departamento"
	5 "Pieza en inquilinato"
	6 "Pieza en hotel familiar o pensi�n"
	7 "Local constru�do para habitaci�n"
	8 "Otros"
;	

destring cv1b03, replace;
label define CV1B03
	0 "NS/NC"
	1 "Villa (de emergencia) o asentamiento"
	2 "Barrio plan o monoblock"
	3 "Country o barrio cerrado"
	4 "Ninguno de los tres"
;

destring cv1b04, replace;	
destring cv1b05, replace;
label define CV1B05
	0 "NS/NC"
	1 "Ladrillo, piedra, bloque de hormig�n"
	2 "Adobe"
	3 "Madera"
	4 "Chapa de metal o fibrocemento"
	5 "Chorizo, cart�n, palma, paja sola o material de desecho"
	6 "Otros"
;	

destring cv1b06, replace;
label define CV1B06
	0 "NS/NC"
	1 "Cer�mica, baldosa, mosaico, m�rmol, madera o alfombrado"
	2 "Cemento o ladrillo fijo"
	3 "Tierra o ladrillo suelto"
	4 "Otros"
;	

destring cv1b07, replace;
label define CV1B07
	0 "NS/NC"
	1 "Ca�er�a dentro de la vivienda"
	2 "Fuera de la vivienda pero dentro del terreno"
	3 "Fuera del terreno"
;	

destring cv1b08, replace;
label define CV1B08
	0 "NS/NC"
	1 "Red p�blica"
	2 "Perforaci�n con bomba a motor"
	3 "Perforaci�n con bomba manual"
	4 "Pozo"
	5 "Transporte por cisterna"
	6 "Agua de lluvia, r�o, canal, arroyo o acequia"
;	

destring cv1b09, replace;
label define CV1B09
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring cv1b10, replace;
label define CV1B10
	0 "NS/NC"
	1 "Inodoro con bot�n/mochila/cadena y arrastre de agua"
	2 "Inodoro sin bot�n/mochila/cadena y arrastre de agua(a balde)"
	3 "Letrina(sin arrastre de agua)"
;

destring cv1b11, replace;
label define CV1B11
	0 "NS/NC"
	1 "A red p�blica (cloaca)"
	2 "A c�mara s�ptica y pozo ciego"
	3 "S�lo a pozo ciego"
	4 "A hoyo, excavaci�n en la tierra, etc."
;

destring cv1b12, replace;
label define CV1B12
	1 "Hasta 50m2"
	2 "De 51 a 75 m2"
	3 "De 76 a 100 m2"
	4 "De 101 a 200 m2"
	5 "M�s de 200 m2"
	9 "NS/NC"
;

destring cv1c01, replace;
label define CV1C01
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring ch01_a, replace;
label define CH01_A
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch01_b, replace;
label define CH01_B
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch01_c, replace;
label define CH01_C
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch01_d, replace;
label define CH01_D
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch02_a, replace;
label define CH02_A
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch02_b, replace;
label define CH02_B
	0 "NS/NC"
	1 "S�, de uso com�n"
	2 "S�, de uso exclusivo"
	3 "No"
;

destring ch03, replace;
label define CH03
	0 "NS/NC"
	1 "Si"
	2 "No"
;
destring ch04, replace;
destring ch05, replace;

destring ch06, replace;
label define CH06
	0 "NS/NC"
	1 "De uso exclusivo"
	2 "De uso compartido de otros hogares"
	3 "De uso compartido con otras viviendas"
;

destring ch07, replace;

destring ch08, replace;
label define CH08
	0 "NS/NC"
	1 "Cuarto de cocina con instalaci�n de agua"
	2 "Cuarto de cocina sin instalaci�n de agua"
	3 "No tiene cuarto de cocina"
;

destring ch09, replace;
label define CH09
	0 "NS/NC"
	1 "Gas de red"
	2 "Gas a granel (zeppelin)"
	3 "Gas a tubo"
	4 "Gas en garrafa"
	5 "Electricidad"
	6 "Le�a o carb�n"
	7 "Otro"
;

destring ch10, replace;
label define CH10
	0 "NS/NC"
	1 "Por red"
	2 "Por generaci�n propia a motor"
	3 "Por generaci�n propia por otros medios"
	4 "No tiene electricidad"
;

destring ch11, replace;
label define CH11
	0 "NS/NC"
	1 "Sistema central, individual o colectivo"
	2 "Artefactos fijos"
	3 "Artefactos m�viles"
	4 "No posee sistemas ni artefactos de calefacci�n"
;

destring ch12, replace;
label define CH12
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring ch13_a, replace;
label define CH13_A
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring ch13_b, replace;
label define CH13_B
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring ch14, replace;
label define CH14
	0 "NS/NC"
	1 "Propietario de la vivienda y el terreno"
	2 "Propietario de la vivienda solamente"
	3 "Inquilino o arrendatario de la vivienda"
	4 "Ocupante por relaci�n de trabajo"
	5 "Ocupante por pr�stamo, cesi�n o permiso"
	6 "Ocupante de hecho (sin permiso)"
	7 "Alguna otra situaci�n"
;

destring ch15, replace;
label define CH15
	0 "NS/NC"
	1 "Si"
	2 "No"
;

destring jnivins, replace;
label define JNIVINS
	1 "Sin instrucci�n"
	2 "Preescolar"
	3 "Primario incompleto"
	4 "Primario completo"
	5 "Secundario incompleto"
	6 "Secundario completo"
	7 "Superior incompleto"
	8 "Superior completo"
	9 "Universitario incompleto"
   10 "Universitario completo"
   11 "Educaci�n especial"
   99 "NS/NC"
;

destring jedad, replace;

destring jgrupedad, replace;
label define JGRUPEDAD
	1 "Hasta 34 a�os"
	2 "35 a 49 a�os"
	3 "50 a 64 a�os"
	4 "65 a�os y m�s"
;	

destring jsexo, replace;
label define JSEXO
	1 "Var�n"
	2 "Mujer"
;

destring jsitocup, replace;
label define JSITOCUP
	0 "NS/NC"
	1 "No ocupado"
	2 "Ocupado asalariado"
	3 "Ocupado cuenta propia o patr�n"
;

destring jcatocup, replace;
label define JCATOCUP
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Empleador, patr�n"
	4 "Trabajador familiar sin remuneraci�n"
;

destring jcatocup_s, replace;
label define JCATOCUP_S
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
;

destring jcatocup_a, replace;
label define JCATOCUP_A
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
;

destring jcondocup, replace;
label define JCONDOCUP
	0 "NS/NC"
	1 "Ocupado"
	2 "No ocupado"
;

destring jcomed, replace;
label define JCOMED
	1 "S�"
	2 "No"
	9 "NS/NC"
;

destring jcomed2, replace;
label define JCOMED2
	0 "NS/NC"
	1 "Sin cobertura m�dica"
	2 "S�lo obra social obligatoria"
	3 "Sistema prepago"
	4 "Programa estatal"
	5 "Emergencias m�dicas"
	9 "NS/NC"	
;

destring jcomed3, replace;
label define JCOMED3
	1 "Sin cobertura m�dica"
	2 "Obra social obligatoria"
	3 "Obra social m�s no privado"
	4 "Prepaga"
	5 "Prepaga m�s otro"
	6 "Programa estatal m�s emergencia"
	7 "Programa estatal"
	8 "Emergencias m�dicas"
	9 "NS/NC"
;

destring cantmiem, replace;

destring miemagrup, replace;
label define MIEMAGRUP
	0 "NS/NC"
	1 "Uno"
	2 "Dos"
	3 "Tres"
	4 "Cuatro"
	5 "Cinco y m�s"
;

destring miemagrup, replace;

destring cantadequi, replace;

destring cantocup, replace;

destring menor14, replace;

destring mayor65, replace;

destring cantping, replace;

destring tasadep, replace;

destring permieoc, replace;

destring tipohog, replace;
label define TIPOHOG
	0 "NS/NC"
	1 "Unipersonal"
	2 "Nuclear sin hijos"
	3 "Nuclear con hijos"
	4 "Extendido"
;

destring regten, replace;
label define REGTEN
	0 "NS/NC"
	1 "Inquilino"
	2 "No inquilino"
;

destring propauto, replace;
label define PROPAUTO
	0 "NS/NC"
	1 "No propietario"
	2 "Propietario de 1 autom�vil"
	3 "Propietario de 2 � m�s autom�viles"
;

destring propauto2, replace;
label define PROPAUTO2
	0 "NS/NC"
	1 "No propietario"
	2 "Propietario"
;

destring m_nring, replace;
label define M_NRING
	0 "Todo bien respondido"
	1 "Existe alguna no respuesta"
;

destring quigapht, replace;
destring quigaphr, replace;
destring qui23phr, replace;
label define QUINTIL
	1 "Primer quintil"
	2 "Segundo quintil"
	3 "Tercer quintil"
	4 "Cuarto quintil"
	5 "Quinto quintil"
;	

destring decgapht, replace;
destring decgaphr, replace;
destring decgaphtexpan, replace;
destring decgaphrexpan, replace;
destring decgaphp, replace;
destring decgaphpexpan, replace;
destring deciptht, replace;
destring decipthtexpan, replace;
destring decippht, replace;
destring decipphtexpan, replace;
destring decimpht, replace;
destring decimphtexpan, replace;
label define Decil
	1 "Primer decil"
	2 "Segundo decil"
	3 "Tercer decil"
	4 "Cuarto decil"
	5 "Quinto decil"
	6 "Sexto decil"	
	7 "S�ptimo decil"
	8 "Octavo decil"
	9 "Noveno decil"	
   10 "D�cimo decil"	
;

destring vinpch_r, replace;
label define VINPCH_R
	1 "Primer ventil"
	2 "Segundo ventil"
	3 "Tercer ventil"
	4 "Cuarto ventil"
	5 "Quinto ventil"
	6 "Sexto ventil"	
	7 "S�ptimo ventil"
	8 "Octavo ventil"
	9 "Noveno ventil"	
   10 "D�cimo ventil"	
   11 "D�cimo primer ventil"
   12 "D�cimo segundo ventil"
   13 "D�cimo tercer ventil"
   14 "D�cimo cuarto ventil"
   15 "D�cimo quinto ventil"
   16 "D�cimo sexto ventil"	
   17 "D�cimo s�ptimo ventil"
   18 "D�cimo octavo ventil"
   19 "D�cimo noveno ventil"	
   20 "Duod�cimo ventil"
;


label values provincia PROVINCIA;
label values region REGION;
label values subregion SUBREGION;
label values cv1a01 CV1A01;
label values cv1b01_a CV1B01_A;
label values cv1b01_b CV1B01_B;
label values cv1b01_c CV1B01_C;
label values cv1b02 CV1B02;
label values cv1b03 CV1B03;
label values cv1b05 CV1B05;
label values cv1b06 CV1B06;
label values cv1b07 CV1B07;
label values cv1b08 CV1B08;
label values cv1b09 CV1B09;
label values cv1b10 CV1B10;
label values cv1b11 CV1B11;
label values cv1b12 CV1B12;
label values cv1c01 CV1C01;	
label values ch01_a CH01_A;
label values ch01_b CH01_B;
label values ch01_c CH01_C;
label values ch01_d CH01_D;
label values ch02_a CH02_A;
label values ch02_b CH02_B;
label values ch03 CH03;
label values ch06 CH06;
label values ch08 CH08;
label values ch09 CH09;
label values ch10 CH10;
label values ch11 CH11;
label values ch12 CH12;
label values ch13_a CH13_A;
label values ch13_b CH13_B;
label values ch14 CH14;
label values ch15 CH15;
label values jnivins JNIVINS;
label values jgrupedad JGRUPEDAD;
label values jsexo JSEXO;
label values jsitocup JSITOCUP;
label values jcatocup JCATOCUP;
label values jcatocup_s JCATOCUP_S;
label values jcatocup_a JCATOCUP_A;
label values jcondocup JCONDOCUP;
label values jcomed JCOMED;
label values jcomed2 JCOMED2;
label values jcomed3 JCOMED3;
label values miemagrup MIEMAGRUP;
label values tipohog TIPOHOG;
label values regten REGTEN;
label values propauto PROPAUTO;
label values propauto2 PROPAUTO2;
label values m_nring M_NRING;
label values quigapht QUINTIL;
label values quigaphr QUINTIL;
label values qui23phr QUINTIL;
label values decgapht DECIL;
label values decgaphr DECIL;
label values decgaphtexpan DECIL;
label values decgaphrexpan DECIL;
label values decgaphp DECIL;
label values decgaphpexpan DECIL;
label values deciptht DECIL;
label values decipthtexpan DECIL;
label values decippht DECIL;
label values decipphtexpan DECIL;
label values decimpht DECIL;
label values decimphtexpan DECIL;
label values vinpch_r VINPCH_R;

* Etiquetas de variables;

label variable clave "Clave del hogar";
label variable provincia "Provincia";
label variable region "Regi�n";
label variable trimestre "Trimestre";
label variable a�o "A�o";
label variable subregion "Sub regi�n";
label variable expan "Factor de expansi�n";
label variable cv1a01 "�Existen otras viviendas en esta misma direcci�n?";
label variable cv1a02 "N�mero de viviendas";
label variable cv1b01_a "La cuadra de la vivienda/frente a la vivienda tiene pavimento mejorado o ripio";
label variable cv1b01_b "La cuadra de la vivienda/frente a la vivienda tiene vereda";
label variable cv1b01_c "La cuadra de la vivienda/frente a la vivienda tiene red cloacal";
label variable cv1b02 "Tipo de vivienda";
label variable cv1b03 "Ubicaci�n de la vivienda";
label variable cv1b04 "N�mero de habitaciones";
label variable cv1b05 "Material predominante en las paredes exteriores de la casa o edificio";
label variable cv1b06 "Material predominante en los pisos";
label variable cv1b07 "Sistema de aprovisionamiento del agua en el hogar";
label variable cv1b08 "Procedencia del agua";
label variable cv1b09 "Esta vivienda �Tiene ba�o/letrina?";
label variable cv1b10 "El ba�o tiene";
label variable cv1b11 "Tipo de desague del inodoro";
label variable cv1b12 "m2 de superficie cubierta de la vivienda";
label variable cv1c01 "Las personas que residen en la vivienda comparten gastos de comida";
label variable ch01_a "Dispone de cochera";
label variable ch01_b "Dispone de jard�n";
label variable ch01_c "Dispone de piscina";
label variable ch01_d "Dispone de �rea deportiva";
label variable ch02_a "Dispone de huerta para consumo del hogar";
label variable ch02_b "Dispone de corral para consumo del hogar";
label variable ch03 "Paredes interiores revocadas o revestidas";
label variable ch04 "N�mero total de habitaciones o piezas de uso exclusivo en el hogar";
label variable ch05 "N�mero de habitaciones o piezas de uso exclusivo en el hogar";
label variable ch06 "El hogar posee ba�o/letrina";
label variable ch07 "N�mero de cuartos de ba�o de uso exclusivo";
label variable ch08 "El hogar posee cocina";
label variable ch09 "Combustible utilizado para cocinar";
label variable ch10 "Instalaci�n el�ctrica";
label variable ch11 "Sistema de calefacci�n en el hogar";
label variable ch12 "El hogar posee aire acondicionado";
label variable ch13_a "El hogar posee tel�fono celular";
label variable ch13_b "El hogar posee tel�fono de l�nea";
label variable ch14 "Tenencia del inmueble";
label variable ch15 "�Obtuvo alg�n pr�stamo o cr�dito para comprar, construir o reparar la vivienda?";
label variable jnivins "Nivel de instrucci�n del jefe del hogar";
label variable jedad "Edad del jefe del hogar";
label variable jgrupedad "Edad del jefe del hogar agrupada";
label variable jsexo "Sexo del jefe del hogar";
label variable jsitocup "Situaci�n ocupacional del jefe del hogar";
label variable jcatocup "Categor�a ocupacional del jefe del hogar";
label variable jcatocup_s "Categor�a ocupacional de la ocupaci�n secundaria del jefe del hogar";
label variable jcatocup_a "Categor�a ocupacional de la ocupaci�n anterior del jefe del hogar";
label variable jcondocup "Condici�n de ocupaci�n del jefe del hogar";
label variable jcomed "Cobertura m�dica del jefe del hogar";
label variable jcomed2 "Tipo de cobertura m�dica del jefe del hogar";
label variable jcomed3 "Condici�n de afiliaci�n y tipo de cobertura m�dica del jefe de hogar";
label variable cantmiem "Cantidad de miembros del hogar";
label variable miemagrup "Cantidad de miembros del hogar agrupada";
label variable cantadequi "Cantidad de adultos equivalentes";
label variable cantocup "Cantidad de miembros ocupados";
label variable menor14 "Cantidad menores de 14 a�os";
label variable mayor65 "Cantidad mayores de 65 a�os";
label variable cantping "Cantidad perceptores de ingreso";
label variable tasadep "Tasa de dependencia";
label variable permieoc "Cantidad de personas por miembro ocupado";
label variable tipohog "Tipo de hogar";
label variable regten "R�gimen de tenencia de la vivienda agrupado";
label variable propauto "Propietario de auto"; 
label variable propauto2 "Propietario de auto 2"; 
label variable gc_1 "Gasto en Alimentos y bebidas"; 
label variable gc_2 "Gasto en Indumentaria y calzado"; 
label variable gc_3 "Gasto en Vivienda"; 
label variable gc_4 "Gasto en Equipamiento y funcionamiento del hogar"; 
label variable gc_5 "Gasto en Atenci�n m�dica y gastos para la salud"; 
label variable gc_6 "Gasto en Transporte y comunicaciones"; 
label variable gc_7 "Gasto en Esparcimiento y cultura"; 
label variable gc_8 "Gasto en Educaci�n"; 
label variable gc_9 "Gasto en Bienes y servicios varios"; 
label variable gastot "Gasto total de consumo del hogar";
label variable gascomp "Gasto de consumo en compras del hogar";
label variable gasvent "Ventas de bienes de consumo del hogar";
label variable fp_contado "Gasto total de consumo en compras con forma de pago al contado";
label variable fp_credito "Gasto total de consumo en compras con forma de pago a cr�dito";
label variable fp_trabajo "Gasto total de consumo en recibido en pago por su trabajo o retirado del propio negocio";
label variable fp_otras "Gasto total de consumo en compras con otras formas de pago";
label variable fp_indef "Gasto total de consumo en compras con forma de pago indefinida";
label variable fp_tarjetas "Gasto total de consumo en compras con forma de pago tarjetas prepagas o recargables";
label variable tn_hipsup "Gasto total de consumo en compras en hiper y supermercado";
label variable tn_otros "Gasto total de consumo en compras en otros lugares de adquisici�n";
label variable tn_indef "Gasto total de consumo en compras sin lugar de adquisici�n";
label variable tn_autoserv "Gasto total de consumo en compras en autoservicios y otros negocios con menos de 4 cajas registradoras";
label variable tn_comedor "Gasto total de consumo en compras en comedor, bar de f�brica, facultad";
label variable tn_especie "Gasto total de consumo retiradas u otorgadas en el trabajo";
label variable tn_internet "Gasto total de consumo en compras en Internet";
label variable tn_restaurant "Gasto total de consumo en restaurantes, bares y otros";
label variable ingtoth "Ingreso total del hogar (promedio)";
label variable gastoc2c3 "Gasto en cuestionarios 2 y 3";
label variable ingpch "Ingreso per c�pita del hogar (promedio)";
label variable m_nring "Marca de no respuesta de ingreso de los perceptores";
label variable mingpch "Ingreso per c�pita del hogar (�ltimo mes)";
label variable mingtoth "Ingreso total del hogar (�ltimo mes)";
label variable quigapht "Quintil de gasto de consumo perc�pita del hogar total pa�s";
label variable quigaphr "Quintil de gasto de consumo perc�pita del hogar por regi�n";
label variable qui23phr "Quintil de gasto de consumo en cuestionarios 2 y 3 perc�pita del hogar por regi�n";
label variable decgapht "Decil de gasto de consumo per c�pita del hogar total pa�s";
label variable decgaphr "Decil de gasto de consumo perc�pita del hogar por regi�n";
label variable decgaphtexpan "Decil de gasto de consumo per c�pita del hogar total pa�s expandido";
label variable decgaphrexpan "Decil de gasto de consumo perc�pita del hogar por regi�n expandido";
label variable decgaphp "Decil de gasto de consumo perc�pita del hogar por provincia";
label variable decgaphpexpan "Decil de gasto de consumo perc�pita del hogar por provincia expandido";
label variable deciptht "Decil de ingreso promedio total del hogar - Pa�s";
label variable decipthtexpan "Decil de ingreso promedio total del hogar - Pa�s expandido";
label variable decippht "Decil de ingreso promedio per c�pita total del hogar - Pa�s";
label variable decipphtexpan "Decil de ingreso promedio per c�pita total del hogar - Pa�s expandido";
label variable decimtht "Decil de ingreso �ltimo mes total del hogar - Pa�s";
label variable decimthtexpan "Decil de ingreso �ltimo mes total del hogar - Pa�s expandido";
label variable decimpht "Decil de ingreso �ltimo mes per c�pita total del hogar - Pa�s";
label variable decimphtexpan "Decil de ingreso �ltimo mes per c�pita total del hogar - Pa�s expandido";
label variable vinpch_r "Ventil de ingreso per c�pita del hogar por regi�n";

compress;
saveold "`path'\Cleaned\Hogares.dta", replace;
