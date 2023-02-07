# MovieApp

MovieApp es una aplicación de las películas que se encuentran en cartelera.

![MovieApp](https://user-images.githubusercontent.com/107710738/217328634-16d4abb2-8aa3-483c-b4e7-e068da386873.png)

## Descripción de la App

* Para la construcción de la app se utilizó clean architecture y MVVM.
* Se empieza por la creación de una pantalla de Splash, donde se solicitaron los permisos de localización de la aplicación para recomendar las películas más vistas en el país (función que no se implementa, pero fue la idea que se tuvo para la solicitud de dicho permiso).
* Una vez finalizado el splash se dirige a la pantalla principal.
* En la pantalla principal se implementa el manejo de conexión a internet, donde si no se cuenta con este se muestra una pantalla informando que no se tiene conexión a la misma y un botón para recargar los datos por si ya cuenta con conexión a internet.
* Si el usuario cuenta con internet la aplicación mostrará una pantalla con un listado de películas ordenadas por fecha de lanzamiento y un buscador para filtrar las películas por su titulo.
* Al pinchar sobre una pelicula se mostrará el detalle de la película, junto con los actores, su poster y el raiting de la misma.
