# <img src="https://github.com/user-attachments/assets/95a9ba26-2a2e-439c-a313-a0626108adba" height="50"/> Weather App 


![image](https://github.com/user-attachments/assets/dedb7ce9-1104-4007-b040-9ea481eb9bb4)   ![image](https://github.com/user-attachments/assets/f2c70ad6-6433-472c-a27f-0bc08ddae32e)

Pequeña aplicación del tiempo desarrollada con **Flutter** donde, a partir de un campo de entrada en el que se introduce el nombre de una ciudad, podemos obtener la información meteorológica de ese lugar. Desarrollada como prueba para la empresa **Bondy**.
La **API** que se ha utilizado para obtener la información del tiempo es https://wttr.in/
Esta aplicación esta diseñada para utilizarla **sólo en dispositivos móviles**.

## Contenido de la aplicación

En la carpeta **lib** se pueden encontrar todos los directorios implementados de manera bien **estructurada** y **sencilla** para cualquier persona que no ha desarrollado el proyecto.
Se han desarrollado **test unitarios** para todos los ficheros y un test **e2e** para comprobar el flujo y funcionalidad principal de la aplicación.

## Preparación y ejecución

1. Clonar el contenido de la rama main en su dispositivo local.
2. Ejecutar en la terminal: **flutter pub get**
3. Seleccionar dispositivo (ya sea emulador de android o dispositivo físico conectado al equipo)
4. Ejecutar la aplicación.

## Dispositivos donde se ha probado la aplicación

1. En un emulador de android (Pixel 9 API 35) creado mediante la aplicación de android studio.
2. En un dispositivo físico de android (BQ)
3. En el navegador de Chrome (Para poder probar todo tipo de dispositivos con distintas dimensiones)

## Posibles nuevas funcionalidades a futuro

1. Obtener de una api todas las ciudades del mundo y añadirlas al input para que conforme se vaya escribiendo, sugiera las ciudades.
2. Nuevos widgets como un carrusel donde diga la previsión del tiempo en las proximas horas, y otro para los próximos días
3. Creación de más vistas como por ejemplo, una vista para ver las ciudades que ya hemos buscado y tenerlas almacenadas.

## NOTAS
Se ha utilizado la API de https://wttr.in/, porque es de las pocas que no necesitan un **API KEY**. Se ha tomado esta decisión ya que así se puede lanzar la aplicación mucho más rapido sin tener que realizar registros previos en las páginas de las APIs para poder obtener la KEY y asi acelerar el proceso. En otra casuística, se hubiera utilizado la **API Openweathermap** ya que nos devuelve mucha más información detallada.

Tampoco se ha podido probar la aplicación en **ios** ya que para ello hace falta un MAC.



