![Banner](banner.jpg)  

# Módulo 6 - Desafío 3
# Carlos Santana

Ruby on Rails - postgresql

## Descripción

Esta aplicación realiza, usando el modelo de un blog, publicaciones, comentarios  y likes a los artículos. Adicionalmente, tiene control de acceso (LogIn, LogOut, SignUp y editUser ) para publicar y dar likes; y está libre para comentar (no requiere ser usuario registrado).  
  
OBS:  
   1. La aplicación permite determinadas vistas según el perfil del usuario (sesión iniciada/no iniciada).  
   2. El usuario, al registrarse, puede subir una imagen en su registro.  
   3. Si se desea cambiar los datos del usuario, éste debe hacer click sobre su nombre en la barra de navegación y lo lleva a la vista de modificación.  
   4. Sólo el usuario registrado y con sesión activa puede crear artículos.  
   5. Para reaccionar al artículo dando "me gusta", "no me gusta", "me es indiferente" o "neutral" el usuario debe haber iniciado sesión.  
   6. El artículo permite subir una imagen para ilustrarlo.  
   7. Los artículos se muestran en orden descendiente según la fecha de creación del mismo.  
   8. Cualquier usuario, habiendo o no iniciado sesión, puede hacer comentarios sobre un artículo.  
   9. No se permite editar artículos, ya que las reacciones ("me gusta", "no me gusta", "me es indiferente" o "neutral") son para el artículo original. Por lo tanto, si se cambia su contenido, las reacciones ya no serán -necesariamente- para el articulo editado.  
   10. Se permite eliminar artículos y sus comentarios, pero sólo el dueño del artículo puede hacerlo.  

## Modelo de datos  
  
![Modelo](modelo.jpg)
  
## Inicio
  
Estas instrucciones te ayudarán a obtener una copia del proyecto y a ejecutarlo en tu máquina local para fines de desarrollo y prueba.

### Pre-requisitos
  
Este proyecto fue desarrollado con Ruby versión 3.3.5, Rails - versión 7.2.1.1 y PostgreSQL - versión 16.4

### Instalación
  
Sigue estos pasos para ejecutar el proyecto localmente:
  
1. Clona este repositorio en tu máquina local.  
git clone https://github.com/crsantanag/m6d3.git  
  
2. Navega hasta el directorio del proyecto.  
cd m6d3  
  
3. Instala las dependencias y modifica archivo database.yml  
Las gemas que se deben instalar son:  
   - faker (crea datos ficticios)  
   - pagy  (paginación)   
   - devise (autenticación)
   - figaro (configuración de variables ENV)  
   - activestorage (almacenamiento de imágenes). Instalar: rails active_storage:install  
  
4. Crea la base de datos, realiza la migración y carga los datos de prueba (ejecutar archivo seed.rb)  
    - rails db:create  
    - rails db:migrate  
    - rails db:seed ( seed.rb tiene la creación del usuario user@crazy4cats.cl - revisar antes de ejecutar el comando)  
  
## Ejecutando las pruebas
Levanta el servidor y prueba la aplición.  
root está en /  
  
Este proyecto no cuenta con pruebas automatizadas. Puedes probar manualmente todas las funcionalidades.  
  
## Licencia  
  
Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE.md](LICENSE.md) para obtener más detalles.  
  
⌨ ️Carlos Santana (https://github.com/crsantanag)

