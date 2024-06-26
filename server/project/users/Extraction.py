import cv2
from enum import IntEnum
from collections import Counter

from users import Preprocessing
TIME = 29
PI = 3.141592653589793

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
        del pre    
        
        self.set_unit_height()
            
        self.create_contours()
        
    def __del__(self):
        del self.img
        del self.times
        del self.height
        
    def set_unit_height(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        
        edge = cv2.Canny(gray, 15, 40)
        
        lines = cv2.HoughLinesP(edge, 1, PI / 180, 280)
        
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
        
        self.height = min(cnt.most_common(10), key=lambda x: x[0])[0]
    
    # 각 일정의 테두리를 찾음
    def create_contours(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        
        _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        self.times = [x for x in contours if cv2.contourArea(x) > 10000]
        
        cv2.drawContours(self.img, self.times, -1, (0, 255, 0), 3)
        
        self.convexhull()
        
    def convexhull(self):
        for i in range(len(self.times)):
            hull = cv2.convexHull(self.times[i], clockwise=False)
            cv2.drawContours(self.img, [hull], 0, (0, 0, 255), 2)
            self.times[i] = hull
        
    # 일정의 왼쪽 지점과 너비를 이용해 요일을 추출
    def get_day(self, x, w):
        temp = []
        
        for day in Week:
            temp.append(abs(x - w * day))
                
        return temp.index(min(temp))
                
    # 일정의 시작 시간과 종료 시간을 이용해 시간대를 추출
    time_list = [9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 14.5, 15, 15.5, 16, 16.5, 17, 17.5, 18, 18.5, 19, 19.5, 20, 20.5, 21, 21.5, 22, 22.5, 23]
    def get_time(self, y, h):
        img_height = self.img.shape[0] / self.height
        timetable_length = int(img_height)
        error = (img_height - timetable_length) * self.height
        
        y = y - error
        start = y / self.height + 9
        end = h / self.height + start
        
        start_list = [abs(start - time) for time in self.time_list]
        end_list = [abs(end - time) for time in self.time_list]
        
        start_time = self.time_list[start_list.index(min(start_list))]
        end_time = self.time_list[end_list.index(min(end_list))]
        
        temp = 0
        for i in range(TIME - int((end_time - 9) * 2), TIME - int((start_time - 9) * 2)):
            temp |= 1 << i
            
        return temp
    
    # 각 일정을 이진화하여 시간대별로 분류
    def binarization(self):
        time_table = [[] for day in Week]
            
        for time in self.times:
            x, y, w, h = cv2.boundingRect(time)
            
            time_table[self.get_day(x, w)].append(self.get_time(y, h))
        
        return time_table