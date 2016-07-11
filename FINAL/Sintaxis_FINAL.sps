
* Encoding: UTF-8.

* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*  M a n e j o      d e      b a s e s       d e     d a t o s     c o n       l a     E n c u e s t a     N a c i o n a l     d e    O c u p a c i ó n     y     E m p l e o     ( E N O E ) 
*
* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


* El objetivo de esta sintaxis es ofrecer un panorama general del SPSS.

*   Índice

* 1.  Preparar bases.
* 2.  Unir las bases de datos.
* 3.  Función SUBSTR.
* 4.  Matriz Laboral. 
* 5.  Matriz masa de horas. 
* 6.  Matriz artesanos.



* 1. Preparar bases.

        *Para poder unir las bases, es necesario crear una llave (k) en ambas bases y ordenar los casos
        
        *1.1. Crear la llave.
    
                STRING  k (A17).
                COMPUTE k=CONCAT(cd_a, ent, con, v_sel, n_hog, h_mud, n_ren).
                EXECUTE.
        
        *1.1. Crear la llave.
               SORT CASES BY k(A).
        
        *Nota: Una vez que se tiene la llave, se deben guardar las bases.

* 2. Unir las bases de datos.

        *Para poder crear las matrices, se requieren las siguientes variables del COE1:
                * P3: Codificación de la ocupación (Trabajadores artesanales).
                * P4a: Catálogo de Código SCIAN.
                * P3M1 - P3M9: Prestaciones

        *2.1. .Match considerando como pivote la tabla SDEMT116
                * Si bien es más fácil hacer el match vía comandos, también se puede obtener con sintaxis. Si se opta por esta
                * última opción, se debe considerar:
                                *1. ConjuntoDatos1 = SDEMT116.
                                *2. ConjuntoDatos2 = COET116

                DATASET ACTIVATE ConjuntoDatos1.
                MATCH FILES /FILE=*
                  /FILE='ConjuntoDatos2'
                  /RENAME (cd_a con D_R d_sem eda ent fac h_mud n_ent n_hog n_inf n_pro_viv n_ren p1 p1a1 p1a2 p1a3 
                    p1b p1c p1d p1e p2_1 p2_2 p2_3 p2_4 p2_9 p2a_anio p2a_dia p2a_mes p2a_sem p2b p2b_anio p2b_dia 
                    p2b_mes p2b_sem p2c p2d1 p2d10 p2d11 p2d2 p2d3 p2d4 p2d5 p2d6 p2d7 p2d8 p2d9 p2d99 p2e p2f p2g1 
                    p2g2 p2h1 p2h2 p2h3 p2h4 p2h9 p3a p3b p3c1 p3c2 p3c3 p3c4 p3c9 p3d p3e p3f1 p3f2 p3g1_1 p3g1_2 
                    p3g2_1 p3g2_2 p3g3_1 p3g3_2 p3g4_1 p3g4_2 p3g9 p3g_tot p3h p3i p3j p3k1 p3k2 p3l1 p3l2 p3l3 p3l4 
                    p3l5 p3l9 p3n p3o p3p1 p3p2 p3q p3r p3r_anio p3r_mes p3s p3t_anio p3t_mes p4 p4_1 p4_2 p4_3 p4a_1 
                    p4b p4c p4d1 p4d2 p4d3 p4e p4f p4g p4h p4i p4i_1 p5 p5a p5b p5c_hdo p5c_hju p5c_hlu p5c_hma p5c_hmi 
                    p5c_hsa p5c_hvi p5c_mdo p5c_mju p5c_mlu p5c_mma p5c_mmi p5c_msa p5c_mvi p5c_tdia p5c_thrs p5d p5e1 
                    p5e_hdo p5e_hju p5e_hlu p5e_hma p5e_hmi p5e_hsa p5e_hvi p5e_mdo p5e_mju p5e_mlu p5e_mma p5e_mmi 
                    p5e_msa p5e_mvi p5e_tdia p5e_thrs p5f p5g1 p5g10 p5g11 p5g12 p5g13 p5g14 p5g15 p5g2 p5g3 p5g4 p5g5 
                    p5g6 p5g7 p5g8 p5g9 p5g99 p5h per r_def upm ur v_sel = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 
                    d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 
                    d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 d49 d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 
                    d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 d74 d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 
                    d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99 d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 
                    d110 d111 d112 d113 d114 d115 d116 d117 d118 d119 d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 
                    d130 d131 d132 d133 d134 d135 d136 d137 d138 d139 d140 d141 d142 d143 d144 d145 d146 d147 d148 d149 
                    d150 d151 d152 d153 d154 d155 d156 d157 d158 d159 d160 d161 d162 d163 d164 d165 d166 d167 d168 d169 
                    d170 d171 d172 d173 d174 d175) 
                  /BY k
                  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 
                    d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 d49 
                    d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 d74 
                    d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99 
                    d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 d116 d117 d118 d119 
                    d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 d130 d131 d132 d133 d134 d135 d136 d137 d138 d139 
                    d140 d141 d142 d143 d144 d145 d146 d147 d148 d149 d150 d151 d152 d153 d154 d155 d156 d157 d158 d159 
                    d160 d161 d162 d163 d164 d165 d166 d167 d168 d169 d170 d171 d172 d173 d174 d175.
                EXECUTE.
                

* 3. Función SUBSTR.
        
        *Para obtener los subsectores es necesario extraer los primeros 3 dígitos de la clasificación de la Unidad Económica
        *La función CHAR.SUBSTR sirve para hacer la extracción, solo se debe tener cuidado que la variable donde se va a guardar
        * esta información también sea caracter.

        STRING  sub_sect (A3).
        COMPUTE sub_sect = CHAR.SUBSTR(P4a,1,3).
        EXECUTE.

       *3.1 Variable para identificar los subsectores (sub_sect)

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
        
        
       *3.2 Variable sobre el tipo de empleo (sec).

                COMPUTE sec=0.
                 IF (MH_FIL2=1) sec=1.
                 IF (MH_FIL2=3) sec=2.
                 IF (MH_FIL2=4) sec=3.
                 IF (MH_FIL2=2) sec=4.
        
                VARIABLE LABELS sec "Subsectores". 
                VALUE LABELS sec
                1 "Sector informal"
                2 "Sector formal"
                3 "Sector agropecuario"
                4 "Trabajadores domésticos".
                
       *3.3 Tabulado (Los datos aún no están ponderados).

            CROSSTABS
              /TABLES=sec BY sub_sect
              /FORMAT=AVALUE TABLES
              /CELLS=COUNT
              /COUNT ROUND CELL.



* 4.  Matriz Laboral. 

            *4.1 Población Ocupada

            * Para hacer la matriz, se requiere incorporar dos tipos de cirterios:
                * Criterios de la ENOE:
                                *r_def  ---------> Entrevista completa
                                *c_res ---------> Residentes definitivos
                                *eda   ----------> Mayores de 15 años.
                * Criterios de la Matriz:
                                *clase2   ------> Población Ocupada.

            * 4.1.1 Filtro.

                * Cambiar el formato de la variable "edad".                
                alter type eda(f2).             
       
                USE ALL.
                COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 & clase2=1).
                VARIABLE LABELS filtro 'Filtro'.
                VALUE LABELS filtro 0 'No valido' 1 'Valido'.
                FORMATS filtro (f1.0).
                FILTER BY filtro.
                EXECUTE.

            * 4.1.2. Ponderación de la muestra.  
                WEIGHT BY fac. 

            * 4.1.3. Tabulación.  
                    CROSSTABS
                      /TABLES=sec BY sub_sect
                      /FORMAT=AVALUE TABLES
                      /CELLS=COUNT
                      /COUNT ROUND CELL.

            * 4.1.4. Quitar los filtros.   
                    FILTER OFF.
                    USE ALL.
                    EXECUTE.
            

*        4.2 Con seguridad social.

            * Para hacer la matriz, se requiere incorporar dos tipos de cirterios:
                * Criterios de la ENOE:
                                *r_def  ---------> Entrevista completa
                                *c_res ---------> Residentes definitivos
                                *eda   ----------> Mayores de 15 años.
                * Criterios de la Matriz:
                                *SEG_SOC   ------> Con seguridad social.

            * 4.2.1 Filtro.  

                USE ALL.
                COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 & SEG_SOC=1).
                VARIABLE LABELS filtro 'Filtro'.
                VALUE LABELS filtro 0 'No valido' 1 'Valido'.
                FORMATS filtro (f1.0).
                FILTER BY filtro.
                EXECUTE.
 
            * 4.2.2. Ponderación de la muestra.  
                WEIGHT BY fac. 

          * 4.2.3. Tabulación.  
                    CROSSTABS
                      /TABLES=sec BY sub_sect
                      /FORMAT=AVALUE TABLES
                      /CELLS=COUNT
                      /COUNT ROUND CELL.

            * 4.2.4. Quitar los filtros.   
                    FILTER OFF.
                    USE ALL.
                    EXECUTE.


* 5.  Matriz masa de horas. 

        * 5.1 Recodificación de variables.

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


        * 5.2 Filtro.

                USE ALL.
                COMPUTE filtro=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15).
                VARIABLE LABELS filtro 'Filtro'.
                VALUE LABELS filtro 0 'No valido' 1 'Valido'.
                FORMATS filtro (f1.0).
                FILTER BY filtro.
                EXECUTE.

        * 5.3 Ponderación.
 
                WEIGHT BY fac. 

        * 5.4 Tablas personalizadas.
                CTABLES
                  /VLABELS VARIABLES=eda5c esc sub_sect ingocup DISPLAY=LABEL
                  /TABLE eda5c > esc BY sub_sect [C] > ingocup [S][SUM]
                  /CATEGORIES VARIABLES=eda5c esc sub_sect ORDER=A KEY=VALUE EMPTY=INCLUDE.


* 6.  Matriz artesanos.

        * 6.1 Recodificación de variables.

                STRING  artesanos (A1).
                COMPUTE artesanos = CHAR.SUBSTR(P3,1,1).
                EXECUTE.
        
                COMPUTE credito=0.
                 IF (p3m1="1") credito=1.

                *Esta variable sirve para hacer las categorías.
                VARIABLE LABELS credito "credito". 
                VALUE LABELS credito
                1 "Sí tiene crédio hipotecario".

                *Esta variable sirve para hacer el conteo.
                *Debe ser numérica y de medida: Escala.
                COMPUTE credito2=0.
                 IF (p3m1="1") credito2=1.
        

        * 6.2 Filtro.
               USE ALL.
                COMPUTE filtro_artesano=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 & artesanos="7").
                VARIABLE LABELS filtro_artesano 'Filtro artesanos'.
                VALUE LABELS filtro_artesano 0 'No seleccionado' 1 'Seleccionado'.
                FORMATS filtro_artesano (f1.0).
                FILTER BY filtro_artesano.
                EXECUTE.


        * 6.3 Ponderación.

                WEIGHT BY fac. 

        * 6.4 Tablas personalizadas.
                CTABLES 
                  /VLABELS VARIABLES=pos_ocu credito sub_sect credito2 DISPLAY=LABEL 
                  /TABLE pos_ocu > credito BY sub_sect > credito2 [SUM] 
                  /CATEGORIES VARIABLES=pos_ocu credito sub_sect ORDER=A KEY=VALUE EMPTY=INCLUDE.
        



