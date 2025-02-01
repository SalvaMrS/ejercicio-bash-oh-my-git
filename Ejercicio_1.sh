#!/bin/bash

# Configuración
LEVELS_DIR="levels"
OUTPUT_FILE="secciones"
DEBUG_MODE=false

# Función 1: Buscar todas las líneas con secciones
buscar_secciones() {
    grep -h '^\[.*\]$' "$LEVELS_DIR"/*/* 2>/dev/null
}

# Función 2: Eliminar corchetes
eliminar_corchetes() {
    sed 's/[][]//g'
}

# Función 3: Eliminar duplicados
eliminar_duplicados() {
    sort -u
}

# Mostrar resultados intermedios con pausa
mostrar_resultados() {
    local input="$1"
    local mensaje="$2"
    if $DEBUG_MODE; then
        echo -e "\n$mensaje"
        echo
        echo "$input" | head -n 10
        echo
        echo -n "\nPresione cualquier tecla para continuar..."
        read -n 1 -s -r  # Espera una tecla
        echo
    fi
}

# Función principal
main() {
    # Verificar si se activa el modo debug
    if [[ "$1" == "-d" ]]; then
        DEBUG_MODE=true
    fi

    # Paso 1: Buscar secciones
    secciones_raw=$(buscar_secciones)
    mostrar_resultados "$secciones_raw" "Resultados de buscar secciones (primeras 10):"

    # Paso 2: Eliminar corchetes
    secciones_sin_corchetes=$(echo "$secciones_raw" | eliminar_corchetes)
    mostrar_resultados "$secciones_sin_corchetes" "Resultados después de eliminar corchetes (primeras 10):"

    # Paso 3: Eliminar duplicados
    secciones_unicas=$(echo "$secciones_sin_corchetes" | eliminar_duplicados)
    mostrar_resultados "$secciones_unicas" "Resultados después de eliminar duplicados (primeras 10):"

    # Generar archivo final
    echo "$secciones_unicas" > "$OUTPUT_FILE"
    echo -e "\nArchivo generado: $OUTPUT_FILE"
}

main "$@"
