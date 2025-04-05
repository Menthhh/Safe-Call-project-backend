import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)
from ThaiTextProcessor import ThaiTextProcessor

def main():
    # สร้าง processor
    processor = ThaiTextProcessor(word_engine="newmm")
    
    # ตัวอย่างการตัดประโยคและตัดคำจากข้อความที่ถอดจาก transcriber (คำติดกัน ไม่มีเครื่องหมาย)
    paragraph = """สวัสดีครับผมชื่อสมชายจากฝ่ายความปลอดภัยธนาคารกรุงไทยใช่คุณสมศรีไหมครับทางธนาคารตรวจพบรายการเคลื่อนไหวที่ผิดปกติในบัญชีของคุณครับมีการทำธุรกรรมโอนเงินไปต่างประเทศจำนวน156000บาทเมื่อเวลา1120น วันนี้คุณทำรายการนี้หรือเปล่าครับผมเข้าใจครับในกรณีนี้เราต้องดำเนินการแก้ไขด่วนก่อนที่เงินจะถูกถอนออกทั้งหมด"""
    
    # ประมวลผลข้อความ
    result = processor.process_paragraph(paragraph)
    
    # แสดงผลลัพธ์
    print("ผลลัพธ์การแบ่งประโยคและตัดคำ:")
    for i, sentence in enumerate(result):
        print(f"ประโยคที่ {i+1}: {sentence}")


if __name__ == "__main__":
    main()
 
    