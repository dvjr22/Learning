
sudo service mongod start

// 16MB doc size limit in mongo

//Week 1

mongo localhost/adviseMe //Start mongod with db loaded

mongoimport --db pcat --collection products < /home/valdeslab/MongoU/M102/HW_1/Products__hw1.2_m102_529e39a8e2d42347509fb3f0.json //Import file to db


db.products.find( {for : "ac9", type : "case"} ) 
db.products.find( { type : "case" } ).count()

//hw1
db.isMaster().maxBsonObjectSize

db.products.find( { brand : "ACME"} ) //Products from ACME

db.products.find( { }, { name : 1, _id : 0} ).sort( { name : 1 } ) //Name of all products sorted accending

//Print just the names of products with no extraneous characters
var c = db.products.find( { }, { name : 1, _id : 0} ).sort( { name : 1 } )
while ( c.hasNext() ) {
	print( c.next().name)
}

var c = db.products.find( { } ).sort( { name : 1 } )
c.forEach( function(doc) { print(doc.name) } )

//Week 2
db.temperature.insert( { x : 3, y : 4})

var t = db //assign var to db instance
t = db.test //include collection
t.find() // instead of db.test.find()
t.update( { _id : 100}, { "_id" : 100, x : "hello world", y : 123})

//full doc update
myobj = t.findOne() // { _id : ObjectId("100"), "x" : "hello"}
myobj.y = 123 // { _id : ObjectId("100"), "x" : "hello", "y" : 123}
t.update( { _id : myobj._id } , myobj ) // writes to db
t.save(myobj) // writes to db. Shell command that updates

//partial update
//full list of update operators - https://docs.mongodb.com/manual/reference/operator/update/
t.update( { _id : 101 }, { $set : { y : 100 } } ) //set y attribute
t.update( { _id : 101 }, { $inc : { y : 1 } } ) //increment y by 1
t.update( { _id : 101 }, { $push : { arr : "hi" } } ) //push unto array
t.update( { _id : 101 }, { $addToSet : { arr : "bye" } } ) //push unto array if value doesn't exist

//multi doc
//db.collection.update( query_document , update_document , [ options_document ] )
// You should now use an optional options document
// where optional options_document has any one or more of the following optional parameters:
/*
upsert : true/false,
multi : true/false,
writeConcern: document
*/

//upsert - update or insert if not present
//db.collection.update( query_document, update_document, options_document )
//where options_document contains key:value pairs such as:
/*
upsert : true/false,
multi : true/false,
writeConcern: document
*/
t = db.pageviews
t.update( { _id : "/sports/football" }, { $inc : { views : 1 } }, { upsert : true } )

db.users.update( { _id : "Jane" }, { $addToSet : { likes : "football" } }, { upsert : true } )

//remove/delete
db.test.remove( { _id : 100 } )
db.test.remove( { } ) // remove entire collection
db.test.remove( { x : /ello/ } ) //remove with regular expresion

db.users.remove( { "addr.city" : "Lyon", registered : false } )

//bulk write operations
//https://docs.mongodb.com/manual/reference/method/Bulk/
var bulk = db.items.initializeUnorderedBulkOp() //create opperation
//data to be inserted
bulk.insert( { item: "abc123", defaultQty: 100, status: "A", points: 100 })
bulk.insert( { item: "ijk123", defaultQty: 200, status: "A", points: 200 })
bulk.insert( { item: "mop123", defaultQty: 0, status: "P", points: 0 })
bulk.execute() //execute operation
/* result
BulkWriteResult({
	"writeErrors" : [ ],
	"writeConcernErrors" : [ ],
	"nInserted" : 3,
	"nUpserted" : 0,
	"nMatched" : 0,
	"nModified" : 0,
	"nRemoved" : 0,
	"upserted" : [ ]
})
*/

var bulk = db.items.initializeOrderedBulkOp() 
bulk.find( { item : "abc123" } ).remove()
bulk.find( { item : "mop123" } ).remove()
bulk.find( { item : "ijk123" } ).update( { $inc : { points : 1} } )
bulk.execute()
/*
BulkWriteResult({
	"writeErrors" : [ ],
	"writeConcernErrors" : [ ],
	"nInserted" : 0,
	"nUpserted" : 0,
	"nMatched" : 1,
	"nModified" : 1,
	"nRemoved" : 2,
	"upserted" : [ ]
})
*/

//commands
//https://docs.mongodb.com/manual/reference/command/
//db.runCommand( { <command> } )

db.runCommand( { getLastError : 1 } )
db.runCommand( { getLastError : 1, w : 3 } )
db.runCommand( { isMaster : 1 } ) // db.isMaster() // also works
db.serverStatus()
db.currentOp() //check currently running
db.killOp(<opId>) //kill running
db.collectionName.stats() //show collection stats
db.collectionName.drop() //drop collection
db.runCommand( { create : "collectionName"}) //create collection

//hw2
b = db.products_bak; 
db.products.find().forEach( function(o){ b.insert(o) } )
b.count()
homework.a()

db.products.insert({
    "_id" : "ac9",
    "name" : "AC9 Phone",
    "brand" : "ACME",
    "type" : "phone",
    "price" : 333,
    "warranty_years" : 0.25,
    "available" : true
})
var x = db.products.findOne( {_id : ObjectId("507d95d5719dbef170f15c00")} )
x.term_years = 3
x.limits.sms.over_rate = 0.01
db.products.update( { _id : x._id }, x)
t.update( { _id : myobj._id } , myobj ) // writes to db
homework.b()

db.products.find( { "limits.voice" : {$exists : true} }).count()

//Week 3

mongod --storageEngine mmapv1 //default
mongod --storageEngine wiredTiger

db.foo.createIndex( { a : 1 } ) // index on a, 1 denotes ascending
db.foo.createIndex( { a : 1, b : 1 } )
db.foo.find().sort( { a : 1, b: 1 } )
db.foo.getIndexes()
db.foo.dropIndex( { a : 1 } )

db.places.createIndex( { loc : "2dsphere" } ) //index on lat lon on sphere ie: loc : [12.3, 34.5]
db.sentences.createIndex( { words : "text" } ) //index on words, each word in attribute added to index
db.sentences.find( { $text : { $search : "cat" } } ) //search on text index
db.sentences.find( { 
	$text : { $search : "Trees cat" } }, 
	{ score : {$meta : "text Score"} , _id : 0} ) //rank results based on score

exp = db.foo.explain("executionStats") //explain exectution
exp.find()
db.foo.dropIndex( { a : 1 } ) //drop index to compare stats results
exp.find( { a : 1 }) //execution
db.foo.createIndex( { a : 1 } ) //add index to compare 
exp.find( { a : 1 }) //execution

db.students.createIndex({'scores.score' : 1}) //index in nested docs
db.students.createIndex({ student_id : 1, class_id : 1 }, { unique : true }) // create unique index
db.employees.createIndex( { cell : 1 }, {unique : true, sparse : true} )// account for attributes of null

db.currentOp() //see current ops
db.killOp(<opId>) //db.killOp(2530594)

db.currentOp().inprog.forEach(
	function(op) {
		if(op.secs_running > 10) {
			print("slow op in progress? secs: " + op.secs_running + " opid: " + op.opid);
		}
	}
)

//hw3
db.sensor_readings.createIndex( { active : 1, tstamp : 1})
db.sensor_readings.getIndexes()

db.currentOp()
db.killOp(931657)

db.products.createIndex( { for : 1 } )
db.products.find( { for : "ac3"}).count() //4
exp = db.products.explain("executionStats")
exp.find( { for : "ac3"}) //4

//Week 4

// prepare replica set
mongod --port 27001 --replSet repset --dbpath ~/Learning/MongoU/M102/Week_4/1 --logpath ~/Learning/MongoU/M102/Week_4/log.1 --logappend --oplogSize 50 --smallfiles --fork
mongod --port 27002 --replSet repset --dbpath ~/Learning/MongoU/M102/Week_4/2 --logpath ~/Learning/MongoU/M102/Week_4/log.2 --logappend --oplogSize 50 --smallfiles --fork
mongod --port 27003 --replSet repset --dbpath ~/Learning/MongoU/M102/Week_4/3 --logpath ~/Learning/MongoU/M102/Week_4/log.3 --logappend --oplogSize 50 --smallfiles --fork

// initiate replica set
cfg = { _id : "replSet", members : [ 
	{_id: 0, host : "dna:27001"} , // machine name - use logical names - dns
	{_id: 1, host : "dna:27002"} , // don't use ip addresses
	{_id: 2, host : "dna:27003"} , // don't use names from /etc/hosts
	]
}

rs.initiate(cfg)
rs.status() // status of each member
rs.conf() // show set configuration

rs.slaveOk() // run on secondary to approve inconsistent reads

//hw4
mongod --dbpath /home/valdeslab/Learning/MongoU/M102/HW_4/1 --port 27001 --smallfiles --oplogSize 50

mongo --port 27001 --shell replication.js

mongod --replSet "hw4" --dbpath /home/valdeslab/Learning/MongoU/M102/HW_4/1 --port 27001 --smallfiles --oplogSize 50
mongo --port 27001

mongod --replSet "hw4" --dbpath /home/valdeslab/Learning/MongoU/M102/HW_4/2 --port 27004 --smallfiles --oplogSize 50
mongod --replSet "hw4" --dbpath /home/valdeslab/Learning/MongoU/M102/HW_4/3 --port 27005 --smallfiles --oplogSize 50
rs.add("dna:27004")
rs.add("dna:27005")

rs.stepDown() //from primary
rs.remove("dna:27001")

//Week 5

cfg = { _id : "replSet", 
	members : [ 
	{_id: 0, host : <name:port>, <options> } //options format
	]
}

var cfg = rs.conf() //assign config to variable
cfg.members[2].priority = 0 //reassign priority
//cfg.members[2].slaveDelay = 120  //time in seconds
rs.reconfig(cfg) //send reconfig to server


for (var i = 0; i < arr.length; i ++) {
	db.foo.insert(arr[i]);
	if (i % 500 == 0 || i == arr.length - 1) { //check every 500th and last for majority insert
		getLastError( { w: "majority" } )
	} else {
		getLastError( { w: 1 } ) //check if primary write
	}
} 

//Week 6

// aggregation pipeline reference page
// https://docs.mongodb.com/manual/meta/aggregation-quick-reference/

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

// unwind example
db.companies.aggregate([
    { $match: {"funding_rounds.investments.financial_org.permalink": "greylock" } },
    { $project: {
        _id: 0,
        name: 1,
        amount: "$funding_rounds.raised_amount", // array
        year: "$funding_rounds.funded_year" // array
    } }
])

db.companies.aggregate([
    { $match: {"funding_rounds.investments.financial_org.permalink": "greylock" } },
    { $unwind: "$funding_rounds" }, // turns array of muliple fields to a document for each match
    { $project: {
        _id: 0,
        name: 1,
        amount: "$funding_rounds.raised_amount", // document with one of the array values
        year: "$funding_rounds.funded_year" // document with one of the array values
    } }
])

// See unwindExamples.js for more unwind examples

// array filters

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

// accumulators

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

// group

db.companies.aggregate([
    { $group: {
        _id: { founded_year: "$founded_year" }, // define how documents will be grouped
        average_number_of_employees: { $avg: "$number_of_employees" } // average of all employees in the founded year
    } },
    { $sort: { average_number_of_employees: -1 } } // sort in reverse order
    
])

// _id best practice
// more examples in idinGroupExamples.js
db.companies.aggregate([
    { $match: { founded_year: { $gte: 2010 } } },
    { $group: {
        _id: { founded_year: "$founded_year"}, // do this...
        //_id: "$founded_year", // ...don't do this
        companies: { $push: "$name" } // adds value to running array
    } },
    { $sort: { "_id.founded_year": 1 } }
]).pretty()


// group vs project

// Put it all together
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

db.companies.aggregate([
    { $match: { funding_rounds: { $ne: null } } },
    { $unwind: "$funding_rounds" },
    { $sort: { "funding_rounds.funded_year": 1,
               "funding_rounds.funded_month": 1,
               "funding_rounds.funded_day": 1 } },
    { $group: {
        _id: { company: "$name" },
        funding: {
            $push: { // $push only available in group stage
                amount: "$funding_rounds.raised_amount",
                year: "$funding_rounds.funded_year" 
            } }
    } },
] ).pretty()


db.companies.aggregate([
    { $match: { funding_rounds: { $exists: true, $ne: null } } },
    { $unwind: "$funding_rounds" },
    { $sort: { "funding_rounds.funded_year": 1,
               "funding_rounds.funded_month": 1,
               "funding_rounds.funded_day": 1 } },
    { $group: {
        _id: { company: "$name" },
        first_round: { $first: "$funding_rounds" }, 
        last_round: { $last: "$funding_rounds" },
        num_rounds: { $sum: 1 },
        total_raised: { $sum: "$funding_rounds.raised_amount" }
    } },
    { $project: {
        _id: 0,
        company: "$_id.company",
        first_round: {
            amount: "$first_round.raised_amount",
            article: "$first_round.source_url",
            year: "$first_round.funded_year"
        },
        last_round: {
            amount: "$last_round.raised_amount",
            article: "$last_round.source_url",
            year: "$last_round.funded_year"
        },
        num_rounds: 1,
        total_raised: 1,
    } },
    { $sort: { total_raised: -1 } }
] ).pretty()

//hw6
db.companies.aggregate( [
    { $match: { "relationships.person": { $ne: null } } },  // ensure not null
    { $project: { relationships: 1, _id: 0, name: 1 } }, // project relationships and company name
    { $unwind: "$relationships" }, // every relationship comes in as a seperate document
    { $group: {
        _id: { person: "$relationships.person" }, // group by person
        name : {  $addToSet : "$name" } // Add company to array, only unique instances will be added
    } },
    { $project : { name: "$relationships.person", // project name
    	count: { $size: "$name"} } }, // size of the array
    { $sort: { count: -1 } } // sort in decending order
] ).pretty()

db.companies.aggregate([
    { $group: {
        _id: { founded_year: "$founded_year" }, // define how documents will be grouped
        average_number_of_employees: { $avg: "$number_of_employees" } // average of all employees in the founded year
    } },
    { $sort: { average_number_of_employees: -1 } } // sort in reverse order
    
])


db.grades.aggregate([
	{ $match: { "scores.type" : { $ne: 'quiz' } } },
	{ $project : { _id: 0, scores: 1}}
])

db.grades.aggregate([
	{ $group : {
		_id : { class : "$class_id", score: "$scores.type" },
		exam_avg : { $avg: "$score"}

	} },
	{ $sort: {_id : 1} }
]).pretty()


db.companies.aggregate([
    {	$match: { "founded_year" : 2004 }},
    {
      $project: { 
          _id : 0, 
          name : 1, 
          founded_year : 1, 
          funding_rounds : 1,
          total_rounds : {
              "$size" : "$funding_rounds"
          }
      }
    },
    {   $match: { total_rounds : { "$gte" : 5 } } },
    {   $unwind: "$funding_rounds" },
    {   $group: { _id : "$name", average : { $avg: "$funding_rounds.raised_amount" } } },
    {   $sort: { "average" : 1 } }
]);