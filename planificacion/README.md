# Implementación de un algoritmo básico
- Asignatura: Introducción a la Planificación de Robots
- Autor: Víctor Muñoz Sánchez

## Estructura del proyecto
|assets:
|   > archivos externos a la aplicación
|   |maps:
|       > mapas en formato .cvs
|       |map(1-11).csv
|lib:
    > código de la aplicación
    |src:
    |   > código secundario
    |   |algorithms:
    |   |   > código de los algoritmos
    |   |   |bfs.py
    |   |   |dfs.py
    |   |   |greedy_bfs.py
    |   |
    |   |constants.py
    |   |   > constantes del proyecto
    |   |draw.py
    |   |   > funciones para dibujar la interfaz
    |   |entities.py
    |   |   > objetos del proyecto
    |
    |main.py

## Transformación del algoritmo BFS a uno más greedy
El algoritmo programado funciona de la siguiente manera:
1. Siempre que se pueda, se avanzará hacia la meta sin tener en cuenta los obstáculos
2. En el caso de no poder avanzar hacia la meta porque se ha colisionado con un obstáculo, se empleará el algoritmo bfs
3. Cuando algún nodo tenga el camino libre hacia la meta, se dejará de emplear el algoritmo bfs y se avanzará hacia esta
4. El proceso se repite hasta llegar a la meta

En el mejor de los casos se avanza directamente hacia la meta, y en el peor será equivalente al bfs, por lo que el algoritmo es completo.

## Extras a nivel de programación
1. Separación del código en una arquitectura más limpia
2. Simplificación del algoritmo bfs
3. Creada la clase Map
4. Creada la subclase Maps donde se instancian todos los mapas

## Extras de implementación
1. Mediante el uso de la librería pygame se muestran los algoritmos de forma gráfica
2. Se permite introducir el mapa y el algoritmo a través del terminal
3. Se permite repetir el programa al finalizar
4. Se muestra al final de la simulación un resumen del algoritmo
5. Se ha implementado el algoritmo dfs con backtracking, con prioridades up > right > down > left.

## ANEXO 1. bfs vs greedy bfs

Por cada mapa:
Primera fila -> bfs
Segunda fila -> geedy bfs

Mapa        Número de nodos (n)     Número de nodos en el path (np)     n/np      

Mapa 1.     37,                     9,                                  4.11
            26,                     9,                                  2.89
Mapa 2.     75,                     15,                                 5.00
            50,                     15,                                 3.33
Mapa 3.     258,                    48,                                 5.375
            237,                    50,                                 4.74
Mapa 4.     325,                    58,                                 5.60
            304,                    58,                                 5.24
Mapa 5.     430,                    50,                                 8.6
            312,                    50,                                 6.24
Mapa 6.     173,                    25,                                 6.92
            111,                    25,                                 4.44
Mapa 7.     430,                    50,                                 8.6
            321,                    50,                                 6.42
Mapa 8.     180,                    23,                                 7.83
            86,                     23,                                 3.74
Mapa 9.     444,                    34,                                 13.06
            186,                    34,                                 5.47
Mapa 10.    656,                    52,                                 12.62
            345,                    52,                                 6.63
Mapa 11.    501,                    48,                                 10.44
            260,                    48,                                 5.42

En todos los mapas, el algoritmo greedy bfs ha incorporado menos nodos innecesarios y el número de nodos en el path ha sido el mismo, por lo que este ha demostrado ser más eficiente que el algoritmo bfs clásico