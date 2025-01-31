# Usamos una versión específica de Debian para evitar cambios inesperados
FROM debian:12.9-slim

# Instalamos las dependencias necesarias
RUN apt-get update && \
    apt-get install -y git nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clonamos el repositorio de Oh My Git en la raíz del contenedor (solo último commit)
RUN git clone --depth 1 https://github.com/git-learning-game/oh-my-git.git /oh-my-git

# Establecemos el directorio de trabajo en la carpeta de niveles
WORKDIR /oh-my-git/

# Comando por defecto al ejecutar el contenedor
CMD ["bash"]
