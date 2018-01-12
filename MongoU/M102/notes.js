
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