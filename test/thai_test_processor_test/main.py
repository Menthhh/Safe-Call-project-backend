import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)
from ThaiTextProcessor import ThaiTextProcessor

def main():
    # สร้าง processor
    processor = ThaiTextProcessor(word_engine="newmm")
    
    # ตัวอย่างการตัดประโยคและตัดคำจากข้อความที่ถอดจาก transcriber (คำติดกัน ไม่มีเครื่องหมาย)
    paragraph = """ขึ้นเลยครับพี่ ไปทางไหนนะ? …อ๋อ เส้นนั้นวันนี้รถติดมากเลยนะครับ ผมว่าไปทางลัดดีกว่า แต่ต้องเสียค่าทางด่วนนิดหน่อยนะครับ… เอาจริงๆ ผมก็ไม่ได้อยากเก็บเพิ่มหรอก แต่เดี๋ยวนี้น้ำมันก็แพง ทางก็อ้อม รถก็ติด ขับรถทั้งวันแทบไม่ได้อะไรเลย… พี่โชคดีนะ เจอผมเนี่ยยังใจดี เดี๋ยวผมขับให้เร็วที่สุดเลย… ถึงแล้วครับพี่ ทั้งหมด 380 บาทนะครับ รวมค่าทางด่วน ค่าน้ำมัน แล้วก็ค่าหมุนรถอ้อมเส้นรถติดให้ด้วย ผมคิดไม่แพงหรอกพี่ เชื่อผมเถอะ"""
    
    # ประมวลผลข้อความ
    result = processor.process_paragraph(paragraph)

    print(result)
    
    # แสดงผลลัพธ์

if __name__ == "__main__":
    main()
 
    