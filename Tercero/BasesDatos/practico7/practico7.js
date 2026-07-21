// 1

db.users.insertMany([
    {
        "name": "Perry Rogers",
        "email": "perry_rogers@gmail.com",
        "password": "xC3qh0UNSsQA3JWX4up4bqJ02yHwbihytSNdVA"
    },
    {
        "name": "Luca Piorini",
        "email": "lucapio@hotmail.com",
        "password": "faq4VlWsfDOxskCsDKWBN26j85yOV"
    },
    {
        "name": "Lucia Esport",
        "email": "lucia_133@gmail.com",
        "password": "0Gk3O1UghgcLCMqT0C8aY4n7WUX5U8"
    },
    {
        "name": "Mia Winters",
        "email": "mia_evil@resident.com",
        "password": "h3g9lj7C5xL0TLX3wnBGJiFt05qwCR"
    },
    {
        "name": "Johnny Bravo",
        "email": "johnny69@hothotmail.com",
        "password": "sUdDLNvQ0S6x73zP92K0Ep4fGge1wF"
    }
])

// Falto el atributo date "date": {"$date": new Date()}
db.comments.insertMany([
    {
        "name": "Perry Rogers",
        "email": "perry_rogers@gmail.com",
        "movie_id": ObjectId('573a1390f29313caabcd4217'),
        "text": "My daughter really enjoyed the movie"
    },
    {
        "name": "Luca Piorini",
        "email": "lucapio@hotmail.com",
        "movie_id": ObjectId('573a1390f29313caabcd434b'),
        "text": "I fell asleep while watching this garbage of a movie"
    },
    {
        "name": "Lucia Esport",
        "email": "lucia_133@gmail.com",
        "movie_id": ObjectId('573a1390f29313caabcd5268'),
        "text": "Not what I expected when I watched the trailer"
    },
    {
        "name": "Mia Winters",
        "email": "mia_evil@resident.com",
        "movie_id": ObjectId('573a1390f29313caabcd56d0'),
        "text": "Too scary, I love it"
    },
    {
        "name": "Johnny Bravo",
        "email": "johnny69@hothotmail.com",
        "movie_id": ObjectId('573a1390f29313caabcd56df'),
        "text": "The only good thing about this movie is the actresses"
    }
])

// 2

db.movies.find(
    {
        $and: [{ "year": { $lt: 2000 } },
        { "year": { $gt: 1989 } },
        { "imdb.rating": { $type: 1 } }
        ]
    },
    { "title": 1, "year": 1, "cast": 1, "directors": 1, "imdb.rating": 1 }
).sort({ "imdb.rating": -1 }).limit(10)

// The Civil War es la pelicula con mayor rating (9.4) de la decada del 90

// 3

db.comments.find(
    {
        $and: [{ "movie_id": ObjectId('573a1399f29313caabcee886') },
        { "date": { $lt: ISODate('2017-01-01T00:00:00.000Z') } },
        { "date": { $gte: ISODate('2014-01-01T00:00:00.000Z') } }
        ]
    },
    { "name": 1, "email": 1, "text": 1, "date": 1 }
).sort({ "date": 1 })

db.comments.find(
    {
        $and: [{ "movie_id": ObjectId('573a1399f29313caabcee886') },
        { "date": { $lt: ISODate('2017-01-01T00:00:00.000Z') } },
        { "date": { $gte: ISODate('2014-01-01T00:00:00.000Z') } }
        ]
    }
).count()

// 4

db.comments.find(
    { "email": "patricia_good@fakegmail.com" },
    { "name": 1, "movie_id": 1, "text": 1, "date": 1 }
).sort({ "date": -1 }).limit(3)

// 5

db.movies.find(
    {
        $and: [{ "released": { $exists: true } },
        { "genres": { $all: ["Drama", "Action"] } },
        { "languages": { $size: 1 } },
        {
            $or: [{ "imdb.rating": { $gt: 9 } },
            { "runtime": { $gte: 180 } }
            ]
        }
        ]
    },
    { "title": 1, "languages": 1, "genres": 1, "released": 1, "imdb.votes": 1 }
).sort({ "released": 1, "imdb.votes": -1 })

// 6

db.theaters.find(
    {
        $and: [{ "location.address.state": { $in: ["CA", "NY", "TX"] } },
        { "location.address.city": { $in: [/^F/i] } }
        ]
    },
    { "theaterId": 1, "location.address.state": 1, "location.address.city": 1, "location.geo.coordinates": 1 }
).sort({ "location.address.state": 1, "location.address.city": 1 })

// 7 ("$date": new Date() es otra forma)

db.comments.updateOne(
    { "_id": ObjectId('5b72236520a3277c015b3b73') },
    { $set: { "text": "mi mejor comentario" }, $currentDate: { "date": true } }
)

// 8

db.users.updateOne(
    { "email": "joel.macdonel@fakegmail.com" },
    { $set: { "password": "some password" } },
    { upsert: true }
)

// 9

db.comments.find(
    {
        $and: [{ "email": "victor_patel@fakegmail.com" },
        { "date": { $gte: ISODate('1980-01-01T00:00:00.000Z') } },
        { "date": { $lt: ISODate('1981-01-01T00:00:00.000Z') } }
        ]
    }
)

db.comments.deleteMany(
    {
        $and: [{ "email": "victor_patel@fakegmail.com" },
        { "date": { $gte: ISODate('1980-01-01T00:00:00.000Z') } },
        { "date": { $lt: ISODate('1981-01-01T00:00:00.000Z') } }
        ]
    }
)

// 10

db.restaurants.find(
    {
        "grades": {
            $elemMatch: {
                $and: [{ "score": { $gt: 70 } },
                { "score": { $lte: 90 } },
                { "date": { $lt: ISODate('2016-01-01T00:00:00.000Z') } },
                { "date": { $gte: ISODate('2014-01-01T00:00:00.000Z') } }]
            }
        }
    },
    { "restaurant_id": 1, "grades": 1 }
)

// 11

db.restaurants.updateOne(
    { "restaurant_id": "50018608" },
    {
        $addToSet: {
            "grades": {
                $each: [{ "date": ISODate("2019-10-10T00:00:00Z"), "grade": "A", "score": 18 },
                { "date": ISODate("2020-02-25T00:00:00Z"), "grade": "A", "score": 21 }]
            }
        }
    }
)