import numpy as np
import cv2
from PIL import Image

class Preprocessing:
    img = None
    gray = None
    thresh = None
    
    def __init__(self, path):
        self.img = np.array(Image.open(path))
        
        self.convert_image()
    
    # 이미지를 흑백으로 변환
    def convert_image(self):
        self.gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
    
    # 흑백 이미지에서 테두리를 찾고 가장 큰 테두리를 추출하여 기준 이미지로 설정
    def get_standard_image(self):
        _, thresh = cv2.threshold(self.gray, 30, 255, cv2.THRESH_BINARY)
        contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        cnts = sorted(contours, key = cv2.contourArea, reverse=True)

        x, y, w, h = cv2.boundingRect(cnts[0])
        _, _, width, height = cv2.boundingRect(cnts[1])
        
        return self.img[y:y+h, x:x+w], width, height