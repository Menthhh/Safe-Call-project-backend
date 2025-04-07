import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)
from ThaiTextProcessor import ThaiTextProcessor

def main():
    # สร้าง processor
    processor = ThaiTextProcessor(word_engine="newmm")
    
    # ตัวอย่างการตัดประโยคและตัดคำจากข้อความที่ถอดจาก transcriber (คำติดกัน ไม่มีเครื่องหมาย)
    paragraph = """ทางกฎหมาย"""
    
    # ประมวลผลข้อความ
    result = processor.process_paragraph(paragraph)

    print(result)
    
    # แสดงผลลัพธ์

if __name__ == "__main__":
    main()
 
    