

// my cluster
mongo "mongodb://cluster0-shard-00-00-uq5bb.mongodb.net:27017,cluster0-shard-00-01-uq5bb.mongodb.net:27017,cluster0-shard-00-02-uq5bb.mongodb.net:27017/test?replicaSet=Cluster0-shard-0" --authenticationDatabase admin --ssl --username dvjr22 --password '!buk1sfV'

// show databases
show dbs

// Insert one record
// db.collectionName.insertOne(recordToInsert)
db.movieScratch.insertOne({title: "Star Trek II: The Wrath of Khan", year: 1982, imdb: "tt0084726"})
// Can set own id
db.movieScratch.insertOne({_id: "tt0084726", title: "Star Trek II: The Wrath of Khan", year: 1982, imdb: "tt0084726"})

// Drop a collection
// db.collectionName.drop()
db.moviesScratch.drop()

// Find
// db.collectionName.find(WhatToFind)
// movies rated "pg-13" and year 2009
db.movieDetails.find({rated : "PG-13", year: 2009}).pretty()

//quotes required in shell
db.data.find({"wind.direction.angle": 290})


// Count the results
db.movieDetails.find({"awards.wins": 2, "awards.nominations": 2}).count()


// Array matching
// any element in the array
db.movieDetails.find({cast: "Jeff Bridges"})
// exact array
db.movieDetails.find({cast: ["Jeff Bridges", "Tim Robbins"]}).pretty()
// Jeff Bridges as first element
db.movieDetails.find({'cast.0': "Jeff Bridges"}).pretty()
// count the number of times these are the only two writers
db.movieDetails.find({writers: ["Ethan Coen", "Joel Coen"]}).count()
// Count Family movies
db.movieDetails.find({genres : "Family"}).count()
// Count Western as 2 index
db.movieDetails.find({'genres.1' : "Western"}).count()

// projections
// passed as the second arguement in find()
// include fields with 1, exclude with 0
db.movieDetails.find({genres: "Action"}, {title: 1})
db.movieDetails.find({genres: "Comedy"}, {title: 1})
// exclude _id which is returned by default
db.movieDetails.find({genres: "Comedy"}, {title: 1, _id: 0})
// exclude _id, rated, director, awards, but include everything else
db.movieDetails.find({genres: "Comedy"}, {_id: 0, rated: 0, director: 0, awards: 0}).pretty()

// Updates
// UpdateOne
// Will update the first record found with matching filter
db.moveDetails.updateOne({
	// filter
	title: "The Martian"
}, {
	// will update using $set
	$set: {
		poster: "http://www.impawards.com/2015/martian.html"
	}
})

db.movieDetails.updateOne({
	title: "The Martian"
}, {
	$set: {
		poster: "http://www.impawards.com/2015/martian.html"
	}
})

db.movieDetails.updateOne({
	title: "The Martian"
}, {
	$set: {
		"awards": {
			"wins": 9,
			"nominations": 15,
			"text": "Nominated for 4 Golden Globes. Another 9 wins and 15 nominations"
		}
	}
});

// increment update
db.movieDetails.updateOne({
	title: "The Martian"
}, {
	$inc: {
		// increment by 3
		"tomato.reviews": 3,
		// increment by 5
		"tomato.userReviews": 25
	}
})

let reviewText1 = [
	"reviews",
	"more revies",
	"more and more reviews"
].join();

db.movieDetails.updateOne({
	title: "The Martian"
}, {
	// Add to array or create one if on doesn't exist
	$push: {
		reviews: {
			rating: 4.5,
			date: ISODate("2016-01-12T09:00:00Z"),
			reviewer: "Spencer H.",
			text: reviewText1
		}
	}
});

let reviewText2 = [
	"reviews",
	"more revies",
	"more and more reviews"
].join();

let reviewText3 = [
	"reviews",
	"more revies",
	"more and more reviews"
].join();

db.movieDetails.updateOne({
	title: "The Martian"
}, {
	// Add to array or create one if on doesn't exist
	$push: {
		reviews: {
			// add each document as an indvidual element in the array
			$each: [{
				rating: 5.0,
				date: ISODate("2016-01-12T09:00:00Z"),
				reviewer: "Yabo A H.",
				text: reviewText2
			}, {
				rating: 3.5,
				date: ISODate("2016-01-12T09:00:00Z"),
				reviewer: "Kristina Z.",
				text: reviewText2
			}
			]
		}
	}
});

// UpdateMany
// Will modify all docs that match filter
db.movieDetails.updateMany({
	rated: null
}, {
	// will remove field
	$unset: {
		rated: ""
	}
});

let detail = [
	"movie doc"
]

// Upsert
db.movieDetails.updateOne({
	"imdb.id": detail.imdb.id
}, {
	// if doc exists, replace with detail data
	$set: detail
}, {
	// If filter provides no matches, doc will be created
	upsert: true
});

// Replace
// used to replace an entire document

// set find to a var. findOne() returns 1 doc
detailDoc = db.movieDetails.findOne({"imdb.id": "tt4368814"});
// returns the poster field
detailDoc.poster;
// set poster to http
detailDoc.poster = "http://www.google.com";
// returns genres
detailDoc.genres;
// push to genres array, .push() is javascript method
detailDoc.genres.push("Documentary");

// replace doc in db with doc in memory using replaceOne()
db.movieDetails.replaceOne({
	// filter on imdb.id
	"imdb.id": detailDoc.imdb.id
},
	// replace with this doc
	detailDoc
);

// Delete
// delete one record matching filter
db.reviews.deleteOne({_id: ObjectId("5a09d3c8203047a6e1b4e579")});
// delete all records matching filter
db.reviews.deleteMany({reviewer_id: 759723314});

// Chapter 3

// Comparisons

// movies greater than 90 min
db.movieDetails.find({runtime: {$gt: 90}})
// project title and runtime
db.movieDetails.find({runtime: {$gt: 90}}, {_id: 0, title: 1, runtime: 1})
// greater than 90 and less than 120 min
db.movieDetails.find({runtime: {$gt: 90, $lt: 120}}, {_id: 0, title: 1, runtime: 1})
// greater than/equal to 90 and less than/equal to 120
db.movieDetails.find({runtime: {$gte: 90, $lte: 120}}, {_id: 0, title: 1, runtime: 1})

// greater than/equal to 180 min and tomato meter = 100
db.movieDetails.find({runtime: {$gte: 180}, "tomato.meter": 100}, {_id: 0, title: 1, runtime: 1})
// greater than/equal to 180 tomato meter >= 95
db.movieDetails.find({runtime: {$gte: 180}, "tomato.meter": {$gte : 95}}, {_id: 0, title: 1, runtime: 1})

// where rated != unrated. will also return where field doesn't exist
db.movieDetails.find({rated: {$ne: "UNRATED"}}, {_id: 0, title: 1, rated: 1})

// select all documents with G or PG rating. Value of $in must be array
db.movieDetails.find({rated: {$in: ["G", "PG"]}}, {_id: 0, title: 1, rated: 1})
// ... PG-13
db.movieDetails.find({rated: {$in: ["G", "PG", "PG-13"]}}, {_id: 0, title: 1, rated: 1}).pretty()
// ... R, PG-13
db.movieDetails.find({rated: {$in: ["R", "PG-13"]}}, {_id: 0, title: 1, rated: 1}).pretty()
// select all docs not in rating = R or PG-13
db.movieDetails.find({rated: {$nin: ["R", "PG-13"]}}, {_id: 0, title: 1, rated: 1}).pretty()

// movies written by Ethan and Joel Coen
db.movieDetails.find({ writers : {$in: ["Ethan Coen", "Joel Coen"]} }, {_id: 0, title: 1})

// the number of movies written by Ethan and Joel
db.movieDetails.find({writers: {$in: ["Ethan Coen", "Joel Coen"]}}).count()


// Elements

// return all docs with mpaaRating
db.moviesDetails.find({mpaaRating: {$exists: true}})

// return all docs without mpaaRating
db.moviesDetails.find({mpaaRating: {$exists: false}})

// return all docs with null as value and that are missing mpaaRating
db.movieDetails.find({mpaaRating: null})

db.movieDetails.find({})

// return docs where viewerRating is of type int
db.movies.find({viewerRating: {$type: "int"}}).pretty()
// ... type double
db.movies.find({viewerRating: {$type: "double"}}).pretty()

// how many records don't have field
db.data.find({atmosphericPressureChange: {$exists: false}}).count()
{atmosphericPressureChange : {$exists: false}}

// Logical operators

// docs with tomato meter > 95 or metacritic > 88
// $or takes an array of selectors
db.movieDetails.find({$or: [{"tomato.meter": {$gt: 95}},                               
                            {"metacritic": {$gt: 88}}]},
                     {_id: 0, title: 1, "tomato.meter": 1, "metacritic": 1})

// docs with tomato meter > 95 and metacritic > 88
// $and takes an array of selectors
db.movieDetails.find({$and: [{"tomato.meter": {$gt: 95}},                               
                            {"metacritic": {$gt: 88}}]},
                     {_id: 0, title: 1, "tomato.meter": 1, "metacritic": 1})

// is equivalent to above and query
// implecitly 'and' in a query
db.movieDetails.find({"tomato.meter": {$gt: 95},                               
                      "metacritic": {$gt: 88}},
                     {_id: 0, title: 1, "tomato.meter": 1, "metacritic": 1})

// $and allows multiple constraint on the same field
// all docs where metacritic != null but exists
db.movieDetails.find({$and: [{"metacritic": {$ne: null}},
                             {"metacritic": {$exists: true}}]},
                          {_id: 0, title: 1, "metacritic": 1})

db.movieDetails.find({$and: [{"metacritic": null},
                             {"metacritic": {$exists: true}}]},
                     {_id: 0, title: 1, "metacritic": 1})


// watlev = 'always dry' or depth = 0
db.shipwrecks.find({$or: [{depth: 0}, {watlev: "always dry"}]}).count()
{$or: [{depth: 0}, {watlev: "always dry"}]}

// Array value fields

// return all docs where array has all of the criteria
db.movieDetails.find({genres: {$all: ["Comedy", "Crime", "Drama"]}}, 
                     {_id: 0, title: 1, genres: 1}).pretty()

// will return records that have all of the search criteria, but not only these parameters
db.movieDetails.find({genres: {$all: ["Comedy", "Drama"]}}, 
                     {_id: 0, title: 1, genres: 1}).pretty()

// sections contains AG1, MD1 OA1
db.data.find({sections: {$all: ["AG1", "MD1", "OA1"]}}).count()
{sections: {$all: ["AG1", "MD1", "OA1"]}}



// Size

// all docs where countries array is of size 1
// translates to movies filmed in one country
db.movieDetails.find({countries: {$size: 1}}).pretty()

// sections array of size 2
db.data.find({sections: {$size: 2}}).count()
{sections: {$size: 2}}

// Element match

// Sample field
// Boxoffice in millions
boxOffice: [ { "country": "USA", "revenue": 228.4 },
             { "country": "Australia", "revenue": 19.6 },
             { "country": "UK", "revenue": 33.9 },
             { "country": "Germany", "revenue": 16.2 },
             { "country": "France", "revenue": 19.8 } ]

// This query would return incorrect records.
// Return docs where Germany is a country and boxOffice > 17 but not
// where German box office > 17
db.movieDetails.find({"boxOffice.country": "Germany", "boxOffice.revenue": {$gt: 17}}).pretty()
// Same, but > 228
db.movieDetails.find({"boxOffice.country": "Germany", "boxOffice.revenue": {$gt: 228}})

// create sample in cluster
use video
martian = db.movieDetails.findOne({title: "The Martian"})
martian
delete martian._id;
martian
martian.boxOffice = [
    {"country": "USA", "revenue": 228.4},
    {"country": "Australia", "revenue": 19.6},
    {"country": "UK", "revenue": 33.9},
    {"country": "Germany", "revenue": 16.2},
    {"country": "France", "revenue": 19.8}
]
db.movieDetails.insertOne(martian);

// This query returns correct
// return docs where german box office > 17
// 0 results
db.movieDetails.find({boxOffice: {$elemMatch: {"country": "Germany", "revenue": {$gt: 17}}}})

// return docs where german box office > 16
// 0 results
db.movieDetails.find({boxOffice: {$elemMatch: {"country": "Germany", "revenue": {$gt: 16}}}})

// docs where abc has a score 7
db.surveys.find({results: {$elemMatch: {product: "abc", score: 7}}}).count()
{results : {$elemMatch: {product: "abc", score: 7 }}}

// regex

// find all docs and project fields
db.movieDetails.find({}, {_id: 0, "title": 1, "awards.text": 1}).pretty()

// match using regex
// Find all docs where Won is the start of the field
db.movieDetails.find({"awards.text": {$regex: /^Won .* /}}, {_id: 0, title: 1, "awards.text": 1}).pretty()

// array contains an element with a value >= 70 and < 80
db.scores.find({results: {$elemMatch: {$gte: 70, $lt: 80}}}).count()
{results: {$elemMatch: {$gte: 70, $lt: 80}}}

// Final 

// field set to null
{tripduration: null}

// movies with Jack or John that are scored > 7 and rated R
{$or: [{cast: "Jack Nicholson"}, {cast: "John Huston"}],
viewerRating : {$gt: 7},
mpaaRating : 'R'
}