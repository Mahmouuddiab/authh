from flask import Flask, request, jsonify
import requests
import pickle

app = Flask(__name__)

# Load your AI model
with open('model.pkl', 'rb') as f:
    model = pickle.load(f)

WEATHER_API_KEY = '0045fad517524e2880801243251307'
WEATHER_API_URL = 'https://api.weatherapi.com/v1/current.json'

@app.route('/predict', methods=['GET'])
def predict():
    city = request.args.get('city', 'Cairo')

    # Fetch weather data
    weather_res = requests.get(WEATHER_API_URL, params={'key': WEATHER_API_KEY, 'q': city})
    data = weather_res.json()

    # Extract features for model (example: temp, humidity, wind speed)
    temp = data['current']['temp_c']
    humidity = data['current']['humidity']
    wind_kph = data['current']['wind_kph']

    # Predict using model
    features = [[temp, humidity, wind_kph]]  # Adjust based on your model input
    prediction = model.predict(features)[0]

    return jsonify({
        'city': city,
        'input': {'temp': temp, 'humidity': humidity, 'wind_kph': wind_kph},
        'prediction': prediction
    })

if __name__ == '__main__':
    app.run(debug=True)
