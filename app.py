from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
import pandas as pd
import joblib


app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

@app.route("/")
def home():
    html = "<h3>Credit Card Fraud Detection Home</h3>"
    return html.format(format)

@app.route("/predict", methods=['POST'])
def predict():
    """Performs an sklearn prediction

    input looks like:
    {
    "Time": {
        "0": 0.8266309519613717
    },
    "V1": {
        "0": -0.512348993642627
    },
    "V2": {
        "0": 4.82706041999945
    },
    "V3": {
        "0": -7.97393924909553
    },
    "V4": {
        "0": 7.3340585164719
    },
    "V5": {
        "0": 0.367703644775346
    },
    "V6": {
        "0": -2.0551290853684
    },
    "V7": {
        "0": -2.93585569967936
    },
    "V8": {
        "0": 1.43100813095171
    },
    "V9": {
        "0": -4.54472224374179
    },
    "V10": {
        "0": -5.25809597551632
    },
    "V11": {
        "0": 5.71631869503674
    },
    "V12": {
        "0": -5.81040712597652
    },
    "V13": {
        "0": 0.723292646283101
    },
    "V14": {
        "0": -12.2891333850899
    },
    "V15": {
        "0": 0.378773196301938
    },
    "V16": {
        "0": -2.02073438121173
    },
    "V17": {
        "0": -2.03970261739192
    },
    "V18": {
        "0": 0.658182927257658
    },
    "V19": {
        "0": 0.832574035012694
    },
    "V20": {
        "0": 0.804101330337598
    },
    "V21": {
        "0": 0.535619750720892
    },
    "V22": {
        "0": -0.459495920284509
    },
    "V23": {
        "0": -0.0093636678425974
    },
    "V24": {
        "0": -1.1404357941897
    },
    "V25": {
        "0": -0.0064452687432379
    },
    "V26": {
        "0": 0.527970329614587
    },
    "V27": {
        "0": 0.55888099608345
    },
    "V28": {
        "0": 0.126516761960086
    },
    "Amount": {
        "0": -0.29665339202123947
    }
    }

    result looks like:
    { "prediction": [ 1 ] }

    """

    try:
        clf = joblib.load("model.joblib")
    except:
        LOG.info("JSON payload: %s json_payload")
        return "Model not loaded"

    json_payload = request.json
    LOG.info("JSON payload: %s json_payload")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info("inference payload DataFrame: %s inference_payload")
    prediction = list(clf.predict(inference_payload))
    prediction = [int(x) for x in prediction]
    return jsonify({'prediction': prediction})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
