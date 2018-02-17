db.companies.aggregate([
    { $match: {"funding_rounds.investments.financial_org.permalink": "greylock" } },
    { $project: {
        _id: 0,
        name: 1,
        founded_year: 1,
        rounds: { $filter: {
            input: "$funding_rounds", // the array
            as: "round", // name used for array
            // $$ - reference variable established in expression
            cond: { $gte: ["$$round.raised_amount", 100000000] } } } // criteria to filter array
    } },
    { $match: {"rounds.investments.financial_org.permalink": "greylock" } },    
]).pretty()

db.companies.aggregate([
    { $match: { "founded_year": 2010 } },
    { $project: {
        _id: 0,
        name: 1,
        founded_year: 1,
        first_round: { $arrayElemAt: [ "$funding_rounds", 0 ] }, // 1st array element
        last_round: { $arrayElemAt: [ "$funding_rounds", -1 ] } // last array element
    } }
]).pretty()


db.companies.aggregate([
    { $match: { "founded_year": 2010 } },
    { $project: {
        _id: 0,
        name: 1,
        founded_year: 1,
        first_round: { $slice: [ "$funding_rounds", 1 ] }, // take 1 element starting at 1st element
        last_round: { $slice: [ "$funding_rounds", -1 ] } // take 1 element starting from last
    } }
]).pretty()



db.companies.aggregate([
    { $match: { "founded_year": 2010 } },
    { $project: {
        _id: 0,
        name: 1,
        founded_year: 1,
        early_rounds: { $slice: [ "$funding_rounds", 1, 3 ] } // take 3 elements starting at index 1
    } }
]).pretty()



db.companies.aggregate([
    { $match: { "founded_year": 2004 } },
    { $project: {
        _id: 0,
        name: 1,
        founded_year: 1,
        total_rounds: { $size: "$funding_rounds" } // the size of the array 
    } }
]).pretty()



    

