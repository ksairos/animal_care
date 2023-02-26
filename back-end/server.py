from flask import Flask, request, jsonify, make_response
from flask_cors import CORS, cross_origin # Comment during deployment
import torch
import cv2

image_folder = "back-end/static/img/"

app = Flask(__name__)
CORS(app) # Comment during deployment
app.config['CORS_HEADERS'] = 'Content-Type'

# load YOLO model
model = torch.hub.load('back-end/yolov5/', 'custom',
                       path='back-end/yolov5/runs/train/weights/best.pt', source='local')

def save_image(file):
    file.save(image_folder + file.filename)


@app.route('/', methods=["GET"])
@cross_origin()
def index():
    html = '''
        <div>Access Denied</div>
    '''
    return html

@app.route('/prediction', methods=["POST", "GET"])
def prediction():
    # save incoming images and load images
    if request.method == 'POST':
        file = request.files['myFile']
        save_image(file)
        train_img = image_folder + file.filename
        # make prediction using YOLOv5 model
        res = model(train_img)
        print("Model's Prediction: ", res)
        if str(res).split(" ")[4].split("\n")[0] == "good" or str(res).split(" ")[4].split("\n")[0] == "goods":
            result = "Good"
        else:
            result = "Bad"
        print(result)
        return {
            "statusCode": 500,
            "status" : "Prediction Made",
            "result" : result
        }
    
    # if request.method == 'GET':


    else:
        print("Something went wrong. Try again!")


if __name__ == '__main__':
    app.run(host="127.0.0.1", port=5000, debug=True)