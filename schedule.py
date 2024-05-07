import numpy as np
import cv2, os
from PIL import Image

class Preprocessing:
    img = None
    gray = None
    thresh = None
    
    def __init__(self, path):
        self.img = np.array(Image.open('./img/' + path))
        
        self.convert_image()
    
    # 이미지를 흑백으로 변환
    def convert_image(self):
        self.gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
    
    # 흑백 이미지에서 테두리를 찾고 가장 큰 테두리를 추출하여 기준 이미지로 설정
    def get_standard_image(self):
        _, thresh = cv2.threshold(self.gray, 30, 255, cv2.THRESH_BINARY)
        contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        cnts = sorted(contours, key = cv2.contourArea, reverse=True)

        print(cnts)

        x, y, w, h = cv2.boundingRect(cnts[0])
        _, _, width, height = cv2.boundingRect(cnts[1])
        
        return self.img[y:y+h, x:x+w], width, height

class Extraction:
    img = None
    width = None
    height = None
    times = None
    
    def __init__(self, path):
        pre = Preprocessing(path)
        
        self.img, self.width, self.height = pre.get_standard_image()
    
    # 각 일정의 테두리를 찾음
    def create_contours(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        
        _, thresh = cv2.threshold(gray, -1, 255,  cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        contours, _ = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        self.times = [x for x in contours if cv2.contourArea(x) > 1000]

        cv2.drawContours(self.img, self.times, -1, (0, 255, 0), 3)
        
    # 각 일정을 이진화하여 시간대별로 분류
    def binarization(self):
        pass
        
    def show(self):
        cv2.imshow('Original', self.img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

if __name__ == '__main__':
    # 현재 파일의 디렉토리로 작업 디렉토리 변경
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    imgs = os.listdir('img')
    
    schedule = Extraction(imgs[0])
    schedule.create_contours()
    
    schedule.show()
    
    # for img in imgs:
    #     schedule = Extraction(img)
    #     schedule.create_contours()
        
    #     schedule.show()
