db.companies.aggregate([
    { $match: { founded_year: { $gte: 2010 } } },
    { $group: {
        _id: { founded_year: "$founded_year"}, // do this...
        //_id: "$founded_year", // ...don't do this
        companies: { $push: "$name" } // adds value to running array
    } },
    { $sort: { "_id.founded_year": 1 } }
]).pretty()


db.companies.aggregate([
    { $match: { founded_year: { $gte: 2010 } } },
    { $group: {
        _id: "$founded_year",
        companies: { $push: "$name" }
    } },
    { $sort: { "_id": 1 } }
]).pretty()

db.companies.aggregate([
    { $match: { founded_year: { $gte: 2010 } } },
    { $group: {
        _id: { founded_year: "$founded_year", category_code: "$category_code" },
        companies: { $push: "$name" }
    } },
    { $sort: { "_id.founded_year": 1 } }
]).pretty()

db.companies.aggregate([
    { $group: {
        _id: { ipo_year: "$ipo.pub_year" },
        companies: { $push: "$name" }
    } },
    { $sort: { "_id.ipo_year": 1 } }
]).pretty()

db.companies.aggregate( [
    { $match: { "relationships.person": { $ne: null } } },
    { $project: { relationships: 1, _id: 0 } },
    { $unwind: "$relationships" },
    { $group: {
        _id: "$relationships.person",
        count: { $sum: 1 }
    } },
    { $sort: { count: -1 } }
] )

