import sqlite3
import json

conn = sqlite3.connect('./persistenceDB')
c = conn.cursor()

results = c.execute("SELECT Type, Json, Name FROM elements WHERE elements.Type!='icon' AND elements.Type!='activity' AND elements.Type!='group'")
for row in results:
	elementType, elementJson, elementName = row
	elementJsonObj = json.loads(elementJson)
	print "Name: " + str(elementName) + " Type: " + str(elementType) + "\n"
	print json.dumps(elementJsonObj, indent=4)
	print "-------------------------------------------------------------------------------------\n\n"