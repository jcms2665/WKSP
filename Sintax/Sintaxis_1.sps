* Encoding: UTF-8.

* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*  M a n e j o      d e      b a s e s       d e     d a t o s     c o n       l a     E n c u e s t a     N a c i o n a l     d e    O c u p a c i ó n     y     E m p l e o     ( E N O E ) 
*
* * * * * * * * * * * * * * * *  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


* El objetivo de esta sintaxis es ofrecer un panorama general del SPSS.

*   Índice
*   1. Frecuencias.
*   2. Renombrar variables.
*   3. Formato de las variables.
*   4. Missings.
*   5. Etiquetar variables.
*   6. Etiquetar categorías.
*   7. Tabulados.
*   8. Estadísticos descriptivos.
*   9. Gráficos.
*   10. Filtro
*   11. Recodificar variables.
*   12. Ponderar la muestra.
*   13. Concatenar variables.
*   14. Ordenar los casos



*1. Frecuencias.

        FREQUENCIES VARIABLES=clase2
          /ORDER=ANALYSIS.


*2. Renombrar variables.
        
        RENAME VARIABLES (clase1=PEA_PNEA). 
        
*3. Formato de las variables.
        
        alter type sex(f2).

*4. Missings.
        
        recode p1a1 (SYSMIS = 0).
        
*5. Etiquetar variables.
        
        VARIABLE LABELS eda5c "Edad (5 categorías)". 
        
        
*6. Etiquetar categorías.
        
        VALUE LABELS eda5c
        1 "14 a 24 años"
        2 "25 a 44 años"
        3 "45 a 64 años"
        4 "65 años y más"
        5 "Edad no especificado".
        
        FREQUENCIES VARIABLES=eda5c.
        
*       Ejercicio1: Etiquetar la variable SEX y sus cateogrías
        
        
*7. Tabulados.
        
        CROSSTABS
          /TABLES=sex BY eda5c
          /FORMAT=AVALUE TABLES
          /CELLS=COUNT
          /COUNT ROUND CELL.
        
*        Ejercicio2: Tabular SEX * EDAD5C.
        
        
*8. Estadísticos descriptivos.
        
        DESCRIPTIVES VARIABLES=eda
          /STATISTICS=MEAN STDDEV MIN MAX.
        
        
*9. Gráficos.
        
        GGRAPH
          /GRAPHDATASET NAME="graphdataset" VARIABLES=sex COUNT()[name="COUNT"] MISSING=LISTWISE 
            REPORTMISSING=NO
          /GRAPHSPEC SOURCE=INLINE.
        BEGIN GPL
          SOURCE: s=userSource(id("graphdataset"))
          DATA: sex=col(source(s), name("sex"), unit.category())
          DATA: COUNT=col(source(s), name("COUNT"))
          GUIDE: axis(dim(1), label("sex"))
          GUIDE: axis(dim(2), label("Recuento"))
          SCALE: linear(dim(2), include(0))
          ELEMENT: interval(position(sex*COUNT), shape.interior(shape.square))
        END GPL.
        
*     ¿Cómo se modificaría la sintaxis anterior para obtener la gráfica del rango de edad de 7 categorías (eda7c)?.
      
  
*10. Filtro
        
        * Crear un filtro.
        USE ALL.
        COMPUTE filter_$=(eda >= 15).
        VARIABLE LABELS filter_$ 'eda >= 15 (FILTER)'.
        VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
        FORMATS filter_$ (f1.0).
        FILTER BY filter_$.
        EXECUTE.
        
        * Quitar el filtro.
        FILTER OFF.
        USE ALL.
        EXECUTE.
        
        * Filtro necesario en la ENOE: Entrevista completa, residentes definitivos y mayores de 15 años.
        USE ALL.
        COMPUTE filter_$=(r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15 ).
        VARIABLE LABELS filter_$ 'r_def = "00"  & (c_res = "1"  | c_res = "3" ) & eda >= 15  (FILTER)'.
        VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
        FORMATS filter_$ (f1.0).
        FILTER BY filter_$.
        EXECUTE.
        
        FILTER OFF.
        USE ALL.
        EXECUTE.
        
        
*11. Recodificar variables.
        
        COMPUTE Edad_Trabajar=0.
        IF (eda<15)  Edad_Trabajar=1.
        IF (eda>=15)  Edad_Trabajar=2.
        FREQUENCIES VARIABLES=Edad_Trabajar.
        
        
*12. Ponderar la muestra.
        
        * Establecer la ponderación.
        WEIGHT BY fac.
        
        *Quitar la ponderación.
        WEIGHT OFF.


*13. Concatenar variables.

STRING  k (A8).
COMPUTE k=CONCAT(cd_a, ent, con, v_sel, n_hog, h_mud, n_ren).
EXECUTE.


*14. Ordenar los casos

SORT CASES BY k(A).













