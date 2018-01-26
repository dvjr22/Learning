
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