Fernando Pérez Porras

# Capitulo22_UAS_en_incendios_forestales

## 1. Calcular en R los parámetros del vuelo

Se calculan los parámetros de vuelo para fotogrametría. Con este código se calcula el tamaño de píxel, el tamaño de la imagen sobre el terreno y la distancia entre imágenes para la cual hay que capturar imágenes para disponer de un solape del 80% longitudinal. Todos los datos de la cámara están en mm y las distancias o alturas en metros.

```r
#Características de las camaras
Ancho_Sensor = 10.88
focal = 13
image_weight = 640
image_height = 480
Altura_vuelo = 120
GSD = (Ancho_Sensor*Altura_vuelo*100)/(focal*image_weight)
print(paste0("el GSD es: ",GSD))
```

```r annotate
[1] "el GSD es: 15.6923076923077
```

```r
Ancho_imagen = GSD*image_weight/100
print(paste0("El ancho de imagen en metros es: ",Ancho_imagen))
```

```r annotate
[1] "El ancho de imagen en metros es: 100.430769230769"
```

```r
Alto_imagen = GSD*image_height/100
print(paste0("El alto de imagen en metros es: ",Alto_imagen)))
```

```r annotate
[1] "El alto de imagen en metros es: 75.3230769230769"
```

```r
Solape = 0.8*Alto_imagen
Solape
```

```r annotate
[1] 60.25846
```

```r
#La velocidad de la plataforma son 5 m/s
velocidad = 5
trigger = (Alto_imagen - Solape)/velocidad
print(paste0("el trigger es cada X segundos: ",trigger))
```

```r annotate
[1] "el trigger es cada X segundos: 3.01292307692308"
```

Pregunta: ¿Si la camara puede capturar 1 frame cada dos segundos, es posible con este solape y esta velocidad, generar ese trigger o velocidad de disparo de la cámara?

Genere usted el código para analizar la anchura entre pasadas para un solape del 40%

## 2. Diseño del plan de vuelo con un planificador de misión de código abierto

Una vez calculados los parámetros de vuelo según el tipo de misión explicada en este capítulo, se procederá al diseño de la misión de captura de datos propiamente dicho. El primer objetivo de esta tarea será descargar e instalar Mission Planner, el cual se puede descargar de la web de Mission Planner de Ardupilot. (https://ardupilot.org/planner/docs/mission-planner-installation.html).

El segundo objetivo será leer la documentación de cómo diseñar un plan de vuelo con dicha herramienta. Como resumen y/o guía rápida hay que seguir los siguientes pasos para el diseño de un plan de vuelo con la herramienta de diseño de misión de un autopiloto y son las siguientes:
 •	Definir la zona de vuelo con un polígono
 •	Definir el tipo de cámara
 •	Definir el tipo de vuelo
 •	Generar el plan de vuelo con waypoints y tareas en los mismos
 •	Exportar el plan de vuelo

 ### Demostración de cómo realizar un plan de vuelo de fotogrametría
 
