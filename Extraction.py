import cv2, os
import Preprocessing
from enum import IntEnum
import numpy as np
import pickle
from collections import Counter

class Week(IntEnum):
    MONDAY = 0
    TUESDAY = 1
    WEDNESDAY = 2
    THURSDAY = 3
    FRIDAY = 4
    SATURDAY = 5
    SUNDAY = 6

class Extraction:
    img = None
    times = None
    height = None
    
    def __init__(self, path):
        pre = Preprocessing.Preprocessing(path)
        
        self.img = pre.get_standard_image()
        
        cv2.imwrite('./result/ROI.jpg', self.img)
            
        self.set_unit_height()
            
        self.create_contours()
        
    def __del__(self):
        del self.img
        del self.times
        del self.height
        
    def set_unit_height(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        
        edge = cv2.Canny(gray, 15, 40)
        cv2.imwrite('./result/Frame-Edge.jpg', edge)
        
        lines = cv2.HoughLinesP(edge, 1, np.pi / 180, 280)
        
        for line in lines:
            x1, y1, x2, y2 = line[0]
            if (x1 == x2):
                del line
                continue
            cv2.line(self.img, (x1, y1), (x2, y2), (0, 255, 0), 2)
        
        dst = []
        for line1 in lines:
            for line2 in lines:
                if line1 is line2:
                    continue
                _, y1, _, _ = line1[0]
                _, y3, _, _ = line2[0]
                if abs(y1 - y3) <= 100:
                    del line2
                    continue
                dst.append(abs(y1 - y3))
        cnt = Counter(dst)
        
        self.height = cnt.most_common(1)[0][0]
    
    # 각 일정의 테두리를 찾음
    def create_contours(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        cv2.imwrite('./result/ROI-Gray.jpg', gray)
        
        _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
        cv2.imwrite('./result/ROI-Thresh.jpg', thresh)

        self.times = [x for x in contours if cv2.contourArea(x) > 10000]
        
        cv2.drawContours(self.img, self.times, -1, (0, 255, 0), 3)
        cv2.imwrite('./result/Contour.jpg', self.img)
        
        self.convexhull()
        
    def convexhull(self):
        for i in range(len(self.times)):
            hull = cv2.convexHull(self.times[i], clockwise=False)
            cv2.drawContours(self.img, [hull], 0, (0, 0, 255), 2)
            self.times[i] = hull
                
        cv2.imwrite('./result/ConvexHull.jpg', self.img)
        
    # 일정의 왼쪽 지점과 너비를 이용해 요일을 추출
    def get_day(self, x, w):
        temp = []
        
        for day in Week:
            temp.append(abs(x - w * day))
                
        return temp.index(min(temp))
                
    # 일정의 시작 시간과 종료 시간을 이용해 시간대를 추출
    def get_time(self, y, h):
        img_height = self.img.shape[0] / self.height
        timetable_length = int(img_height)
        error = (img_height - timetable_length) * self.height
        
        y = y - error
        time_length = int((h / self.height) * 2)
        start_time = y / self.height
        
        for i in range():
        
    
    # 각 일정을 이진화하여 시간대별로 분류
    def binarization(self):
        time_table = [[] for day in Week]
            
        for time in self.times:
            x, y, w, h = cv2.boundingRect(time)
            
            binary_time = self.get_time(y, h)
            
            time_table[self.get_day(x, w)].append(binary_time)
        
        return time_table
        
if __name__ == '__main__':
    # 현재 파일의 디렉토리로 작업 디렉토리 변경
    os.chdir(os.path.dirname(os.path.abspath(__file__)))    
    imgs = os.listdir('img')
    
    schedule = Extraction('./img/' + imgs[6])
    
    result = schedule.binarization()
    
    print('----------------------\n')
    for i in result:
        print(i)
    print()
        
    for i in result:
        temp = 0
        for j in i:
            print(format(j, '029b'))
            temp |= j
        print(format(temp, '029b'))
        print()
        
    serialized = pickle.dumps(result)
    print(serialized)
    print(pickle.loads(serialized))