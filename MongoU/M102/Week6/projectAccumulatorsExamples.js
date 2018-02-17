db.companies.aggregate([
    { $match: { "funding_rounds": { $exists: true, $ne: [ ]} } },
    { $project: {
        _id: 0,
        name: 1,
        largest_round: { $max: "$funding_rounds.raised_amount" } // gets max value within array
    } }
])

db.companies.aggregate([
    { $match: { "funding_rounds": { $exists: true, $ne: [ ]} } },
    { $project: {
        _id: 0,
        name: 1,
        total_funding: { $sum: "$funding_rounds.raised_amount" } // sum the values of an array
    } }
])

db.companies.aggregate([
    { $group: {
        _id: { founded_year: "$founded_year" },
        average_number_of_employees: { $avg: "$number_of_employees" }  // average of an array
    } },
    { $sort: { average_number_of_employees: -1 } }
    
])


    
    

