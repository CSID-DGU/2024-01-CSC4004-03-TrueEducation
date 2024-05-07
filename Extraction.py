import cv2, os
import Preprocessing
from enum import IntEnum

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
    width = None
    height = None
    
    def __init__(self, path):
        pre = Preprocessing.Preprocessing(path)
        
        self.img, self.width, self.height = pre.get_standard_image()
        
        if pre.mode == Preprocessing.LIGHT:
            self.img = cv2.bitwise_not(self.img)
    
    # 각 일정의 테두리를 찾음
    def create_contours(self):
        gray = cv2.cvtColor(self.img, cv2.COLOR_BGR2GRAY)
        
        _, thresh = cv2.threshold(gray, 0, 255,  cv2.THRESH_BINARY | cv2.THRESH_OTSU)
        contours, _ = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        self.times = [x for x in contours if cv2.contourArea(x) > 1000]
        
        cv2.drawContours(self.img, self.times, -1, (0, 255, 0), 3)
        
    # 일정의 왼쪽 지점과 너비를 이용해 요일을 추출
    def get_day(self, start):
        temp = []
        
        for day in Week:
            temp.append(abs(start - self.width * day))
                
        return temp.index(min(temp))
                
    # 일정의 시작 시간과 종료 시간을 이용해 시간대를 추출
    time_list = [9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 14.5, 15, 15.5, 16, 16.5, 17, 17.5, 18, 18.5, 19, 19.5, 20, 20.5, 21, 21.5, 22, 22.5, 23]
    def get_time(self, start, end):
        start = start / self.height + 8.5
        end = end / self.height + 8.5
        
        start_list = [abs(start - time) for time in self.time_list]
        end_list = [abs(end - time) for time in self.time_list]
    
        start_time = self.time_list[start_list.index(min(start_list))]
        end_time = self.time_list[end_list.index(min(end_list))]
        
        start_time = int((start_time - 9) * 2)
        end_time = int((end_time - 9) * 2)
        
        temp = 0
        for i in range(len(self.time_list) - end_time, len(self.time_list) - start_time):
            temp |= 1 << i
        
        return temp
    
    # 각 일정을 이진화하여 시간대별로 분류
    def binarization(self):
        time_table = [[] for day in Week]
            
        for time in self.times:
            start = time[0][0]
            end = time[1][0]
            
            binary_time = self.get_time(start[1], end[1])
            
            time_table[self.get_day(start[0])].append(binary_time)
        
        return time_table
        
    def show(self):
        self.img = cv2.resize(self.img, dsize=(800, 1000), interpolation=cv2.INTER_AREA)
        cv2.imshow('Original', self.img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

if __name__ == '__main__':
    # 현재 파일의 디렉토리로 작업 디렉토리 변경
    os.chdir(os.path.dirname(os.path.abspath(__file__)))    
    imgs = os.listdir('img')
    
    schedule = Extraction('./img/' + imgs[0])

    schedule.create_contours()
    
    result = schedule.binarization()
    
    print(result)
    for i in result:
        temp = 0
        for j in i:
            print(format(j, '029b'))
            temp |= j
        print(format(temp, '029b'))
        print()
    
    schedule.show()
    
    # for img in imgs:
    #     schedule = Extraction(img)
    #     schedule.create_contours()
        
    #     schedule.show()