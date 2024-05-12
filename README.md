# Control-de-Seguridad-de-Archivos
Script para verificar la integridad de archivos mediante firmas MD5 y notificar cambios por correo electrónico.

Este script tiene como objetivo realizar un control de seguridad sobre los archivos especificados en el archivo listado_ficheros_a_proteger.txt. Utiliza la firma MD5 para generar hashes de los archivos y compara estos hashes con un archivo de referencia guardado previamente en comprobar_seguridad_ficheros.md5.

Si no se detectan cambios, el script finaliza con un mensaje indicando que todo está correcto. En caso contrario, notifica por correo electrónico los archivos que han sido modificados, junto con la fecha y el usuario de la última modificación.

Es importante ejecutar este script regularmente para asegurarse de la integridad de los archivos críticos del sistema y detectar posibles cambios no autorizados. Se podría configurar crontab para que ejecute el script en intervalos regulares de tiempo.

Por favor, ten en cuenta que este script está diseñado para propósitos educativos y de control interno. Se recomienda su uso en entornos controlados y con permisos adecuados para acceder a los archivos especificados.

Recuerda ajustar las variables file, fichero_hashes, correo_destino y cualquier otra configuración según las necesidades de tu entorno antes de ejecutarlo.
