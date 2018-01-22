import pymongo as p

conn = p.MongoClient("mongodb://localhost")

db = conn.students
grades = db.grades


query = {}
try:

	cursor = grades.find(query)
	cursor.sort( [ ('student_id', p.ASCENDING), ('score', p.DESCENDING) ] )

except Exception as e:
	print "error", type(e), e


lastStudent = 0
for doc in cursor:

	print str(doc['_id']) + ' ' +str(doc['student_id']) + ' ' + str(doc['score'])

	currentStudent = doc['student_id']
	
	if currentStudent != lastStudent:

		try:
			result = grades.delete_one( { '_id' : toBeDeleted })
			print str(toBeDeleted)
		except Exception as e:
			print "error", type(e), e
		

	lastStudent = currentStudent
	toBeDeleted = doc['_id']

