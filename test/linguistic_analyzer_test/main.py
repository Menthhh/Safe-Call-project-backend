import os
import sys

# Add the project root to Python's path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)

# Import the analyzer
from LinguisticAnalyzer import LinguisticAnalyzer

def test_word_detection():
    # Sample Thai paragraph to test
    paragraph = "สวัสดีครับคุณสมชาย ผมโทรมาจากฝ่ายบริการลูกค้าของธนาคาร [ชื่อธนาคารปลอม] ครับ เรากำลังทำการอัปเดตข้อมูลระบบใหม่และจำเป็นต้องตรวจสอบข้อมูลของลูกค้าทุกท่านเพื่อความปลอดภัยของบัญชีของคุณ คุณสามารถช่วยยืนยันข้อมูลส่วนตัวบางประการให้เราหน่อยได้ไหมครับ เช่น เลขบัตรประชาชน, เลขที่บัญชีธนาคาร, และรหัสผ่าน เพื่อให้เราสามารถอัปเดตข้อมูลให้เสร็จสิ้น และเพื่อป้องกันการถูกแฮกหรือการเข้าถึงบัญชีโดยไม่ได้รับอนุญาต หากคุณไม่ยืนยันข้อมูลวันนี้ เราจะไม่สามารถดำเนินการอัปเดตข้อมูลให้เสร็จสิ้นได้ครับ เพื่อความปลอดภัยของคุณเอง กรุณาบอกข้อมูลตามที่เราต้องการภายใน 24 ชั่วโมงนะครับ"

    # Initialize the LinguisticAnalyzer with the paragraph
    analyzer = LinguisticAnalyzer(paragraph=paragraph)
    results = analyzer.apply_rules()
    
    print("Test results:")
    print(results)
if __name__ == "__main__":
    test_word_detection()
