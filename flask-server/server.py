from flask import Flask, request, jsonify, make_response
from flask_restx import Api, Resource, fields
# from flask_cors import CORS, cross_origin # Comment during deployment
import numpy as np
import joblib
import os

flask_app = Flask(__name__)
# CORS(app) # Comment during deployment
app = Api(app=flask_app,
          version='1.0',
          title='Machine Learning React app',
          description='Predicting using trained ML model')

name_space = app.namespace('prediction', description='Prediction APIs')

model = app.model('Prediction params', 
				  {'textField1': fields.String(required = True, 
				  							   description="Text Field 1", 
    					  				 	   help="Text Field 1 cannot be blank"),
				  'textField2': fields.String(required = True, 
				  							   description="Text Field 2", 
    					  				 	   help="Text Field 2 cannot be blank"),
				  'select1': fields.Integer(required = True, 
				  							description="Select 1", 
    					  				 	help="Select 1 cannot be blank"),
				  'select2': fields.Integer(required = True, 
				  							description="Select 2", 
    					  				 	help="Select 2 cannot be blank"),
				  'select3': fields.Integer(required = True, 
				  							description="Select 3", 
    					  				 	help="Select 3 cannot be blank")})


classifier = joblib.load('flask-server/classifier.joblib')

# Members API route
@name_space.route("/")
class MainClass(Resource):

    def options(self):
        response = make_response()
        response.headers.add("Access-Control-Allow-Origin", "*")
        response.headers.add('Access-Control-Allow-Headers', "*")
        response.headers.add('Access-Control-Allow-Methods', "*")
        return response

    @app.expect(model)
    def post(self):
        try: 
            formData = request.json
            data = [val for val in formData.values()]
            prediction = classifier.predict(np.array(data).reshape(1, -1))
            types = { 0: "Iris Setosa", 1: "Iris Versicolour ", 2: "Iris Virginica"}
            response = jsonify({
                "statusCode": 200,
                "status": "Prediction made",
                "result": "The type of iris plant is: " + types[prediction[0]]
                })
            response.headers.add('Access-Control-Allow-Origin', '*')
            return response
            
        except Exception as error:
            return jsonify({
                "statusCode": 500,
                "status": "Could not make prediction",
                "error": str(error)
            })