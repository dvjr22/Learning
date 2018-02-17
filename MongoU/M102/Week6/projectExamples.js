
db.companies.aggregate([
    // funding_rounds : array of documents 
    // investments : array of documents
    // financial_org : doc
    // permalink : attribute
    { $match: {"funding_rounds.investments.financial_org.permalink": "greylock" } }, // match an element within array
    { $project: {
        _id: 0, 
        name: 1,
        ipo: "$ipo.pub_year", // make top level values in doc query produces
        valuation: "$ipo.valuation_amount", // $ - assign value of key to field
        funders: "$funding_rounds.investments.financial_org.permalink"
    } }
]).pretty()

db.companies.aggregate([
    { $match: {"funding_rounds.investments.financial_org.permalink": "greylock" } },
    { $project: {
        _id: 0, 
        name: 1,
        founded: { // construct new nested document
            year: "$founded_year",
            month: "$founded_month",
            day: "$founded_day"
        }
    } }
]).pretty()

db.companies.aggregate([
    { $match: {name: 'Facebook'} },
    { $project: {
        _id: 0,
        name: 1,
        people: "$relationships.person.last_name"
    } }
])