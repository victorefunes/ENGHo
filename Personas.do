/*
C�digo para generar la base de caracter�sticas de las personas
*/

clear all
set more off

*Cambiar "path" por la carpeta donde est�n guardados los archivos
local path "C:\Users\VictorF\Documents\ENGH 2012"
cd "`path'\bases_datos_engho2012"

use "engho_personas.dta"

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

label define CP02
	0 "Menor de 1 a�o"
   98 "98 � m�s"
   99 "NS/NC"
;

destring cp03, replace;
label define CP03
	1 "Jefe/a"
	2 "C�nyuge/pareja"
	3 "Hijo/hijastro/a"
	4 "Yerno/nuera"
	5 "Hermano/a"
	6 "Nieto/nieta"
	7 "Cu�ado/a"
	8 "Padre o madre/suegra o suegro"
	9 "Otro familiar"
   10 "Otro"
;   

destring cp04, replace;
label define CP04
	1 "S�"
	2 "No" 
;

destring cp05, replace;
label define CP05
	1 "S�"
	2 "No" 
;

destring cp06, replace;
label define CP06
	1 "S�"
	2 "No" 
;

destring cp07, replace;
label define CP07
	1 "S�"
	2 "No" 
;

destring cp08, replace;
label define CP08
	1 "S�"
	2 "No" 
;

destring cp09, replace;
label define CP09
	1 "S�"
	2 "No" 
;

destring cp10, replace;
label define CP10
	1 "S�"
	2 "No" 
;

destring cp11, replace;
label define CP11
	1 "S�"
	2 "No" 
;

destring cp12, replace;
label define CP12
	1 "Var�n"
	2 "Mujer" 
;

destring cp13, replace;
label define CP13
	1 "Unido/a"
	2 "Casado/a"
	3 "Separado/a, divorciado/a"
	4 "Viudo/a"
	5 "Soltero/a"
	9 "NS/NC"
;

forvalues x=1/7{;
destring cp14_0`x', replace;
};

destring cp14_09, replace;
label define CP14
	1 "Si"
;	

destring cp15, replace;
label define CP15
	1 "Asiste a un establecimiento estatal"
	2 "Asiste a un establecimiento privado"
	3 "No asiste pero asisti�"
	4 "Nunca asisti�"
	9 "NS/NC"
;

destring cp16, replace;
label define CP16
	0 "Ninguno"
	1 "Jard�n (2, 3 y 4 a�os)"
	2 "Preescolar (5 a�os)"
	3 "EGB (1� a 9� a�o)"
	4 "Primario"
	5 "Polimodal (1� a 3� o 4� a�o)"
	6 "Secundario (1� a 5� o 6� a�o)"
	7 "Superior no universitario"
	8 "Universitario"
	9 "Posgrado universitario"
   98 "Educaci�n especial"  
   99 "NS/NC"
;

destring cp16a, replace;
label define CP16A
	1 "primario de 6 a�os"
	2 "primario de 7 a�os"
;

destring cp17, replace;
label define CP17
	1 "S�"
	2 "No"
;

destring cp18, replace;
label define CP18
	0 "Ninguno"
	1 "Primero"
	2 "Segundo"
	3 "Tercero"
	4 "Cuarto"
	5 "Quinto"
	6 "Sexto"
	7 "S�ptimo"
	8 "Octavo"
   99 "NS/NC"
;

destring cp19, replace;
label define CP19
	1 "S�"
	2 "No"
;

destring cp20, replace;
label define CP20
	1 "S�"
	2 "No"
;

destring cp21, replace;
label define CP21
	1 "Con un familiar en su negocio, taller o chacra"
	2 "Como trabajador ad-honorem"
	3 "De otra forma"
;

destring cp22, replace;
label define CP22
	1 "No deseaba/no quer�a trabajar"
	2 "No pod�a trabajar por razones personales"
	3 "No ten�a/no consegu�a trabajo"
	4 "No tuvo pedidos/clientes"
	5 "Ten�a trabajo/negocio al que no concurri�"
;

destring cp23, replace;
label define CP23
	1 "Vacaciones, licencia"
	2 "Causas personales"
	3 "Huelga, conflicto laboral"
	4 "Otras causas laborales"
	5 "Suspensi�n con pago"
	6 "Suspensi�n sin pago"
;

destring cp24, replace;
label define CP24
	1 "Un solo empleo/ocupaci�n"
	2 "Dos empleos/ocupaciones"
	3 "Tres o m�s empleos/ocupaciones"
;

destring cp27, replace;
label define CP27
	1 "Estatal"
	2 "Privado"
	3 "De otro tipo"
;

destring cp28, replace;
label define CP28
	1 "Para el negocio/empresa/actividad de un familiar"
	2 "Para su propio negocio/empresa o actividad"
	3 "Como servicio dom�stico"
	4 "Como empleado u obrero para un patr�n/empresa/instituci�n/agencia de empleo"
	5 "Otros"
;

destring cp29, replace;
label define CP29
	1 "Le pagan sueldo"
	2 "Retira dinero y/o mercader�a"
	3 "No retira nada"
;

destring cp30, replace;
label define CP30
	1 "S�"
	2 "No"
;

destring cp31, replace;
label define CP31
	1 "S�"
	2 "No"
;

destring cp32, replace;
label define CP32
	1 "S�"
	2 "No"
;

destring cp33, replace;
label define CP33
	1 "S�"
	2 "No"
;

destring cp34, replace;
label define CP34
	1 "Distintos clientes"
	2 "Una sola empresa/instituci�n/negocio"
	3 "Un solo hogar"
;

destring cp35, replace;
label define CP35
	1 "No agropecuario"
	2 "Agropecuario"
;

destring cp37, replace;
label define CP37
	1 "Para el negocio/empresa/actividad de un familiar"
	2 "Para su propio negocio/empresa o actividad"
	3 "Como servicio dom�stico"
	4 "Como empleado u obrero para un patr�n/empresa/instituci�n/agencia de empleo"
;

destring cp38_01, replace;
label define CP38_01
	1 "No agropecuario"
	2 "Agropecuario"
;

destring cp39, replace;
label define CP39
	1 "S�"
	2 "No"
;

destring cp40, replace;
label define CP40
	1 "S�"
	2 "No"
;

destring cp41, replace;
label define CP41
	1 "S�"
	2 "No"
;

destring cp42, replace;
label define CP42
	1 "S�"
	2 "No"
;

destring cp43, replace;
label define CP43
	1 "S�"
	2 "No"
;

destring cp44, replace;
label define CP44
	1 "S�"
	2 "No"
;

destring cp45, replace;
label define CP45
	1 "S�"
	2 "No"
;

destring cp46, replace;
label define CP46
	1 "S�"
	2 "No"
;

destring cp47, replace;
label define CP47
	1 "S�"
	2 "No"
;

destring cp48, replace;
label define CP48
	1 "S�"
	2 "No"
;

destring cp49, replace;
label define CP49
	1 "S�"
	2 "No"
;

destring cp50, replace;
label define CP50
	1 "S�"
	2 "No"
;

destring cp51, replace;
label define CP51
	1 "S�"
	2 "No"
;

destring cp52, replace;
label define CP52
	1 "Educaci�n"
	2 "Salud"
	3 "Servicios sociales"
	4 "Cultura, deporte, recreaci�n"
	5 "Religi�n"
	6 "Medio ambiente"
	7 "Asociaciones profesionales/sindicales"
	8 "Otros"
;

destring cp53, replace;
label define CP53
	1 "Varios d�as a la semana"
	2 "Un d�a por semana"
	3 "Algunos d�as al mes"
	4 "Otra frecuencia"
;

destring ct02, replace;
label define CT02
	1 "Cinco d�as o m�s"
	2 "De uno a cuatro d�as"
	3 "No utiliza"
	9 "NS/NC"
;

destring ct03, replace;
label define CT03
	1 "Colectivo"
	2 "Tren"
	3 "Subte"
	4 "Taxis y remis"
	5 "Otros"
	6 "Una combinaci�n de medios"
;

destring ct04, replace;
label define CT04
	1 "S�"
	2 "No"
	9 "NS/NC"
;

destring ct05, replace;
label define CT05
	1 "S�"
	2 "No, porque la recibe gratis del empleador"
	3 "No, porque la recibe gratis en el comedor escolar"
	4 "No, porque la lleva de su casa"
	5 "No, por otras razones"
;

destring ct06, replace;
label define CT06
	1 "S�"
	2 "No"
	9 "NS/NC"
;

destring ct07, replace;
label define CT07
	1 "Los d�as h�biles"
	2 "Todos los d�as"
	3 "Algunos d�as"
	4 "No recibe"
	9 "NS/NC"
;

destring grupedad, replace;
label define GRUPEDAD	
	1 "Entre 0 y 4"
	2 "Entre 5 y 9"
	3 "Entre 10 y 14"
	4 "Entre 15 y 19"
	5 "Entre 20 y 24"
	6 "Entre 25 y 29"
	7 "Entre 30 y 34"
	8 "Entre 35 y 39"
	9 "Entre 40 y 44"
   10 "Entre 45 y 49"
   11 "Entre 50 y 54"
   12 "Entre 55 y 59"
   13 "Entre 60 y 64"
   14 "Entre 65 y 69"
   15 "Entre 70 y 74"
   16 "Entre 75 y 79"
   17 "Entre 80 y 97"
   98 "98 y m�s"
;

destring grupedad2, replace;
label define GRUPEDAD2
	1 "Entre 0 y 9"
	2 "Entre 10 y 14"
	3 "Entre 15 y 18"
	4 "Entre 19 y 25"
	5 "Entre 26 y 34"
	6 "Entre 35 y 49"
	7 "Entre 50 y 64"
	8 "65 y m�s"
;

destring grupedad3, replace;
label define GRUPEDAD3
	1 "Entre 0 y 9"
	2 "Entre 10 y 18"
	3 "Entre 19 y 25"
	4 "Entre 26 y 34"
	5 "Entre 35 y 64"
	6 "65 y m�s"
;

destring grupedad4, replace;
label define GRUPEDAD4
	0 "Entre 0 y 9"
	1 "Entre 10 y 17"
	2 "18 y m�s"
;

destring nivins, replace;
label define NIVINS
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

destring niveleding, replace;
label define NIVELEDING
	1 "Hasta secundaria incompleta"
	2 "Secundaria completa"
	3 "M�s de secundaria completa"
   99 "NS/NC"
;

destring niveled2, replace;
label define NIVELED2
	1 "Hasta secundaria incompleta"
	2 "Hasta superior incompleto"
	3 "Superior completo"
	9 "Otros"
;

destring asiste, replace;
label define ASISTE
	1 "Estatal"
	2 "Privado"
	3 "No asiste pero asisti�"
	4 "Nunca asisti�"
	9 "NS/NC"
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
	3 "Patr�n"
	4 "Trabajador familiar sin remuneraci�n"
;

destring catocup_s, replace;
label define CATOCUP_S
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Patr�n"
	4 "Trabajador familiar sin remuneraci�n"	
;

destring catocup_a, replace;
label define CATOCUP_A
	0 "NS/NC"
	1 "Asalariado"
	2 "Cuenta propia"
	3 "Patr�n"	
	4 "Trabajador familiar sin remuneraci�n"	
;

destring comed, replace;
label define COMED
	1 "S�"
	2 "No"
	9 "NS/NC"
;

destring tcomed2, replace;
label define TCOMED2
	0 "NS/NC"
	1 "Sin cobertura m�dica"
	2 "S�lo obra social obligatoria"
	3 "Sistema prepago"
	4 "Programa estatal"
	5 "Emergencias m�dicas"
	9 "NS/NC"	
;

destring tcomed3, replace;
label define TCOMED3
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

destring sitocup, replace;
label define SITOCUP
	0 "NS/NC"
	1 "No ocupado"
	2 "Ocupado asalariado"
	3 "Ocupado cuenta propia o patr�n"
;

destring percept, replace;
label define PERCEPT
	1 "Perceptor de ingresos"
	2 "No perceptor de ingresos"
;

destring benefplan, replace;
label define BENEFPLAN
	1 "Si"
	2 "No"
;	

destring comeafuera, replace;
label define COMEAFUERA
	1 "Si"
	2 "No"
;

destring usatransp, replace;
label define USATRANSP
	1 "Si"
	2 "No"
;

destring perc_trabajo, replace;
label define PERC_TRABAJO
	1 "Si"
	2 "No"
;

destring jubpen, replace;
label define JUBPEN
	1 "Si"
	2 "No"
;

destring perc_prodprop, replace;
label define PERC_PRODPROP
	1 "Si"
	2 "No"
;

destring perc_transferencias, replace;
label define PERC_TRANSFERENCIAS
	1 "Si"
	2 "No"
;	

destring perc_rentas, replace;
label define PERC_RENTAS
	1 "Si"
	2 "No"
;

label values provincia PROVINCIA;
label values region REGION;
label values subregion SUBREGION;	
label values cp02 CP02;
label values cp03 CP03;
label values cp04 CP04;
label values cp05 CP05;
label values cp06 CP06;
label values cp07 CP07;
label values cp08 CP08;
label values cp09 CP09;
label values cp10 CP10;
label values cp11 CP11;
label values cp12 CP12;
label values cp13 CP13;
forvalues x=1/7{;
label values cp14_0`x' CP14;
};
label values cp14_09 CP14_09;
label values cp15 CP15;
label values cp16 CP16;
label values cp16a CP16A;
label values cp17 CP17;
label values cp18 CP18;
label values cp19 CP19;
label values cp20 CP20;
label values cp21 CP21;
label values cp22 CP22;
label values cp23 CP23;
label values cp24 CP24;
label values cp27 CP27;
label values cp28 CP28;
label values cp29 CP29;
label values cp30 CP30;
label values cp31 CP31;
label values cp32 CP32;
label values cp33 CP33;
label values cp34 CP34;
label values cp35 CP35;
label values cp37 CP37;
label values cp38_01 CP38_01;
label values cp39 CP39;
label values cp40 CP40;
label values cp41 CP41;
label values cp42 CP42;
label values cp43 CP43;
label values cp44 CP44;
label values cp45 CP45;
label values cp46 CP46;
label values cp47 CP47;
label values cp48 CP48;
label values cp49 CP49;
label values cp50 CP50;
label values cp51 CP51;
label values cp52 CP52;
label values cp53 CP53;
label values ct02 CT02;
label values ct03 CT03;
label values ct04 CT04;
label values ct05 CT05;
label values ct06 CT06;
label values ct07 CT07;
label values grupedad GRUPEDAD;
label values grupedad2 GRUPEDAD2;
label values grupedad3 GRUPEDAD3;
label values grupedad4 GRUPEDAD4;
label values nivins NIVINS;
label values niveleding NIVELEDING;
label values niveled2 NIVELED2;
label values asiste ASISTE;
label values condocup CONDOCUP;
label values catocup CATOCUP;
label values catocup_s CATOCUP_S;
label values catocup_a CATOCUP_A;
label values comed COMED;
label values tcomed2 TCOMED2;
label values tcomed3 TCOMED3;
label values sitocup SITOCUP;
label values percept PERCEPT;
label values benefplan BENEFPLAN;
label values comeafuera COMEAFUERA;
label values usatransp USATRANSP;	
label values perc_trabajo PERC_TRABAJO;
label values jubpen JUBPEN;
label values perc_prodprop PERC_PRODPROP;
label values perc_transferencias PERC_TRANSFERENCIAS;
label values perc_rentas PERC_RENTAS;

* Etiquetas de variables;

label variable expan "Factor de expansi�n";
label variable miembro "N�mero de miembro";
label variable clave "Clave del hogar";
label variable provincia "Provincia";
label variable region "Regi�n";
label variable subregion "Sub regi�n";
label variable expan "Factor de expansi�n";
label variable cp02 "Edad";
label variable cp03 "Parentesco con el jefe";
label variable cp04 "Aporta la mayor parte de sus ingresos a otro hogar";
label variable cp05 "Permanencia nocturna"; 
label variable cp06 "Vive en esta vivienda hace m�s de 6 meses";
label variable cp07 "Fij� o est� dispuesto a fijar residencia en esta vivienda";
label variable cp08 "Trabaja como servicio dom�stico o vive como pensionista en otra vivienda";
label variable cp09 "Habitualmente aporta la mayor parte de sus ingresos a este hogar";
label variable cp10 "Hace m�s de seis meses que est� ausente en forma continua";
label variable cp11 "Fij� o piensa fijar residencia en otra vivienda";
label variable cp12 "Sexo";
label variable cp13 "Estado conyugal";
label variable cp14_01 "Salud-No tiene ninguna";
label variable cp14_02 "Salud-PAMI";
label variable cp14_03 "Salud-Obra social";
label variable cp14_04 "Salud-Prepaga a trav�s de obra social";
label variable cp14_05 "Salud-Prepaga por contrataci�n voluntaria";
label variable cp14_06 "Salud-Programas o planes estatales de salud";
label variable cp14_07 "Salud-Emergencia m�dica";
label variable cp14_09 "Salud-NS/NC";
label variable cp15 "Asiste o asisti� a alg�n establecimiento educativo";
label variable cp16 "Cu�l es el nivel m�s alto que cursa o curs�";
label variable cp16a "Curs�";
label variable cp17 "Finaliz� ese nivel";
label variable cp18 "Cu�l fue el �ltimo grado o a�o que aprob�";
label variable cp19 "La semana pasada trabaj� al menos una hora";
label variable cp20 "Es un trabajo pago (dinero o especie)";
label variable cp21 "Trabaj�";
label variable cp22 "La semana pasada";
label variable cp23 "No concurri� por";
label variable cp24 "La semana pasada ten�a";
label variable cp25 "Horas trabajadas en la ocupaci�n principal";
label variable cp26 "Horas trabajadas en otras ocupaciones";
label variable cp27 "El negocio/empresa/instituci�n/actividad en la que trabaja m�s horas semanales es";
label variable cp28 "En esa ocupaci�n principal, trabaja";
label variable cp29 "Por este trabajo";
label variable cp30 "Por ese trabajo le hacen descuentos jubilatorios";
label variable cp31 "El establecimiento/negocio/empresa/actividad es una SRL/SA/comandita por acciones o cooperativa";
label variable cp32 "Usted dirige su establecimiento/negocio/empresa o actividad";
label variable cp33 "En ese negocio/empresa o actividad emplea personas asalariadas";
label variable cp34 "En ese negocio/empresa u actividad, trabaja habitualmente para";
label variable cp35 "A qu� se dedica el establecimiento/negocio/empresa/instituci�n en el que trabaja";
label variable cp36 "Horas de trabajo semanales en la ocupaci�n principal";
label variable cp37 "En la ocupaci�n secundaria, trabaja";
label variable cp38_01 "Ocupaci�n secundaria: a qu� se dedica el establecimiento/negocio/empresa/instituci�n en el que trabaja";
label variable cp38_02 "Descripci�n";
label variable cp39 "Percibi� alg�n ingreso por su trabajo principal actual";
label variable cp40 "Percibi� alg�n ingreso por su/s trabajo/s u secundario/s actuales";
label variable cp41 "Percibi� alg�n ingreso por su/s trabajo/s anterior/es";
label variable cp42 "Percibi� alg�n ingreso por su jubilaci�n o pensi�n nacional";
label variable cp43 "Percibi� alg�n ingreso por su jubilaci�n o pensi�n provincial/municipal";
label variable cp44 "Percibi� alg�n ingreso por rentas, alquileres, utilidades o beneficios";
label variable cp45 "Percibi� alg�n ingreso por cuota de alimentos";
label variable cp46 "Percibi� alg�n ingreso por asignaci�n universal por hijo";
label variable cp47 "Percibi� alg�n ingreso por planes sociales que no se trabaja/subsidios por desempleo";
label variable cp48 "Percibi� alg�n ingreso por ayuda familiar permanente en dinero";
label variable cp49 "Percibi� alg�n ingreso por otros corrientes";
label variable cp50 "Percibi� alg�n ingreso por producci�n propia para consumo del hogar";
label variable cp51 "En el �ltimo mes realiz� tareas como voluntario";
label variable cp52 "En qu� sector realiz� esta tarea como voluntario";
label variable cp53 "Se dedic� a esta tarea";
label variable ct02 "Cu�ntos d�as a la semana utiliza el transporte p�blico";
label variable ct03 "Qu� medios de transporte p�blico utiliza principalmente";
label variable ct04 "Almuerza o cena fuera del hogar en horas de trabajo o estudio";
label variable ct05 "Paga por esa comida";
label variable ct06 "Almuerza o cena fuera del hogar por razones de esparcimiento";
label variable ct07 "Recibe alimentos gratuitamente en comedores comunitarios";
label variable grupedad "Edad agrupada";
label variable grupedad2 "Edad agrupada 2";
label variable grupedad3 "Edad agrupada 3";
label variable grupedad4 "Edad agrupada 4";
label variable nivins "Nivel de instrucci�n";
label variable niveleding "Nivel de educaci�n agrupado para imputaci�n de ingresos";
label variable niveled2 "Nivel de educaci�n 2";
label variable asiste "Asiste a alg�n establecimiento educativo";
label variable condocup "Condici�n de ocupaci�n";
label variable catocup "Categor�a ocupacional";
label variable catocup_s "Categor�a ocupacional de la ocupaci�n secundaria";
label variable catocup_a "Categor�a ocupacional de la ocupaci�n anterior";
label variable comed  "Cobertura m�dica";
label variable tcomed2 "Condici�n de afiliaci�n y tipo de cobertura";
label variable tcomed3 "Condici�n de afiliaci�n y tipo de cobertura";
label variable sitocup "Situaci�n ocupacional";
label variable percept "Perceptor de ingresos";
label variable benefplan "Beneficiario de planes sociales";
label variable comeafuera "Come afuera";
label variable usatransp "Usa transporte p�blico";
label variable gastotc4 "Gasto total en C4";
label variable g131 "Gasto en comidas fuera del hogar";
label variable g612 "Gasto en transporte p�blico";
label variable g611 "Gasto en transporte privado";
label variable g623 "Gasto en comunicaciones";
label variable g911 "Gasto en cigarrillos";
label variable perc_trabajo "Perceptor por trabajo";
label variable jubpen "Perceptor por jubilaciones y pensiones";
label variable perc_prodprop "Perceptor por producci�n priopia";
label variable perc_transferencias "Perceptor por transferencias";
label variable perc_rentas "Perceptor por rentas";
label variable adequi "Coeficiente de adulto equivalente";

compress;
saveold "`path'\Cleaned\Personas.dta", replace;
