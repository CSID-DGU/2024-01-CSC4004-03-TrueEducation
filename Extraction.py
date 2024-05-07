import cv2, os
import Preprocessing

class Extraction:
    img = None
    width = None
    height = None
    times = None
    
    def __init__(self, path):
        pre = Preprocessing.Preprocessing(path)
        
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