// 1

db.runCommand({
    collMod: "users",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["name", "email", "password"],
            properties: {
                "name": {
                    bsonType: "string",
                    maxLength: 30,
                },
                "email": {
                    bsonType: "string",
                    pattern: "^(.*)@(.*)\\.(.{2,4})$",
                },
                "password": {
                    bsonType: "string",
                    minLength: 50,
                }
            }
        }
    }
})

// Ejemplos No Validos

db.users.insertOne({
    email: "manuel.nieto@mi.unc.edu.ar", password: "F3gKbSk8f413aAypb6DXc4gFIHeRuInpcNErIhQkanLUaeZFQN"
})

db.users.insertOne({
    name: "Manuel Nieto", password: "F3gKbSk8f413aAypb6DXc4gFIHeRuInpcNErIhQkanLUaeZFQN"
})

db.users.insertOne({
    name: "Manuel Nieto", email: "manuel.nieto@mi.unc.edu.ar"
})

db.users.insertOne({
    name: "Manuel Nieto", email: "manuel.nieto@mi.unc.edu.ar", password: "short_password"
})

db.users.insertOne({
    name: "Manuel Nieto", email: "b@d_mail@gmailcom", password: "F3gKbSk8f413aAypb6DXc4gFIHeRuInpcNErIhQkanLUaeZFQN"
})

db.users.insertOne({
    name: "Un nombre super mega ultra duper larguisimo", email: "manuel.nieto@mi.unc.edu.ar", password: "F3gKbSk8f413aAypb6DXc4gFIHeRuInpcNErIhQkanLUaeZFQN"
})

// Ejemplos Validos

db.users.insertMany([
    { name: "Manuel Nieto", email: "manuel.nieto@mi.unc.edu.ar", password: "F3gKbSk8f413aAypb6DXc4gFIHeRuInpcNErIhQkanLUaeZFQN" },
    { name: "Ignacio Facello", email: "ignacio.facello@mi.unc.edu.ar", password: "05vBdOXNfkqGpTv6v6hAJwyQk2LFfgVpLCW7aaIvxeKeSH9y6n" },
    { name: "Ignacio Ramirez", email: "ignacio.ramirez@mi.unc.edu.ar", password: "RPmSLx4i0WsHBPcMP5I2RKxWFuKEwbLZvboPFQVhDmPwmgrrMR" },
    { name: "Lucas Chesta", email: "lucas.chesta@mi.unc.edu.ar", password: "Z7IqzBuyWcjmPI2ScWOSQ1SwogGvTwv1s6HD4X8tqCUzeGOjLu" },
    { name: "Tomas Hubmann", email: "tomas.hubmann@mi.unc.edu.ar", password: "Gmu83Lv0bnL55qwzbah1DyyMfkqcMe4WkQIpOEIQSvLqh7TFRY" }
])

// 2

db.getCollectionInfos({
    "name": "users"
})

// 3

db.runCommand({
    collMod: "theaters",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["theaterId", "location"],
            properties: {
                "theaterId": {
                    bsonType: "int",
                },
                "location": {
                    bsonType: "object",
                    required: ["address"],
                    properties: {
                        "address": {
                            bsonType: "object",
                            required: ["street1", "city", "state", "zipcode"],
                            properties: {
                                "street1": {
                                    bsonType: "string"
                                },
                                "city": {
                                    bsonType: "string"
                                },
                                "state": {
                                    bsonType: "string"
                                },
                                "zipcode": {
                                    bsonType: "string"
                                }
                            }
                        },
                        "geo": {
                            bsonType: "object",
                            properties: {
                                "type": {
                                    enum: ["Point", null] // No sirve lo de null
                                },
                                "coordinates": {
                                    bsonType: "array",
                                    items: {
                                        bsonType: "double"
                                    },
                                    minItems: 2,
                                    maxItems: 2
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    validationAction: "warn"
})

// Ejemplos No Validos

db.theaters.insertOne(
    { theaterId: 123456789 }
)

db.theaters.insertOne(
    {
        theaterId: 123456789, location: {
            geo: {
                type: "Point",
                coordinates: [-96.608055, 33.685692]
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 123456789, location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
            },
            geo: {
                type: "Point",
                coordinates: [-96.608055, 33.685692]
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 123456789, location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
                zipcode: "7008"
            },
            geo: {
                type: "Cordenada",
                coordinates: [-96.608055, 33.685692]
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 123456789, location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
                zipcode: "7008"
            },
            geo: {
                type: "Point",
                coordinates: [-96.608055, 33.685692, -79.67678]
            }
        }
    }
)

db.theaters.insertOne(
    {
        location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
                zipcode: "7008"
            },
            geo: {
                type: "Point",
                coordinates: [-96.608055, 33.685692]
            }
        }
    }
)

db.adminCommand({
    getLog: "global"
})

// Ejemplos Valido (no pude hacer uno en donde type: null)

db.theaters.insertOne(
    {
        theaterId: 123456789, location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
                zipcode: "7008"
            },
            geo: {
                type: "Point",
                coordinates: [-96.608055, 33.685692]
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 5656566, location: {
            address: {
                street1: "Los Dormiles 7456",
                city: "Buenos Aires",
                state: "BS",
                zipcode: "6847"
            },
            geo: {
                type: "Point",
                coordinates: [-6.608055, 43.68692]
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 124579, location: {
            address: {
                street1: "Los Granaderos 7456",
                city: "Cordoba",
                state: "CBA",
                zipcode: "78"
            }
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 987654321, location: {
            address: {
                street1: "Los Molinos 4567",
                city: "Cordoba",
                state: "CBA",
                zipcode: "6067"
            },
        }
    }
)

db.theaters.insertOne(
    {
        theaterId: 1212121212, location: {
            address: {
                street1: "Av Famaf 1026",
                city: "Cordoba",
                state: "CBA",
                zipcode: "532"
            },
        }
    }
)

// 4

db.runCommand({
    collMod: "movies",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["title", "year"],
            properties: {
                "title": {
                    bsonType: "string"
                },
                "year": {
                    bsonType: "int",
                    minimum: 1900,
                    maximum: 3000
                },
                "cast": {
                    bsonType: "array",
                    items: {
                        bsonType: "string"
                    },
                    uniqueItems: true
                },
                "directors": {
                    bsonType: "array",
                    items: {
                        bsonType: "string"
                    },
                    uniqueItems: true
                },
                "countries": {
                    bsonType: "array",
                    items: {
                        bsonType: "string"
                    },
                    uniqueItems: true
                },
                "genres": {
                    bsonType: "array",
                    items: {
                        bsonType: "string"
                    },
                    uniqueItems: true
                }
            }
        }
    }
})

// Ejemplos No Validos

db.movies.insertOne(
    { title: "George I" }
)

db.movies.insertOne(
    { year: NumberInt(2000) }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(3001) }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(1899) }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(2000), directors: ["Ignacio Ramirez", "Ignacio Ramirez"] }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(2000), cast: ["Ignacio Facello", "Ignacio Facello"] }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(2000), countries: ["Argentina", "Argentina"] }
)

db.movies.insertOne(
    { title: "George I", year: NumberInt(2000), genres: ["Action", "Action"] }
)

// Ejemplos Validos

db.movies.insertOne(
    { title: "George I", year: NumberInt(2000) }
)

db.movies.insertOne(
    { title: "George II", year: NumberInt(2002), directors: ["Ignacio Ramirez"] }
)

db.movies.insertOne(
    { title: "George III", year: NumberInt(2003), cast: ["Ignacio Facello"] }
)

db.movies.insertOne(
    { title: "George IV", year: NumberInt(2005), countries: ["Argentina"] }
)

db.movies.insertOne(
    { title: "George V", year: NumberInt(2006), genres: ["Action"] }
)

db.movies.insertOne(
    {
        title: "George: The Vengeance", year: NumberInt(2010),
        directors: ["Ignacio Ramirez"], cast: ["Ignacio Facello"],
        countries: ["Argentina"], genres: ["Action"]
    }
)

// 5

db.createCollection("userProfiles", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["user_id", "language"],
            properties: {
                "user_id": {
                    bsonType: "objectId"
                },
                "language": {
                    enum: ["English", "Spanish", "Portuguese"]
                },
                "favorite_genres": {
                    bsonType: "array",
                    items: {
                        bsonType: "string"
                    },
                    uniqueItems: true
                }
            }
        }
    }
})

// Ejemplos No Validos

db.userProfiles.insertOne({
    user_id: ObjectId('59a47286cfa9a2a73e51e73f')
})

db.userProfiles.insertOne({
    language: "Spanish"
})

db.userProfiles.insertOne({
    user_id: ObjectId('59a47286cfa9a2a73e51e73f'), language: "Chinese"
})

db.userProfiles.insertOne({
    user_id: ObjectId('59a47286cfa9a2a73e51e73f'), language: "Spanish", favorite_genres: ["Action", "Action"]
})

db.userProfiles.insertOne({
    user_id: ObjectId('59a47286cfa9a2a73e51e73f'), language: "Spanish", favorite_genres: ["Action", 123]
})

// Ejemplos Validos

db.userProfiles.insertOne({
    user_id: ObjectId('59a47286cfa9a2a73e51e73f'), language: "English"
})

db.userProfiles.insertOne({
    user_id: ObjectId('69a47286cfa9a2a73e51e73f'), language: "Spanish"
})

db.userProfiles.insertOne({
    user_id: ObjectId('58a47286cfa9a2a73e51e73f'), language: "Portuguese"
})

db.userProfiles.insertOne({
    user_id: ObjectId('59b47286cfa9a2a73e51e73f'), language: "English", favorite_genres: ["Action"]
})

db.userProfiles.insertOne({
    user_id: ObjectId('59a57286cfa9a2a73e51e73f'), language: "English", favorite_genres: ["Action", "Drama"]
})

// 6

/*

    La colección "comments" tiene dos relaciones One-to-Many con otras dos colecciones. En ambos casos
    un documento de "comments" esta asociado a lo sumo con otro documento de la otra colección, es decir, 
    es el Many de la relación. Veamos que método se uso para aplicar cada relación:
        - El atributo "movie_id" representa una relación One-to-Many con la colección "movies", utilizando
        modelado con Referencias de Documento,
        - Los atributos "name" y "email" representan una relación One-to-Many con la colección "users",
        utilizando modelado con Referencias de Documento.

    La colección "movies" tiene multiples relaciones, veamos cada una en más detalle:
        - El atributo "movie_id" representa la parte One de la relación One-to-Many con la colección comments
        - Los atributos "cast", "directors", "writers", "countries", "genres" y "languages" son relaciones 
        One-to-Many/Many-to-Many modeladas con Documentos Anidados. (Asumo esto último pues los valores que 
        se encuentran en estos atributos no son referencias a ningún documento de otra colección)

*/

// Aclaraciones Ejercicio 7 y 8: Solo doy que tipo de modelado conviene y las queries,
// las colecciones/validaciones e insersiones no las hago por falta de tiempo.

// 7

/*

    Para lograr eficiencia en las queries es recomendable modelar las relaciones de la 
    base de datos de la siguiente forma:
        - En la colección "books", el atributo "category_id" deberia ser reemplazado por un 
        array de VARCHAR(70) llamado "categories" con las categorias del documento. Usamos modelado
        con Documentos Anidados para modelar una relación Many-to-Many entre "books" y "categories"
        (tecnicamente en el grafico es una relación One-to-Many en donde "books" es el Many,
        es decir, que puede asociarse a lo sumo con una sola categoria, pero en la Querie I dice que hay multiples
        categorias para un libro) 
        - En la colección "orders_details", el atributo "order_id" deberia ser reemplazado por un objeto
        llamado "order" que contengan los atributos "order_id", "delivery_name" y "delivery_address" de la
        colección "orders" (puede tener todos los atributos si se desea, pero lo veo excesivo). Usamos un
        hibrido de modelo con Documentos Anidados y Referencias a Documentos para modelar una relación 
        One-to-Many entre "orders" y "order_details" sin llenar de tanta información a la colección
        "order_details"
        - Por último, utilizamos modelado con Documentos Anidados para la relación One-to-Many entre 
        "books" y "order_details" en el lado Many, es decir, colocamos todos los atributos de "books"
        en la colección de "order_details"

*/

// 7.1

db.books.find(
    { "author": "Jane Doe" },
    { "_id": 0, "book_id": 1, "title": 1, "price": 1, "categories": 0 }
)

// 7.2

db.books.aggregate([
    {
        $unwind: "$categories"
    },
    {
        $group: {
            _id: "categories",
            total_books: { $sum: 1 }
        }
    }
])

// 7.3

db.order_details.aggregate([
    {
        $match: {
            "order.order_id": 123456789
        }
    },
    {
        $project: {
            "delivery_name": "$order.delivery_name",
            "delivery_address": "$order.delivery_address",
            "total_amount": { $multiply: ["$quantity", "$price"] }
        }
    }
])

// 8

// A (Skipeado pues mata al proposito de Modelado de Datos, que es usar las queries más
// importantes para realizar el modelado de las relaciones)

// B

/*

    Para lograr eficiencia en las queries es recomendable modelar las relaciones de la 
    base de datos de la siguiente forma:
        - En la colección "Articles", agregar un atributo array de string llamado 
        "categories". Utilizamos modelado con Documentos Anidados para modelar una relación
        Many-to-Many entre "Articles" y "Categories"
        - Hacemos lo mismo de antes, pero con un array de string llamado "tags" para la relación
        Many-to-Many entre "Articles" y "Tags"
        - Hacemos lo mismo de antes, pero con un array de objetos llamado "comments" con los
        mismo campos que la colección "Comments" para modelar una relación One-to-Many entre
        "Articles" y "Comments"
        - Dado que no cambia la eficiencia de las queries, usamos modelado de Referencia de Documentos
        para la relación One-to-Many entre "Users" y "Comments". (El arreglo "comments" de "Articles"
        va a tener una referencia a "Users")
        - Idem con la relación One-to-Many entre "Users" y "Articles".

*/

// 8.1

db.Articles.find(
    { "user_id": ObjectId('59a47286cfa9a2a73e51e73f') },
    { "_id": 0, "title": 1, "url": 1, "tags": 1, "categories": 1 }
)

// 8.2
db.Articles.aggregate([
    {
        $unwind: "$comments"
    },
    {
        $match: {
            $and: [{ "comments.date": { $gte: ISODate('1950-01-01T00:00:00.000Z') } },
            { "comments.date": { $lt: ISODate('1980-01-01T00:00:00.000Z') } }]
        }
    },
    {
        $project: {
            "_id": 0, "title": 1, "url": 1, "comments": 1
        }
    }
])

// 8.3
db.Users.find(
    { "_id": ObjectId('59a47286cfa9a2a73e51e73f') },
    { "_id": 0, "name": 1, "email": 1 }
)