
db.companies.aggregate([
    { $match: { founded_year: 2004 } }, // same as find()
])

db.companies.aggregate([
    { $match: { founded_year: 2004 } },
    { $project: { // projection
        _id: 0,
        name: 1,
        founded_year: 1
    } }
])

db.companies.aggregate([
    { $match: { founded_year: 2004 } },
    { $limit: 5 }, // limit results
    { $project: {
        _id: 0,
        name: 1 } }
])  // pipelines run in order presented

db.companies.aggregate([
    { $match: { founded_year: 2004 } }, // same as find()
    { $sort: { name: 1} }, // sort by name
    { $limit: 5 }, // limit results to 5
    { $project: {
        _id: 0,
        name: 1 } } // projection
])

// Take care with the order in which you specify sort skip and limit
db.companies.aggregate([
    { $match: { founded_year: 2004 } },
    { $limit: 5 }, // limit results to 5
    { $sort: { name: 1} }, // sort the 5 results
    { $project: {
        _id: 0,
        name: 1 } }
]) // returns different results than above query

db.companies.aggregate([
    { $match: { founded_year: 2004 } },
    { $sort: { name: 1} },
    { $skip: 10 }, // skip first 10 results
    { $limit: 5 },
    { $project: {
        _id: 0,
        name: 1 } },
])

