
//Week1

db.names.find()
//{ "_id" : ObjectId("5a576c08417ffb5816bf4691"), "name" : "Andre Erlichson" }
var j = db.names.findOne()
j
//{ "_id" : ObjectId("5a576c08417ffb5816bf4691"), "name" : "Andre Erlichson" }
j.name
//Andre Erlichson
j.name = "Diego Valdes"
//Diego Valdes
db.names.save(j)
//WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
db.names.find()
//{ "_id" : ObjectId("5a576c08417ffb5816bf4691"), "name" : "Diego Valdes" }
