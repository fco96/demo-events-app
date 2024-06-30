## Requisitos para correr esta app

- Docker

## Versiones de ruby

- Ruby versión 3.3
- Rails versión 7.1

## Instrucciones de ejecución

Para levantar el servidor y poder conectarse a la aplicación sigue las siguientes instrucciones

1.- En la raiz del proyecto ejecuta el siguiente comando. Esto debiese levantar el servidor

```
docker-compose up -d
```

2.- Si el paso anterior se ha completado exitosamente al ingresar a `localhost:4040` podrás ver la aplicación

## Intrucciones adicionales

### Ejecución de rubocop

Para ejecutar rubocop y ver que se esten siguiendo las reglas de calidad de código puedes realizar lo siguiente

1.- Ingresa dentro del contenedor con el siguiente comando

```
docker-compose exec app bash
```

2.- Ejecuta el siguiente comando

```
bundle exec rubocop
```

Este debería correr la gema rubocop y entregar cualquier falta que encuentre.

### Ejecución de tests

Para asegurar la covertura de varios escenarios y cuidar el buen funcionamiento de código se añadieron test con la librería rspec, para correrlos y verificar el resultado de estos puedes correr los siguientes comandos

1.- Ingresa dentro del contenedor con el siguiente comando

```
docker-compose exec app bash
```

2.- Ejecuta rspec con siguiente comando

```
bundle exec rspec -fd
```

Este comando debería mostrar la ejecución de todos los tests

## Decisiones de diseño

Para poder modelar los usuarios de la aplicación se crea el modelo `User` y para gestionar el sistema de cuentas y autentificación se utiliza la gema `devise`

Para modelar los eventos se crea el modelo `Event`.

Como funcionalidad adicionales se añade lo siguiente

- Uso de gema rubocop para asegurar la calidad de código
- Creación de tests con gema rspec
- En el listado de eventos se muestran dos secciones de eventos separandolos en eventos y eventos pasados. Ambas secciones tiene ordenes distintos para apoyar de mejor manera a la busqueda de estos.
  - La **sección eventos** está ordenada para mostrar los eventos más proximos, es decir `date_time` ascendente
  - La **sección eventos pasados** está ordenada para mostrar los eventos mas nuevos primero, es decir `date_time` descendente
- Para las hojas de estilos se ocupó sass, por ello se tuvo que instalar la gema `dartsass-sprockets`
- Como librería de componentes y estilos se ocupó bootstrap v5.3. Para dar el feedback con los elementos de esta librería se cargo una función de javascript mediante la librería stimulus (ver `bootstrap_forms_controller.js`)
