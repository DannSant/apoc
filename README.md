# apoc
Space shooter developed in Godot 3.0

Guia para usar GitHub

Como clonar el repositorio

- Descargar e instalar Git de https://git-scm.com/
- En el instalador asegurarse de marcar la opción de "Instalar Bash"
- Crear cuenta en Github
- Pasarme su cuenta para que les de acceso al repositorio
- Cuando tenga acceso, abrir Git Bash en su PC, usando comandos de CMD navegar a la carpeta donde van a tener el proyecto
- Ejecutar el comando "git clone https://github.com/DannSant/apoc.git"
- Tardará un poco pues baja todo el proyecto a sus maquinas, pero solo es la primera vez
- Listo, ya tienen e repositorio en sus compus, a darle!

Hacer cambios, y subirlos al repositorio

- Hacer sus cambios en el código, escenas, imagenes, etc.
- Para ver los archivos que han modificado, desde el Git Bash y en su carpeta del proyecto ejecuten git status
- Para agregar a la lista de archivos que se van a subir se ejecuta git add .
- Para hacer un commit (commit es como tomar una fotografia del código tal cual está, es decir un respaldo) se usa el comando git commit -m "mensaje de commit" (entre comillas va un mensaje unico con las caracteristicas de lo que estan subiendo a grandes rasgos)
- La primera vez que suban los cambios se ejecutan estos comandos:
  -  git remote add origin https://github.com/DannSant/apoc.git
  -  git push -u origin master
- A partir de eso, todas las siguentes veces que necesiten subir cambios ejecutan git push, y listo con esto ya suben sus cambios a la nube

Bajar cambios que hagan otros

- Simplemente desde Git Bash en el directorio del proyecto, ejecutar git pull

Recomendaciones:
- Siempre que vayan a mover algun cambio asegurense de hacer un git pull antes para tener la ultima version.
- Intentar coordinarnos para no hacer cambios a los mismos coponentes y que Git no tenga que hacer merges manuales(estos ocurren cuando hay conflictos y se modifican las mismas lineas de una rchivo)
- Siempre tener backups locales por cualquier cosa
