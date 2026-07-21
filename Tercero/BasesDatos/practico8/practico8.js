// 1

db.theaters.aggregate([
    {
        $group: {
            _id: "$location.address.state",
            "total_amount": { $sum: 1 }
        }
    }
])

// 2

db.theaters.aggregate([
    {
        $group: {
            _id: "$location.address.state",
            "total_amount": { $sum: 1 }
        }
    },
    {
        $match: { total_amount: { $gte: 2 } }
    },
    {
        $count: "total amount of states with two or more theaters"
    }
])

// 3

// No agregacion
db.movies.find(
    { "directors": { $all: ["Louis Lumière"] } }
).count()

// Agregacion
db.movies.aggregate([
    { $match: { "directors": { $all: ["Louis Lumière"] } } },
    { $count: "movies directed by Louis Lumière" }
]
)

// 4

db.movies.find(
    {
        $and: [{ "released": { $gte: ISODate('1950-01-01T00:00:00.000Z') } },
        { "released": { $lt: ISODate('1960-01-01T00:00:00.000Z') } }]
    }
).count()

db.movies.aggregate([
    {
        $match: {
            $and: [{ "released": { $gte: ISODate('1950-01-01T00:00:00.000Z') } },
            { "released": { $lt: ISODate('1960-01-01T00:00:00.000Z') } }]
        }
    },
    {
        $count: "movies released in 50s"
    }
])

// 5

db.movies.aggregate([
    {
        $unwind: "$genres"
    },
    {
        $group: {
            _id: "$genres",
            "total_amount": { $sum: 1 }
        }
    },
    {
        $sort: { total_amount: -1 }
    },
    {
        $limit: 10
    }
])

// 6

db.comments.aggregate([
    {
        $group: {
            _id: "$name",
            "total_amount": { $sum: 1 }
        }
    },
    {
        $lookup: {
            from: "users",
            localField: "_id",
            foreignField: "name",
            as: "personal_info"
        }
    },
    {
        $unwind: "$personal_info"
    },
    {
        $project: {
            "name": 1,
            "personal_info.email": 1,
            "total_amount": 1
        }
    },
    {
        $sort: { total_amount: -1 }
    },
    {
        $limit: 10
    }
])

// Esta version es más optima

db.comments.aggregate([
    {
      $group: {
        "_id": "$email",
        "name" : { $first: '$name' },
        "email" : { $first: '$email' },
        "comm_count": {
          $count: {}
        }
      }
    },
    {
      $sort: {
        "comm_count": -1
      }
    },
    {
      $limit: 10
    }
  ])

// 7 (Otra forma {"imdb.rating": {$ne: ""}})

db.movies.aggregate([
    {
        $match: {
            $and: [{ "released": { $exists: true } },
            { "imdb.rating": { $type: 1 } },
            { "released": { $gte: ISODate('1980-01-01T00:00:00.000Z') } },
            { "released": { $lt: ISODate('1990-01-01T00:00:00.000Z') } }
            ]
        }
    },
    {
        $addFields: { "released_year": { $year: "$released" } }
    },
    {
        $group: {
            _id: "$released_year",
            "max_rating": { $max: "$imdb.rating" },
            "min_rating": { $min: "$imdb.rating" },
            "avg_rating": { $avg: "$imdb.rating" }
        }
    },
    {
        $sort: { "avg_rating": -1 }
    }
])

// 8

db.comments.aggregate([
    {
        $group: {
            _id: "$movie_id",
            "total_comments": { $sum: 1 }
        }
    },
    {
        $lookup: {
            from: "movies",
            localField: "_id",
            foreignField: "_id",
            as: "movie_info"
        }
    },
    {
        $unwind: "$movie_info"
    },
    {
        $project: {
            "title": "$movie_info.title",
            "released_year": { $year: "$movie_info.released" },
            "total_comments": 1,
            "_id": 0
        }
    },
    {
        $sort: {
            "total_comments": -1
        }
    },
    {
        $limit: 10
    }
])

// 9

db.createView(
    "MostCommentedGenres",
    "comments",
    [
        {
            $group: {
                _id: "$movie_id",
                total_comments: { $sum: 1 }
            }
        },
        {
            $lookup: {
                from: "movies",
                localField: "_id",
                foreignField: "_id",
                as: "movie_info"
            }
        },
        {
            $unwind: "$movie_info"
        },
        {
            $unwind: "$movie_info.genres"
        },
        {
            $group: {
                _id: "$movie_info.genres",
                "total_comments": { $sum: "$total_comments" }
            }
        },
        {
            $sort: {
                "total_comments": -1
            }
        },
        {
            $limit: 5
        }
    ]
)

db.comments.aggregate(
    [
        {
            $group: {
                _id: "$movie_id",
                total_comments: { $sum: 1 }
            }
        },
        {
            $lookup: {
                from: "movies",
                localField: "_id",
                foreignField: "_id",
                as: "movie_info"
            }
        },
        {
            $unwind: "$movie_info"
        },
        {
            $unwind: "$movie_info.genres"
        },
        {
            $group: {
                _id: "$movie_info.genres",
                "total_comments": { $sum: "$total_comments" }
            }
        },
        {
            $sort: {
                "total_comments": -1
            }
        },
        {
            $limit: 5
        }
    ]
)

// 10 

// https://stackoverflow.com/questions/47332895/mongodb-aggregate-how-to-addtoset-each-element-of-array-in-group-pipeline

db.movies.aggregate([
    {
        $match: { "directors": { $all: ["Jules Bass"] } }
    },
    {
        $unwind: "$cast"
    },
    {
        $addFields: { "movies": [] }
    },
    {
        $group: {
            _id: "$cast",
            "worked_movies": { $addToSet: { "title": "$title", "year": { $year: "$released" } } }
        }
    },
    {
        $match: { "worked_movies.2": { $exists: true } }
    }
])

// 11

db.comments.aggregate([
    {
        $lookup: {
            from: "movies",
            let: { "movie_id": "$movie_id", "comment_date": "$date" },
            pipeline: [
                {
                    $match:
                    {
                        $expr:
                        {
                            $and: [{ $eq: ["$_id", "$$movie_id"] },
                            { $eq: [{ $year: "$released" }, { $year: "$$comment_date" }] },
                            { $eq: [{ $month: "$released" }, { $month: "$$comment_date" }] }]
                        }
                    }
                }

            ],
            as: "movie_info"
        }
    },
    {
        $unwind: "$movie_info"
    },
    {
        $project: {
            "_id": 1,
            "name": 1,
            "email": 1,
            "text": 1,
            "date": 1,
            "title": "$movie_info.title",
            "released": "$movie_info.released"
        }
    }
])

// 12

// A
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $group: {
            _id: { "restaurant_id": "$restaurant_id", "name": "$name" },
            max_grade: { $max: "$grades.score" },
            min_grade: { $min: "$grades.score" },
            sum_grade: { $sum: "$grades.score" }
        }
    },
    {
        $project: {
            "_id": 0,
            "restaurant_id": "$_id.restaurant_id",
            "name": "$_id.name",
            "max_grade": 1,
            "min_grade": 1,
            "sum_grade": 1,
        }
    }
])

// B

db.restaurants.aggregate([
    {
        $project: {
            "_id": 0,
            "restaurant_id": 1,
            "name": 1,
            "max_grade": { $max: "$grades.score" },
            "min_grade": { $min: "$grades.score" },
            "sum_grade": { $sum: "$grades.score" }
        }
    }
])

// C

db.restaurants.aggregate([
    {
        $project: {
            "_id": 0,
            "restaurant_id": 1,
            "name": 1,
            "max_grade": { $max: "$grades.score" },
            "min_grade": { $min: "$grades.score" },
            "sum_grade": {
                $reduce: {
                    input: "$grades.score",
                    initialValue: 0,
                    in: { $add: ["$$value", "$$this"] }

                }
            }
        }
    }
])

// D (No se me ocurre como hacerlo en un solo find)

// 13

db.restaurants.updateMany(
    {},
    [
        {
            $set: { "average_score": { $avg: "$grades.score" } }
        },
        {
            $set: {
                "grade": {
                    $switch: {
                        branches: [
                            { case: { $lte: ["$average_score", 13] }, then: "A" },
                            { case: { $lte: ["$average_score", 27] }, then: "B" }
                        ],
                        default: "C"
                    }
                }
            }
        }
    ]
)