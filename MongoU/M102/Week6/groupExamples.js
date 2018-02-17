db.companies.aggregate([
    { $group: {
        _id: { founded_year: "$founded_year" }, // define how documents will be grouped
        average_number_of_employees: { $avg: "$number_of_employees" } // average of all employees in the founded year
    } },
    { $sort: { average_number_of_employees: -1 } } // sort in reverse order
    
])

db.companies.aggregate( [
    { $match : { founded_year : 2001 } },
    { $project : { _id: 0, name : 1, number_of_employees: 1 } },
    { $sort : { number_of_employees : -1 } }
] )


db.companies.aggregate( [
    { $match: { "relationships.person": { $ne: null } } },  // ensure not null
    { $project: { relationships: 1, _id: 0 } }, // project relationships
    { $unwind: "$relationships" }, // every relationship comes in as a seperate document
    { $group: {
        _id: "$relationships.person", // group by person
        count: { $sum: 1 } // add all relationships
    } },
    { $sort: { count: -1 } } // sort in decending order
] )

