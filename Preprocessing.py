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
    
    def __del__(self):
        del self.img
        del self.gray
        del self.thresh
    
    # 이미지를 흑백으로 변환
    def convert_image(self):
        # 이미지의 평균 픽셀값이 125보다 크면(dark모드가 아니라면) 흰색을 검정색으로 변환ㄴ
        if np.mean(cv2.mean(self.img)) > 125:
            # 흰색 영역을 정의
            lower_white = np.array([250, 250, 250])
            upper_white = np.array([255, 255, 255])
            
            # hsv 색 공간에서 흰색이 아닌 영역만 추출
            mask = cv2.inRange(self.img, lower_white, upper_white)
            
            res = cv2.bitwise_not(self.img, self.img, mask=mask)
            
            lower_gary = np.array([135, 135, 135])
            upper_white = np.array([255, 255, 255])
            
            mask = cv2.inRange(res, lower_gary, upper_white)
            
            res[mask>=135] = (39, 39, 39)
            
            self.img = res
        
        self.gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
    
    # 흑백 이미지에서 테두리를 찾고 가장 큰 테두리를 추출하여 기준 이미지로 설정
    def get_standard_image(self):
        _, thresh = cv2.threshold(self.gray, 30, 255, cv2.THRESH_BINARY)
        contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        sorted_contours = sorted(contours, key = cv2.contourArea, reverse=True)

        x, y, w, h = cv2.boundingRect(sorted_contours[0])
        
        return self.img[y:y+h, x:x+w]