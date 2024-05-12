#!/bin/bash
file="listado_ficheros_a_proteger.txt"
fichero_hashes="comprobar_seguridad_ficheros.md5"
correo_destino="example@example.es"
archivos_cambiados="archivos.txt"
archivo_fechas="fechas.txt"

for LINE in $(cat "$file")
do
        if [ -e "$LINE" ]; then
                if [ -d "$LINE" ]; then
                        find $LINE -type f -exec md5sum {} + >> "$fichero_hashes"
                else
                        md5sum $LINE >> "$fichero_hashes"
                fi
        fi
done

if md5sum --status -c "$fichero_hashes"; then
        echo "Es correcto"
else
        md5sum -c "$fichero_hashes" | grep -v 'OK$' | cut -d ':' -f 1 | sort | uniq > cambios.txt
        for archivo in $(cat cambios.txt); do
        # Obtiene la fecha de modificación de cada archivo modificado y la guarda junto con su nombre
                fecha_modificacion=$(stat -c "%y" "$archivo" | cut -d ' ' -f 1,2)
                usuario_modificacion=$(stat -c "%U" "$archivo")
                echo "$archivo --> Fecha de modificación: $fecha_modificacion, Modificado por: $usuario_modificacion" >> "$archivos_cambiados"
        done
        #archivos=$(cut -d ':' -f 1 cambios.txt)
        echo -e "From: example@example.es\nTo: example@example.es\nSubject: ¡Alerta! Cambios en los archivos\n\nATENCIÓN: Han sido detectados cambios en los siguientes archivos:\n$(cat "$archivos_cambiados")" | ssmtp "$correo_destino"
fi
> "$archivos_cambiados"
