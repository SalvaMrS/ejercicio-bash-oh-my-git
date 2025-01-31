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


