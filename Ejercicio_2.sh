#!/bin/bash

# Función para extraer una sección de un archivo
extraer_seccion() {
    ARCHIVO="$1"
    SECCION="$2"
    # Usa sed para extraer líneas entre la sección deseada y la siguiente
    sed -n "/^\[${SECCION}.*\]/,/^\[.*\]$/ { /^\[${SECCION}.*\]/! { /^\[.*\]$/! p } }" "$ARCHIVO"
}

# Variable para controlar el modo de depuración
DEBUG_MODE=false

# Verificar si se pasó el flag -d
if [[ "$1" == "-d" ]]; then
    DEBUG_MODE=true
fi

# Vaciar el archivo de salida si existe
> chequeos

# Obtener todos los archivos en los directorios de niveles
archivos=$(ls ./levels/*/*)

# Recorrer cada archivo
for archivo in $archivos; do
    # Mostrar mensaje de depuración si DEBUG_MODE es true
    if $DEBUG_MODE; then
        echo "Procesando archivo: $archivo"
    fi

    # Verificar si el archivo contiene la sección [win]
    if grep -q '^\[win' "$archivo"; then
        # Agregar el nombre del archivo como un comentario
        echo "##### Chequeo del archivo: $archivo #####" >> chequeos
        # Extraer la sección [win] y agregarla al archivo chequeos
        extraer_seccion "$archivo" "win" >> chequeos
        # Agregar una línea en blanco para separar los chequeos
        echo "" >> chequeos
    fi
done

echo "Proceso completado. Los chequeos se han guardado en el archivo 'chequeos'."
