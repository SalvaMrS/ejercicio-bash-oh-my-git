# Ejercicio de Bash Script con Oh My Git

Este repositorio contiene un entorno Docker preparado para realizar ejercicios de Bash Script utilizando el juego educativo [Oh My Git](https://github.com/git-learning-game/oh-my-git).

---

## 🐋 Comandos básicos para usar el contenedor

### 1. Construir la imagen Docker
Para crear la imagen a partir del Dockerfile, ejecuta el siguiente comando en la terminal:

```bash
docker build -t oh-my-git-exercise .
```

- **Explicación**:
  - `docker build`: Construye una imagen Docker.
  - `-t oh-my-git-exercise`: Asigna un nombre a la imagen.
  - `.`: Especifica la ruta al directorio que contiene el Dockerfile (directorio actual).

---

### 2. Ejecutar el contenedor
Una vez construida la imagen, puedes ejecutar el contenedor con:

```bash
docker run -it oh-my-git-exercise
```

- **Explicación**:
  - `docker run`: Ejecuta un contenedor.
  - `-it`: Modo interactivo con terminal.
  - `oh-my-git-exercise`: Nombre de la imagen a usar.

- **Dentro del contenedor**:
  - Estarás en el directorio `/oh-my-git/levels`, listo para trabajar en los ejercicios.

---

### 3. Detener y eliminar el contenedor
Si deseas eliminar el contenedor después de usarlo, sigue estos pasos:

1. Obtén el ID o nombre del contenedor:
   ```bash
   docker ps -a
   ```

2. Detén y elimina el contenedor:
   ```bash
   docker rm <nombre_o_id_del_contenedor>
   ```

---

### 4. Eliminar la imagen Docker
Si ya no necesitas la imagen, puedes eliminarla con:

```bash
docker rmi oh-my-git-exercise
```

---

## 🛠️ Estructura del contenedor
- **Directorio raíz del repositorio**: `/oh-my-git`
- **Directorio de trabajo**: `/oh-my-git/levels`
- **Herramientas instaladas**: `git`, `nano`

---

## 📝 Notas
- Asegúrate de tener Docker instalado y en ejecución antes de usar estos comandos.
- Si encuentras algún problema, revisa la documentación oficial de Docker o abre un issue en este repositorio.

---

## 📂 Ejecución de los Scripts

### Ejercicio 1: Generar el archivo `secciones`

El script `Ejercicio_1.sh` resuelve la primera consigna. Para ejecutarlo, sigue estos pasos:

1. **Ubícate en el directorio correcto**:
   Asegúrate de estar en el directorio raíz del repositorio (`/oh-my-git`), donde se encuentra el script.

2. **Ejecuta el script**:
   ```bash
   ./Ejercicio_1.sh
   ```

   Si deseas ver los resultados intermedios y pausar la ejecución entre cada paso, usa la opción `-d`:
   ```bash
   ./Ejercicio_1.sh -d
   ```

3. **Resultado**:
   - El script generará un archivo llamado `secciones` en el directorio actual.
   - Este archivo contiene todas las secciones únicas encontradas en los archivos de configuración de los niveles.

---

### Ejercicio 2: Generar el archivo `chequeos`

El script `Ejercicio_2.sh` resuelve la segunda consigna. Para ejecutarlo:

1. **Ubícate en el directorio correcto**:
   Asegúrate de estar en el directorio raíz del repositorio (`/oh-my-git`), donde se encuentra el script.

2. **Ejecuta el script**:
   ```bash
   ./Ejercicio_2.sh
   ```

   Si deseas ver los resultados intermedios y pausar la ejecución entre cada paso, usa la opción `-d`:
   ```bash
   ./Ejercicio_2.sh -d
   ```

3. **Resultado**:
   - El script generará un archivo llamado `chequeos` en el directorio actual.
   - Este archivo contiene los textos presentes en la sección `[win]` de todos los niveles.

---

## 🛠️ Explicación del comando clave

El siguiente comando es utilizado en el Ejercicio 1 para buscar, procesar y guardar las secciones únicas:

```bash
grep -h '^\[[a-z ]*\]$' levels/*/* | sed 's/[][]//g' | sort -u > secciones
```

### Explicación detallada:

1. **`grep -h '^\[[a-z ]*\]$' levels/*/*`**:
   - **`grep`**: Busca patrones en archivos.
   - **`-h`**: Suprime la impresión del nombre del archivo en la salida.
   - **`'^\[[a-z ]*\]$'`**: Expresión regular que busca líneas que contienen solo letras minúsculas y espacios entre corchetes (`[ ]`).
     - `^`: Inicio de la línea.
     - `\[`: Corchete de apertura `[` (escapado).
     - `[a-z ]*`: Cero o más letras minúsculas (`a-z`) o espacios.
     - `\]`: Corchete de cierre `]` (escapado).
     - `$`: Fin de la línea.
   - **`levels/*/*`**: Busca en todos los archivos dentro de los subdirectorios de `levels`.

2. **`sed 's/[][]//g'`**:
   - **`sed`**: Editor de flujo para transformar texto.
   - **`'s/[][]//g'`**: Expresión regular que elimina todos los corchetes (`[` y `]`).
     - `s/`: Indica una sustitución.
     - `[][]`: Coincide con `[` o `]`.
     - `//`: Reemplaza lo coincidente con nada (elimina los corchetes).
     - `g`: Aplica la sustitución globalmente (en toda la línea).

3. **`sort -u`**:
   - **`sort`**: Ordena líneas de texto.
   - **`-u`**: Elimina duplicados después de ordenar.

4. **`> secciones`**:
   - Redirige la salida del comando anterior a un archivo llamado `secciones`.
   - Si el archivo ya existe, se sobrescribe. Si no existe, se crea.

---
## 📌 Notas adicionales

- **Permisos**: Los scripts ya tienen los permisos necesarios para ejecutarse, por lo que no es necesario usar `chmod`.
- **Ubicación**: Asegúrate de ejecutar los scripts desde el directorio raíz del repositorio (`/oh-my-git`).
- **Modo debug**: Usa la opción `-d` para ver resultados intermedios y pausar la ejecución.

