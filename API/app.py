from flask import jsonify,Flask,request
from flask_restful import Resource, Api
import pymysql
import pymysql.cursors

#Instantiate the flask application
app = Flask(__name__)

#Creating an instance of Api class and associate it with the flask app
api = Api(app)

#Create get_connection(). Have it return connection object

def get_connection():
    connection = pymysql.connect(host = 'localhost', database = 'build_me', password = '', user = 'root')

    return connection

class login(Resource):
    def post(self):
        try:
            data = request.json
            email = data['email']
            password = data['password']
            
            connection = get_connection()
            
            cursor = connection.cursor(pymysql.cursors.DictCursor)
            sql = "SELECT email FROM genusers WHERE email = %s AND password = %s"
            cursor.execute(sql, (email, password))
            
            if cursor.rowcount == 0:
                return 'User not found'
            else:
                return 'Log in successful'
        except Exception as e:
            return 'error'
api.add_resource(login, '/login')

class signup(Resource):
    def post(self):
        try:
            data = request.json
            fname = data['fname']
            lname = data['lname']
            email = data['email']
            password = data['password']
            phone = data['phone']
            
            connection = get_connection()
            
            cursor = connection.cursor()
            
            sql = 'INSERT INTO genusers(fname, lname, email, password, phone) VALUES(%s,%s,%s,%s,%s)'
            cursor.execute(sql, (fname,lname, email, password, phone))
            connection.commit()
            
            
            
            return 'User created successfully'
        
        except Exception as e:
            return str(e)
        
api.add_resource(signup, '/signup')   

app.run(debug=True, host="0.0.0.0")
        
            
            
            
            
