from flask import Flask, request, jsonify
from pymongo import MongoClient

app = Flask(__name__)

MONGO_URI = "mongodb+srv://sharadsingh0727_db_user:<password_needto_enter>@devopstestmongo.whcsabq.mongodb.net/?appName=DevopsTestMongo"

client = MongoClient(MONGO_URI)
db = client["todo_db"]
collection = db["items"]

@app.route('/submittodoitem', methods=['POST'])
def submit_todo():
    data = request.form

    item = {
        "itemName": data.get("itemName"),
        "itemDescription": data.get("itemDescription")
    }

    collection.insert_one(item)

    return jsonify({"message": "Item saved successfully"}), 201

if __name__ == '__main__':
    app.run(debug=True)