# BeGoodSolutions_Task
Vehicle Registration Application

FrontEnd - Flutter
BackEnd - SpringBoot
DataBase - MySQL

CREATE Operation

	http://localhost:8080/register/
	method - POST
	body - {
		"ownerName": "",
        	"licensePlate": "",
        	"ownerNic": "",
        	"vehicalType": ""
		}

READ Operation

	http://localhost:8080/getAllDetails/
	Method - GET

UPDATE Operation

	http://localhost:8080/updateRegistration/
	method - PUT
	body - {
		"ownerName": "",
        	"licensePlate": "",
        	"ownerNic": "",
        	"vehicalType": ""
		}

DELETE Operation

	http://localhost:8080/deleteRegistration/
	method - DELETE
	body - {
		"ownerName": "",
        	"licensePlate": "",
        	"ownerNic": "",
        	"vehicalType": ""
		}

Check License Plate Type (return vintage, old, modern)

	http://localhost:8080/getType/
	method - POST
	body - {
		"licensePlateNumber":""
		}

Check License Plate Validation (return boolean)
	
	http://localhost:8080/validType/
	method - POST
	body - {
		"licensePlateNumber":""
		}