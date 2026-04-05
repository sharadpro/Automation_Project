from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)

# MongoDB Atlas connection string
MONGO_URI = "mongodb+srv://sharadsingh0727_db_user:<password_needto_enter>@devopstestmongo.whcsabq.mongodb.net/?appName=DevopsTestMongo"

client = MongoClient(MONGO_URI)
db = client["test_db"]
collection = db["users"]

@app.route('/')
def index():
    return render_template('form.html')

@app.route('/submit', methods=['POST'])
def submit():
    try:
        name = request.form.get('name')
        email = request.form.get('email')

        if not name or not email:
            return render_template('form.html', error="All fields are required")

        # Insert into MongoDB
        collection.insert_one({
            "name": name,
            "email": email
        })

        return redirect(url_for('success'))

    except Exception as e:
        return render_template('form.html', error=str(e))

@app.route('/success')
def success():
    return render_template('success.html')

if __name__ == '__main__':
    app.run(debug=True)