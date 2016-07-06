
* Encoding: UTF-8.

* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*  M a n e j o      d e      b a s e s       d e     d a t o s     c o n       l a     E n c u e s t a     N a c i o n a l     d e    O c u p a c i ó n     y     E m p l e o     ( E N O E ) 
*
* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


* El objetivo de esta sintaxis es ofrecer un panorama general del SPSS.

*   Índice
*   1. Concatenar variables.
*   2. Ordenar los casos.
*   3. Función SUBSTR.
*   4.  Matriz Laboral. 
*        4.1 Población Ocupada.
*        4.2 Con seguridad social.
*   5.  Matriz masa de horas. 


*1. Concatenar variables.

        STRING  k (A17).
        COMPUTE k=CONCAT(cd_a, ent, con, v_sel, n_hog, h_mud, n_ren).
        EXECUTE.

*2. Ordenar los casos

        SORT CASES BY k(A).
 
*   3. Función SUBSTR.
        
        *Para obtener los subsectores es necesario extraer los primeros 3 dígitos de la clasificación de la Unidad Económica
        *La función CHAR.SUBSTR sirve para hacer la extracción, solo se debe tener cuidado que la variable donde se va a guardar
        * esta información también sea caracter.

        STRING  sub_sect (A3).
        COMPUTE sub_sect = CHAR.SUBSTR(P4a,1,3).
        EXECUTE.

       
        VARIABLE LABELS sub_sect "Subsectores". 
        VALUE LABELS sub_sect
        111	"Agricultura "
        112	"Ganadería "
        113	"Aprovechamiento forestal "
        114	"Pesca, caza y captura"
        115	"Servicios relac. con act. agropecuarias y forestales "
        211	"Extracción de petróleo y gas "
        212	"Minería de minerales metálicos y no metálicos"
        213	"Servicios relacionados con la minería "
        221	"Generación y suministro de energía eléctrica "
        222	"Agua y suministro de gas por ductos"
        236	"Edificación"
        237	"Construcción de obras de ingeniería civil u obra pesada "
        238	"Trabajos especializados para la construcción "
        311	"Industria alimentaria "
        312	"Industria de las bebidas y del tabaco "
        313	"Fabricación de insumos textiles "
        314	"Confección de productos textiles, excepto prendas de vestir "
        315	"Fabricación de prendas de vestir "
        316	"Fabricación de productos de cuero, piel y materiales sucedáneos"
        321	"Industria de la madera "
        322	"Industria del papel "
        323	"Impresión e industrias conexas "
        324	"Fabricación de productos derivados del petróleo y carbón"
        325	"Industria química "
        326	"Industria del plástico y del hule "
        327	"Fabricación de productos a base de minerales no metálicos "
        331	"Industrias metálicas básicas "
        332	"Fabricación de productos metálicos "
        333	"Fabricación de maquinaria y equipo "
        334	"Fabricación de equipo de computación, comunicación y otros electrónicos "
        335	"Fabricación de equipo de generación eléctrica y aparatos eléctricos "
        336	"Fabricación de equipo de transporte"
        337	"Fabricación de muebles y productos relacionados"
        338	"Otras industrias manufactureras "
        431	"Comercio al por mayor de alimentos, bebidas y tabaco "
        432	"Comercio al por mayor de productos textiles y calzado "
        433	"Comercio al por mayor de productos farmacéuticos, para el esparcimiento y electrodomésticos "
        434	"Comercio al por mayor de materias primas agropecuarias e industriales"
        435	"Comercio al por mayor de maquinaria, mobiliario y equipo agropecuario, industrial y de servicios "
        436	"Comercio al por mayor de camiones "
        437	"Intermediación y comercio al por mayor por medios masivos de comunicación y otros medios "
        461	"Comercio al por menor de alimentos, bebidas y tabaco "
        462	"Comercio al por menor en tiendas de autoservicio y departamentales "
        463	"Comercio al por menor de productos textiles, accesorios de vestir y calzado "
        464	"Comercio al por menor de artículos para el cuidado de la salud "
        465	"Comercio al por menor de artículos de papelería y otros de uso personal "
        466	"Comercio al por menor de enseres domésticos, computadoras"
        467	"Comercio al por menor de artículos de ferretería, tlapalería y vidrios "
        468	"Comercio al por menor de vehículos de motor, refacciones, combustibles y lubricantes "
        469	"Intermediación y comercio al por mayor por medios masivos de comunicación y otros medios "
        481	"Transporte aéreo "
        482	"Transporte por ferrocarril "
        483	"Transporte por agua "
        484	"Autotransporte de carga "
        485	"Transporte terrestre de pasajeros, excepto por ferrocarril "
        486	"Transporte por ductos "
        487	"Transporte turístico "
        488	"Servicios relacionados con el transporte "
        491	"Servicios postales "
        492	"Servicios de mensajería y paquetería "
        493	"Servicios de almacenamiento "
        511	"Edición de publicaciones y de software, excepto a través de Internet "
        512	"Industria fílmica y del video, e industria del sonido "
        515	"Radio y televisión, excepto a través de Internet "
        516	"Creación y difusión de contenido exclusivamente a través de Internet "
        517	"Otras telecomunicaciones "
        518	"Proveedores de acceso a Internet, servicios de búsqueda en la red y servicios de procesamiento de información "
        519	"Otros servicios de información"
        521	"Banca central (Banco de México) "
        522	"Instituciones de intermedicación, crediticia y financiera no bursatil"
        523	"Actividades bursátiles cambiarias y de inversión financiera "
        524	"Compañías de fianzas, seguros y pensiones "
        531	"Servicios inmobiliarios "
        532	"Servicios de alquiler de bienes muebles"
        533	"Servicios de alquiler de marcas registradas, patentes y franquicias "
        541	"Servicios profesionales, científicos y técnicos "
        551	"Dirección de corporativos y empresas "
        561	"Servicios de apoyo a los negocios "
        562	"Manejo de desechos y servicios de remediación "
        611	"Servicios educativos"
        621	"Servicios médicos de consulta externa y servicios relacionados"
        622	"Hospitales"
        623	"Residencias de asistencia social y para el cuidado de la salud "
        624	"Otros servicios de asistencia social "
        711	"Servicios artísticos y deportivos y otros relacionados"
        712	"Museos, jardines botánicos y similares "
        713	"Servicios de entretenimiento en instalaciones recreativas"
        721	"Servicios de alojamiento temporal "
        722	"Servicios de preparación de alimentos y bebidas "
        811	"Servicios de reparación y mantenimiento"
        812	"Servicios personales "
        813	"Asociaciones y organizaciones "
        814	"Hogares con empleados domésticos"
        931	"Actividades del gobierno"
        932	"Organismos internacionales y extraterritoriales "
        999	"No especificado".
        EXECUTE.

        FREQUENCIES VARIABLES=sub_sect.

        COMPUTE sec=0.
         IF (MH_FIL2=1) sec=1.
         IF (MH_FIL2=3) sec=2.
         IF (MH_FIL2=4) sec=3.
         IF (MH_FIL2=2) sec=4.

        VARIABLE LABELS sec "Sectores". 
        VALUE LABELS sec
        1 "Sector informal"
        2 "Sector formal"
        3 "Sector agropecuario"
        4 "Trabajadores domésticos".
        

        CROSSTABS
          /TABLES=sec BY sub_sect
          /FORMAT=AVALUE TABLES
          /CELLS=COUNT
          /COUNT ROUND CELL.



* 4.  Matriz Laboral. 

*        4.1 Población Ocupada


        *r_def  ---------> Entrevista completa
        *c_res ---------> Residentes definitivos
        *eda   ----------> Mayores de 15 años.
        *clase2   ------> Población Ocupada.

        
        USE ALL.
        COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 & clase2=1).
        VARIABLE LABELS filtro 'r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15  (FILTER)'.
        VALUE LABELS filtro 0 'No seleccionado' 1 'Seleccionado'.
        FORMATS filtro (f1.0).
        FILTER BY filtro.
        EXECUTE.

        WEIGHT BY fac. 

        CROSSTABS
          /TABLES=sec BY sub_sect
          /FORMAT=AVALUE TABLES
          /CELLS=COUNT
          /COUNT ROUND CELL.
      
        FILTER OFF.
        USE ALL.
        EXECUTE.


*        4.2 Con seguridad social.

        *r_def  ---------> Entrevista completa
        *c_res ---------> Residentes definitivos
        *eda   ----------> Mayores de 15 años.
        *SEG_SOC   ------> Con seguridad social.

        USE ALL.
        COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 & SEG_SOC=1).
        VARIABLE LABELS filtro 'r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15  (FILTER)'.
        VALUE LABELS filtro 0 'No seleccionado' 1 'Seleccionado'.
        FORMATS filtro (f1.0).
        FILTER BY filtro.
        EXECUTE.
 
        WEIGHT BY fac. 

        CROSSTABS
          /TABLES=sec BY sub_sect
          /FORMAT=AVALUE TABLES
          /CELLS=COUNT
          /COUNT ROUND CELL.
      
        FILTER OFF.
        USE ALL.
        EXECUTE.


* 5.  Matriz masa de horas. 

        VARIABLE LABELS eda5c "Edad (5 categorías)". 
        VALUE LABELS eda5c
        1 "14 a 24 años"
        2 "25 a 44 años"
        3 "45 a 64 años"
        4 "65 años y más"
        5 "Edad no especificado".


        COMPUTE esc=0.
         IF ( CS_P13_1="01" or CS_P13_1="02") esc=1.
         IF ( CS_P13_1="03") esc=2.
         IF ( CS_P13_1="04" or CS_P13_1="05") esc=3.
         IF ( CS_P13_1="06" or CS_P13_1="07") esc=3.
         IF ( CS_P13_1="08" or CS_P13_1="09") esc=3.
         IF ( CS_P13_1="99") esc=4.

        VARIABLE LABELS esc "Esolaridad". 
        VALUE LABELS esc
        1 "Primaria"
        2 "Secundaria "
        3 "Medio superior y superior"
        4 "No sabe".

        USE ALL.
        COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15).
        VARIABLE LABELS filtro 'r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15  (FILTER)'.
        VALUE LABELS filtro 0 'No seleccionado' 1 'Seleccionado'.
        FORMATS filtro (f1.0).
        FILTER BY filtro.
        EXECUTE.
 
        WEIGHT BY fac. 

        * Tablas personalizadas.
        CTABLES
          /VLABELS VARIABLES=eda5c esc sub_sect ingocup DISPLAY=LABEL
          /TABLE eda5c > esc BY sub_sect [C] > ingocup [S][SUM]
          /CATEGORIES VARIABLES=eda5c esc sub_sect ORDER=A KEY=VALUE EMPTY=INCLUDE.



