#Características de las camaras
Ancho_Sensor = 10.88
focal = 13
image_weight = 640
image_height = 480
Altura_vuelo = 120
GSD = (Ancho_Sensor*Altura_vuelo*100)/(focal*image_weight)
print(paste0("el GSD es: ",GSD))

Ancho_imagen = GSD*image_weight/100
print(paste0("El ancho de imagen en metros es: ",Ancho_imagen))

Alto_imagen = GSD*image_height/100
print(paste0("El alto de imagen en metros es: ",Alto_imagen))

Solape = 0.8*Alto_imagen
Solape
#La velocidad de la plataforma son 5 m/s
velocidad = 5
trigger = (Alto_imagen - Solape)/velocidad
print(paste0("el trigger es cada X segundos: ",trigger))
trigger
