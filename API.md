# API

## Registrar usuario

* **POST** localhost:3000/users

**Body**

```
{
	"user":{
		"email": "jorge@jorge.com",
		"password": "123456",
		"password_confirmation": "123456"
	}
}
```

**Respuesta de Creacion**

status code 200

Body 

```
{
  "message": "Signed up sucessfully."
}
```

**Respuesta no Creacion**

status code 200

Body

```
{
  "message": "Something went wrong."
}
```

## Iniciar Sesion

* **POST** localhost:3000/users/sign_in

**Body**

```
{
	"user":{
		"email": "jorge@jorge.com",
		"password": "123456"
	}
}
```

**Respuesta inicio sesion exitosa**

**Body**

```
{
  "message": "You aren´t logged in.",
  "user": {
    "id": 1,
    "email": "jorge@jorge.com",
    "created_at": "2021-09-15T15:15:17.062Z",
    "updated_at": "2021-09-15T15:15:17.062Z"
  }
}
```

**Header**

Parametro **Authorization**


**Respuesta error inicio sesion**

```
{
  "message": "You aren´t logged in.",
  "user": null
}
```

## Recurso movies

* **Url** localhost:3000/api/v1/movies

* Para solicitar cualquier recurso, se debe enviar el parametro **Authorization** en el 
header con el token obtenido al inicio de sesion.

### Obtener todas las movies existentes

* **GET** a la url **http://127.0.0.1:3000/api/v1/movies**

**Respuesta**

Devuelve una lista de todas las movies existentes, con los atributos id, image y title:

```
{
  "movies": [
    {
      "id": 1,
      "image": "url image chuki 1",
      "title": "Chuki 1",
      "created_at": "2021-09-15T15:15:00.690Z"
    },
    {
      "id": 2,
      "image": "url image chuki 2",
      "title": "Chuki 2",
      "created_at": "2021-09-15T15:15:00.709Z"
    }
  ]
}
```

### Obtener la movie con un id especifico

* **GET** a la url **localhost:3000/api/v1/movies?id=1**

**Respuesta**

200 si hay una entidad movie con el parametro id pasado

Body

```
{
  "id": 1,
  "title": "Chuki 1",
  "image": "url image chuki 1",
  "qualification": 3,
  "created_at": "2021-09-15T15:15:00.690Z",
  "characters": [
    {
      "id": 1,
      "name": "Muñeco"
    },
    {
      "id": 2,
      "name": "Niño"
    }
  ]
}
```

404 si no hay ninguna entidad movie con el id pasado en el parametro

Body

```
{
  "message": "no entity with id: 19 found"
}
```

### Obtener una lista de movies con parametros especificos de busqueda

**Parametro**

**name** indicio del nombre de la movie.

**genre** id del genero de pelicula buscado.

**order** ordena las movies en orden 'ASC' o 'DESC'

* **GET** parametro name y order a **http://127.0.0.1:3000/api/v1/movies?name=a&order=desc**

La respuesta es una lista de movies.

En todos los casos, el code status es 200

El body contendra un arreglo de **"movies"**

### Crear una movie

* **Parametros**  a la url **http://127.0.0.1:3000/api/v1/movies**

**image**: url de la imagen, su longitud minima es de 5 caracteres

**title**: titulo de la movie, longitud minima de 3 caracteres

**qualification**: calificacion de la movie, esta en el rando de 1 a 5

**gender_id**: id del genero de la pelicula

* **POST**

```
{
	"image": "url image thoor",
	"title": "Thoor",
	"qualification": 4,
	"gender_id": 2
}
```

**Respuesta** 

Status code 201

body

```
{
  movie: {
    "id": 13,
    "title": "Thoor",
    "image": "url image thoor",
    "qualification": 4
  }
}
```

Status code 422

Esto sucede debido a que las restricciones del modelo no se cumplieron

body

```
{
  "errors": {
    "gender": [
      "must exist"
    ],
    "image": [
      "must have at least 5 characters"
    ],
    "title": [
      "is too short (minimum is 3 characters)"
    ],
    "qualification": [
      "must be less than or equal to 5"
    ]
  }
}
```

### Actualizar una movie

* **Parametros**  a la url **http://127.0.0.1:3000/api/v1/movies**

**id**: id de la movie

**image**: url de la imagen, su longitud minima es de 5 caracteres

**title**: titulo de la movie, longitud minima de 3 caracteres

**qualification**: calificacion de la movie, esta en el rando de 1 a 5

**gender_id**: id del genero de la pelicula

* **PUT/PATCH**

```
{
	"id": 22,
	"title": "cuboo",
  "image": "url image of cubo",
	"qualification": 4,
	"gender_id": 3
}
```

**Respuesta**

Status code 200

```
{
  "movie": {
    "id": 22,
    "title": "cuboo",
    "image": "url image of cubo",
    "qualification": 4,
    "gender_id": 3
  }
}
```

Status code 404

```
{
  "message": "no entity with id: 10000 found"
}
```

Status code 422

Causa: no pasa las validaciones del modelo

```
{
  "errors": {
    "gender": [
      "must exist"
    ],
    "image": [
      "must have at least 5 characters"
    ],
    "title": [
      "is too short (minimum is 3 characters)"
    ],
    "qualification": [
      "must be less than or equal to 5"
    ]
  }
}
```

### Borrar movie 

Se realiza un soft delete en cascada. Se borra una movie y sus personajes

* **Parametros** a la url **http://127.0.0.1:3000/api/v1/movies?id=22**

**id**: id de la movie que se desea borrar 

**DELETE**

Status code 204, se ha realizado el borrado exitoso

Staus code 400, si no hay entidad con el id pasado

body

```
{
  "message": "no entity with id: 13 found"
}
```


## Recurso characters

* **Url** localhost:3000/api/v1/characters

* Para solicitar cualquier recurso, se debe enviar el parametro **Authorization** en el 
header con el token enviado al inicio de sesion.

### Obtener todas los characters existentes

* **GET** a la url **http://127.0.0.1:3000/api/v1/characters**

**Respuesta**

Devuelve una lista de todas los characters existentes, con los atributos id, image y name:

```
{
  "characters": [
    {
      "id": 1,
      "name": "Muñeco",
      "image": "url image muñeco"
    },
    {
      "id": 2,
      "name": "Niño",
      "image": "url image niño"
    }
  ]
}
```

### Obtener charactes con un id especifico

* **GET** a la url **http://127.0.0.1:3000/api/v1/characters?id=6**

**id**: id del character a buscar

**Respuesta**

200 si hay una entidad character con el parametro id pasado

Body

```
{
  "character": {
    "id": 6,
    "name": "Rambo",
    "image": "url image rambo",
    "age": 21,
    "weight": 1.6,
    "history": "alguien llamado rambo",
    "movies": [
      {
        "title": "Rambo 1"
      },
      {
        "title": "Rambo 2"
      }
    ]
  }
}
```

404 no hay ninguna entidad character con el id pasado en el parametro

Body

```
{
  "message": "no entity with id: 19 found"
}
```

### Obtener una lista de characters con parametros especificos de busqueda

**Parametro**

**name**: nombre del character/personaje.

**age**: edad del character/personaje.

**weight**: altura del character/persona.

**movies**: id de la movie en la que se puede encontrar el personaje.

* **GET** a la url **http://127.0.0.1:3000/api/v1/characters?name=&movies=3**

en todos los casos, el code status es 200

el body contendra un arreglo de **"characters"** con los parametros: id, name, age

```
{
  characters: {
    {
      "id": 9,
      "name": "rayo mc quen",
      "image": "url image rayo mc quen"
    },
    {
      "id": 10,
      "name": "mate",
      "image": "url image mate"
    }
  }
}
```

### Crear un character

* **Parametros** 

**image**: url de la imagen, su longitud minima es de 10 caracteres

**name**: nombre del personaje, longitud minima de 3 caracteres

**age**: edad del personaje, entero positivo

**weight**: altura del personaje

**history**: historia del personaje

**movie_id**: id de la movie a la que pertenece el character

* **POST**

```
{
  "name": "Maria",
  "image": "url image maria",
  "age": 22,
  "weight": 1.1,
  "history": "Secretaria de Hudson Horven",
  "movie_id": 8
}
```

**Respuesta** 

Status code 201

body

```
{
  "character": {
    "id": 13,
    "name": "mate",
    "image": "url image mate",
    "age": 21,
    "weight": 1.6,
    "history": "corredor remolcador",
    "movies": [
      {
        "title": "Cars"
      }
    ]
  }
}
```

Status code 422

No cumple con las validaciones del modelo.

body

```
{
  "errors": {
    "movie": [
      "must exist"
    ],
    "image": [
      "must have at least 10 characters"
    ],
    "name": [
      "is too short (minimum is 3 characters)"
    ],
    "age": [
      "must be greater than or equal to 1"
    ],
    "weight": [
      "must be greater than 0.0"
    ],
    "history": [
      "must have at least 10 characters"
    ]
  }
}
```

### Actualizar un character

* **Parametros**  a la url **http://127.0.0.1:3000/api/v1/characters**

**id**: id del character

**image**: url de la imagen, su longitud minima es de 10 caracteres

**name**: nombre del character, longitud minima de 3 caracteres

**age**: Entero positivo

**weight**: Altura del personaje

**hisotry**: Historia del personaje

* **PUT/PATCH**

```
{
	"id": 11,
  "name": "Celin",
  "image": "url image Celin",
  "age": 33,
  "weight": 2.3,
  "history": "Secretaria de hudson horven muy aplicada"
}
```

**Respuesta**

```
{
  "character": {
    "id": 12,
    "name": "norma",
    "image": "url image norma",
    "age": 21,
    "weight": 1.6,
    "history": "corredor remolcador"
  }
}
```

Status code 422

```
{
  "errors": {
    "image": [
      "must have at least 10 characters"
    ],
    "name": [
      "is too short (minimum is 3 characters)"
    ],
    "age": [
      "must be greater than or equal to 1"
    ],
    "weight": [
      "must be greater than 0.0"
    ],
    "history": [
      "must have at least 10 characters"
    ]
  }
}
```

### Borrar character

Se realiza un soft delete de un character

* **Parametros** a la url **http://127.0.0.1:3000/api/v1/characters**

**id**: id del character que se desea borrar

**DELETE**

Status code 204, se ha realizado el borrado exitoso

Staus code 400, si no hay entidad con el id pasado

body

```
{
  "message": "no entity with id: 13 found"
}
```


## Recurso genders

* **Url** localhost:3000/api/v1/genders

* Para solicitar cualquier recurso, se debe enviar el parametro **Authorization** en el 
header con el token enviado al inicio de sesion.

### Obtener todas los genders existentes

* **GET** a la url **http://127.0.0.1:3000/api/v1/genders**

**Respuesta**

Devuelve una lista de todas los genders existentes, con los atributos id, image y name:

```
{
  "genders": [
    {
      "id": 1,
      "name": "romantico",
      "image": "url image romantico"
    },
    {
      "id": 2,
      "name": "accion",
      "image": "url image accion"
    }
  ]
}
```

### Obtener genders con un id especifico

* **GET** a la url **http://127.0.0.1:3000/api/v1/genders?id=6**

**id**: id del gender a buscar

**Respuesta**

200 si hay una entidad gender con el parametro id pasado

Body

```
{
  "gender": {
    "id": 1,
    "name": "romantico",
    "image": "url image romantico"
  }
}
```

404 no hay ninguna entidad gender con el id pasado en el parametro

Body

```
{
  "message": "no entity with id: 19 found"
}
```

### Obtener una lista de gender con un nombre

**Parametro**

**name**: nombre del gender.

* **GET** a la url **http://127.0.0.1:3000/api/v1/characters?name=acc**

en todos los casos, el code status es 200

el body contendra un arreglo de **"gender"** con los parametros: id, name, image

```
{
  "gender": [
    {
      "id": 2,
      "name": "accion",
      "image": "url image accion"
    }
  ]
}
```

### Crear un gender

* **Parametros** 

**image**: url de la image, su longitud minima es de 10 caracteres

**name**: nombre del gender, longitud minima de 3 caracteres

* **POST** a la url **http://127.0.0.1:3000/api/v1/genders**

```
{
	"name": "drama",
	"image": "url image velico"
}
```

**Respuesta** 

Status code 200

body

```
{
  "gender": {
    "id": 8,
    "name": "drama",
    "image": "url image velico"
  }
}
```

Status code 422

No cumple con las validaciones del modelo.

body

```
{
  "error": {
    "name": [
      "is too short (minimum is 3 characters)"
    ],
    "image": [
      "must have at least 10 characters"
    ]
  }
}
```

### Actualizar un gender

* **Parametros**  a la url **http://127.0.0.1:3000/api/v1/gender**

**id**: id del character

**image**: url de la imagen, su longitud minima es de 10 caracteres

**name**: nombre del gender, longitud minima de 3 caracteres

* **PUT/PATCH**

```
{
	"id": 8,
  "name": "dramatico",
  "image": "url image velico"
}
```

**Respuesta**

```
{
  "gender": {
    "id": 8,
    "name": "dramatico",
    "image": "url image velico"
  }
}
```

Status code 422

```
{
  "error": {
    "name": [
      "is too short (minimum is 3 characters)"
    ],
    "image": [
      "must have at least 10 characters"
    ]
  }
}
```

### Borrar gender

Se realiza un soft delete de un character

* **Parametros** a la url **http://127.0.0.1:3000/api/v1/gender?id=13**

**id**: id del character que se desea borrar

**DELETE**

Status code 204, se ha realizado el borrado exitoso

Staus code 400, si no hay entidad con el id pasado

body

```
{
  "message": "no entity with id: 13 found"
}
```
