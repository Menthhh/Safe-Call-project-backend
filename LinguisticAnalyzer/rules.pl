:- encoding(utf8).

% =============== PATTERN DEFINITIONS ===============

:- discontiguous pattern/3.

% =============== AUTHORITY CLAIM PATTERNS ===============
pattern(authority_claim, 'ผมเป็นเจ้าหน้าที่ธนาคาร', ['ผม', 'เป็น', 'เจ้าหน้าที่', 'ธนาคาร']).
pattern(authority_claim, 'ดิฉันจากธนาคารกรุงไทย', ['ดิฉัน', 'จาก', 'ธนาคาร', 'กรุงไทย']).
pattern(authority_claim, 'ผมมาจากศาล', ['ผม', 'มา', 'จาก', 'ศาล']).
pattern(authority_claim, 'กระผมมาจากกรมสรรพากร', ['กระผม', 'มา', 'จาก', 'กรม', 'สรรพากร']).
pattern(authority_claim, 'เราทำงานที่ธนาคาร', ['เรา', 'ทำงาน', 'ที่', 'ธนาคาร']).
pattern(authority_claim, 'ทางเราเป็นเจ้าหน้าที่ตำรวจ', ['ทาง', 'เรา', 'เป็น', 'เจ้าหน้าที่', 'ตำรวจ']).
pattern(authority_claim, 'ข้าพเจ้าเป็นผู้จัดการธนาคาร', ['ข้าพเจ้า', 'เป็น', 'ผู้จัดการ', 'ธนาคาร']).
pattern(authority_claim, 'ผมเป็นตัวแทนจากกระทรวง', ['ผม', 'เป็น', 'ตัวแทน', 'จาก', 'กระทรวง']).
pattern(authority_claim, 'ดิฉันในฐานะพนักงานธนาคาร', ['ดิฉัน', 'ใน', 'ฐานะ', 'พนักงาน', 'ธนาคาร']).
pattern(authority_claim, 'โทรมาจากกรมสรรพากร', ['โทร', 'มา', 'จาก', 'กรม', 'สรรพากร']).

% =============== URGENCY INDICATOR PATTERNS ===============
pattern(urgency_claim, 'ด่วน', ['ด่วน']).
pattern(urgency_claim, 'ทันที', ['ทันที']).
pattern(urgency_claim, 'เร่งด่วน', ['เร่งด่วน']).
pattern(urgency_claim, 'ภายใน24ชั่วโมง', ['ภายใน', '24', 'ชั่วโมง']).
pattern(urgency_claim, 'จะถูกระงับ', ['จะ', 'ถูก', 'ระงับ']).
pattern(urgency_claim, 'รีบ', ['รีบ']).
pattern(urgency_claim, 'วันนี้', ['วัน', 'นี้']).
pattern(urgency_claim, 'พรุ่งนี้', ['พรุ่งนี้']).
pattern(urgency_claim, 'ถูกปิดบัญชี', ['ถูก', 'ปิด', 'บัญชี']).
pattern(urgency_claim, 'ตอบกลับเร็ว', ['ตอบ', 'กลับ', 'เร็ว']).
pattern(urgency_claim, 'ล่าช้า', ['ล่าช้า']).
pattern(urgency_claim, 'เสี่ยง', ['เสี่ยง']).
pattern(urgency_claim, 'โอกาสสุดท้าย', ['โอกาส', 'สุดท้าย']).
pattern(urgency_claim, 'โดยเร็ว', ['โดย', 'เร็ว']).
pattern(urgency_claim, 'เร่ง', ['เร่ง']).
pattern(urgency_claim, 'ด่วนที่สุด', ['ด่วน', 'ที่สุด']).
pattern(urgency_claim, 'ต้องทำทันที', ['ต้อง', 'ทำ', 'ทันที']).
pattern(urgency_claim, 'ติดต่อกลับภายใน24ชั่วโมง', ['ติดต่อ', 'กลับ', 'ภายใน', '24', 'ชั่วโมง']).
pattern(urgency_claim, 'หากไม่ดำเนินการจะถูกระงับ', ['หาก', 'ไม่', 'ดำเนินการ', 'จะ', 'ถูก', 'ระงับ']).
pattern(urgency_claim, 'รีบดำเนินการ', ['รีบ', 'ดำเนินการ']).
pattern(urgency_claim, 'ภายในวันนี้', ['ภายใน', 'วัน', 'นี้']).
pattern(urgency_claim, 'ไม่เช่นนั้นจะถูกปิดบัญชี', ['ไม่', 'เช่นนั้น', 'จะ', 'ถูก', 'ปิด', 'บัญชี']).
pattern(urgency_claim, 'ตอบกลับทันที', ['ตอบ', 'กลับ', 'ทันที']).
pattern(urgency_claim, 'เสี่ยงต่อการถูกระงับบัญชี', ['เสี่ยง', 'ต่อ', 'การ', 'ถูก', 'ระงับ', 'บัญชี']).
pattern(urgency_claim, 'โปรดติดต่อด่วน', ['โปรด', 'ติดต่อ', 'ด่วน']).
pattern(urgency_claim, 'กรุณาดำเนินการโดยเร็วที่สุด', ['กรุณา', 'ดำเนินการ', 'โดย', 'เร็ว', 'ที่สุด']).
pattern(urgency_claim, 'เร่งด่วน', ['เร่ง', 'ด่วน']).

% =============== INFORMATION REQUEST PATTERNS ===============
pattern(info_request, 'ข้อมูลส่วนตัว', ['ข้อมูล', 'ส่วนตัว']).
pattern(info_request, 'ข้อมูลบัตร', ['ข้อมูล', 'บัตร']).
pattern(info_request, 'บัตรเครดิต', ['บัตร', 'เครดิต']).
pattern(info_request, 'ข้อมูลบัญชี', ['ข้อมูล', 'บัญชี']).
pattern(info_request, 'รหัสผ่าน', ['รหัส', 'ผ่าน']).
pattern(info_request, 'เบอร์โทร', ['เบอร์', 'โทร']).
pattern(info_request, 'ชื่อเต็ม', ['ชื่อ', 'เต็ม']).
pattern(info_request, 'บัตรประชาชน', ['บัตร', 'ประชาชน']).
pattern(info_request, 'เลขบัตร', ['เลข', 'บัตร']).
pattern(info_request, 'ยืนยันบัญชี', ['ยืนยัน', 'บัญชี']).
pattern(info_request, 'รหัสOTP', ['รหัส', 'OTP']).
pattern(info_request, 'รหัสพิน', ['รหัส', 'พิน']).
pattern(info_request, 'รหัสบัตร', ['รหัส', 'บัตร']).
pattern(info_request, 'วันหมดอายุ', ['วัน', 'หมดอายุ']).
pattern(info_request, 'เลขหลังบัตร', ['เลข', 'หลัง', 'บัตร']).
pattern(info_request, 'รหัสความปลอดภัย', ['รหัส', 'ความ', 'ปลอดภัย']).
pattern(info_request, 'กรุณาส่งข้อมูลส่วนตัว', ['กรุณา', 'ส่ง', 'ข้อมูล', 'ส่วนตัว']).
pattern(info_request, 'ยืนยันหมายเลขบัตรเครดิต', ['ยืนยัน', 'หมายเลข', 'บัตร', 'เครดิต']).
pattern(info_request, 'แจ้งข้อมูลบัญชี', ['แจ้ง', 'ข้อมูล', 'บัญชี']).
pattern(info_request, 'กรุณากรอกรหัสผ่าน', ['กรุณา', 'กรอก', 'รหัส', 'ผ่าน']).
pattern(info_request, 'โปรดส่งเบอร์โทรศัพท์', ['โปรด', 'ส่ง', 'เบอร์', 'โทรศัพท์']).
pattern(info_request, 'ขอทราบชื่อเต็ม', ['ขอ', 'ทราบ', 'ชื่อ', 'เต็ม']).
pattern(info_request, 'ต้องการข้อมูลบัตรประชาชน', ['ต้องการ', 'ข้อมูล', 'บัตร', 'ประชาชน']).
pattern(info_request, 'ให้ข้อมูลบัญชี', ['ให้', 'ข้อมูล', 'บัญชี']).
pattern(info_request, 'กรุณาตอบอีเมล', ['กรุณา', 'ตอบ', 'อีเมล']).
pattern(info_request, 'ช่วยยืนยันรหัสOTP', ['ช่วย', 'ยืนยัน', 'รหัส', 'OTP']).
pattern(info_request, 'กรุณาส่งรหัสพิน', ['กรุณา', 'ส่ง', 'รหัส', 'พิน']).
pattern(info_request, 'แจ้งวันหมดอายุ', ['แจ้ง', 'วัน', 'หมดอายุ']).

% =============== TRANSACTION REQUEST PATTERNS ===============
% Single word patterns for transaction request
pattern(transaction_request, 'โอน', ['โอน']).
pattern(transaction_request, 'โอนเงิน', ['โอน', 'เงิน']).
pattern(transaction_request, 'จ่าย', ['จ่าย']).
pattern(transaction_request, 'จ่ายเงิน', ['จ่าย', 'เงิน']).
pattern(transaction_request, 'ซื้อ', ['ซื้อ']).
pattern(transaction_request, 'ซื้อให้', ['ซื้อ', 'ให้']).
pattern(transaction_request, 'เติม', ['เติม']).
pattern(transaction_request, 'เติมเงิน', ['เติม', 'เงิน']).
pattern(transaction_request, 'ส่งเงิน', ['ส่ง', 'เงิน']).
pattern(transaction_request, 'ช่วยโอน', ['ช่วย', 'โอน']).
pattern(transaction_request, 'ธุรกรรม', ['ธุรกรรม']).
pattern(transaction_request, 'บัตรของขวัญ', ['บัตร', 'ของขวัญ']).
pattern(transaction_request, 'บัตรเติมเงิน', ['บัตร', 'เติมเงิน']).
pattern(transaction_request, 'เงินด่วน', ['เงิน', 'ด่วน']).
pattern(transaction_request, 'ชำระเงิน', ['ชำระ', 'เงิน']).
pattern(transaction_request, 'โอนเงินให้ด่วน', ['โอน', 'เงิน', 'ให้', 'ด่วน']).
pattern(transaction_request, 'ช่วยโอนเงินทันที', ['ช่วย', 'โอน', 'เงิน', 'ทันที']).
pattern(transaction_request, 'กรุณาส่งรหัสบัตรด่วน', ['กรุณา', 'ส่ง', 'รหัส', 'บัตร', 'ด่วน']).
pattern(transaction_request, 'ซื้อบัตรของขวัญให้ด่วน', ['ซื้อ', 'บัตร', 'ของขวัญ', 'ให้', 'ด่วน']).
pattern(transaction_request, 'ต้องการให้เติมเงินทันที', ['ต้องการ', 'ให้', 'เติมเงิน', 'ทันที']).
pattern(transaction_request, 'ต้องการโอนเงินด่วน', ['ต้องการ', 'โอน', 'เงิน', 'ด่วน']).
pattern(transaction_request, 'ส่งบัตรไอทีให้ทันที', ['ส่ง', 'บัตร', 'ไอที', 'ให้', 'ทันที']).
pattern(transaction_request, 'ช่วยซื้อบัตรสตรีมด่วน', ['ช่วย', 'ซื้อ', 'บัตร', 'สตรีม', 'ด่วน']).
pattern(transaction_request, 'การทำธุรกรรมด่วนโอนเงิน', ['การ', 'ทำธุรกรรม', 'ด่วน', 'โอน', 'เงิน']).

% =============== THREAT PATTERNS ===============
pattern(threat_claim, 'ฟ้องร้อง', ['ฟ้องร้อง']).
pattern(threat_claim, 'ดำเนินคดี', ['ดำเนินคดี']).
pattern(threat_claim, 'ระงับบัญชี', ['ระงับ', 'บัญชี']).
pattern(threat_claim, 'อายัด', ['อายัด']).
pattern(threat_claim, 'ปิดบัญชี', ['ปิด', 'บัญชี']).
pattern(threat_claim, 'ทำร้าย', ['ทำร้าย']).
pattern(threat_claim, 'คุกคาม', ['คุกคาม']).
pattern(threat_claim, 'แจ้งความ', ['แจ้งความ']).
pattern(threat_claim, 'กฎหมาย', ['กฎหมาย']).
pattern(threat_claim, 'ปรับ', ['ปรับ']).
pattern(threat_claim, 'ถูกจับ', ['ถูก', 'จับ']).
pattern(threat_claim, 'ติดคุก', ['ติด', 'คุก']).
pattern(threat_claim, 'สูญเสีย', ['สูญเสีย']).
pattern(threat_claim, 'ยึดทรัพย์', ['ยึด', 'ทรัพย์']).
pattern(threat_claim, 'อันตราย', ['อันตราย']).
pattern(threat_claim, 'เดือดร้อน', ['เดือดร้อน']).
pattern(threat_claim, 'หากไม่ทำตามจะถูกฟ้องร้อง', ['หาก', 'ไม่', 'ทำตาม', 'จะ', 'ถูก', 'ฟ้องร้อง']).
pattern(threat_claim, 'จะถูกดำเนินคดี', ['จะ', 'ถูก', 'ดำเนินคดี']).
pattern(threat_claim, 'จะถูกระงับบัญชี', ['จะ', 'ถูก', 'ระงับ', 'บัญชี']).
pattern(threat_claim, 'บัญชีจะถูกอายัด', ['บัญชี', 'จะ', 'ถูก', 'อายัด']).
pattern(threat_claim, 'เสี่ยงต่อการถูกปิดบัญชี', ['เสี่ยง', 'ต่อ', 'การ', 'ถูก', 'ปิด', 'บัญชี']).
pattern(threat_claim, 'จะถูกทำร้าย', ['จะ', 'ถูก', 'ทำร้าย']).
pattern(threat_claim, 'จะมีคนมาคุกคาม', ['จะ', 'มี', 'คน', 'มา', 'คุกคาม']).
pattern(threat_claim, 'จะแจ้งความ', ['จะ', 'แจ้งความ']).
pattern(threat_claim, 'มีโทษทางกฎหมาย', ['มี', 'โทษ', 'ทาง', 'กฎหมาย']).
pattern(threat_claim, 'จะถูกปรับ', ['จะ', 'ถูก', 'ปรับ']).
pattern(threat_claim, 'อาจถูกจับ', ['อาจ', 'ถูก', 'จับ']).
pattern(threat_claim, 'อาจติดคุก', ['อาจ', 'ติด', 'คุก']).
pattern(threat_claim, 'จะสูญเสียทรัพย์สิน', ['จะ', 'สูญ', 'เสีย', 'ทรัพย์สิน']).
pattern(threat_claim, 'เสี่ยงต่อการถูกยึดทรัพย์', ['เสี่ยง', 'ต่อ', 'การ', 'ถูก', 'ยึด', 'ทรัพย์']).
pattern(threat_claim, 'อันตรายต่อความปลอดภัย', ['อันตราย', 'ต่อ', 'ความ', 'ปลอดภัย']).

% =============== VERIFICATION RESISTANCE PATTERNS ===============
% Verification resistance patterns - simplified
pattern(verification_resistance, 'ไม่ต้องยืนยัน', ['ไม่', 'ต้อง', 'ยืนยัน']).
pattern(verification_resistance, 'ไม่ต้องตรวจสอบ', ['ไม่', 'ต้อง', 'ตรวจสอบ']).
pattern(verification_resistance, 'ไม่จำเป็น', ['ไม่', 'จำเป็น']).
pattern(verification_resistance, 'อย่ารอ', ['อย่า', 'รอ']).
pattern(verification_resistance, 'ไม่ควรบอก', ['ไม่', 'ควร', 'บอก']).
pattern(verification_resistance, 'ห้ามบอก', ['ห้าม', 'บอก']).
pattern(verification_resistance, 'ความลับ', ['ความลับ']).
pattern(verification_resistance, 'ไม่ต้องแจ้ง', ['ไม่', 'ต้อง', 'แจ้ง']).
pattern(verification_resistance, 'เดี๋ยวนี้', ['เดี๋ยวนี้']).
pattern(verification_resistance, 'ทำตอนนี้', ['ทำ', 'ตอนนี้']).
pattern(verification_resistance, 'ห้ามถาม', ['ห้าม', 'ถาม']).
pattern(verification_resistance, 'ไม่ควรพูด', ['ไม่', 'ควร', 'พูด']).
pattern(verification_resistance, 'อย่าบอก', ['อย่า', 'บอก']).
pattern(verification_resistance, 'ไม่ต้องยืนยันตัวตน', ['ไม่', 'ต้อง', 'ยืนยัน', 'ตัวตน']).
pattern(verification_resistance, 'ไม่ต้องตรวจสอบ', ['ไม่', 'ต้อง', 'ตรวจสอบ']).
pattern(verification_resistance, 'ยืนยันไม่จำเป็น', ['ยืนยัน', 'ไม่', 'จำเป็น']).
pattern(verification_resistance, 'ไม่ต้องสอบถาม', ['ไม่', 'ต้อง', 'สอบถาม']).
pattern(verification_resistance, 'ไม่จำเป็นต้องยืนยันตัวตน', ['ไม่', 'จำเป็น', 'ต้อง', 'ยืนยัน', 'ตัวตน']).
pattern(verification_resistance, 'ไม่สามารถรอการยืนยัน', ['ไม่', 'สามารถ', 'รอ', 'การ', 'ยืนยัน']).
pattern(verification_resistance, 'ต้องทำทันทีไม่ต้องตรวจสอบ', ['ต้อง', 'ทำ', 'ทันที', 'ไม่', 'ต้อง', 'ตรวจสอบ']).
pattern(verification_resistance, 'อย่ารอการยืนยัน', ['อย่า', 'รอ', 'การ', 'ยืนยัน']).
pattern(verification_resistance, 'ไม่ควรบอกใคร', ['ไม่', 'ควร', 'บอก', 'ใคร']).
pattern(verification_resistance, 'ห้ามบอกใคร', ['ห้าม', 'บอก', 'ใคร']).
pattern(verification_resistance, 'ห้ามแจ้งคนอื่น', ['ห้าม', 'แจ้ง', 'คน', 'อื่น']).
pattern(verification_resistance, 'เก็บเป็นความลับ', ['เก็บ', 'เป็น', 'ความลับ']).
pattern(verification_resistance, 'ไม่ต้องแจ้งใครทั้งสิ้น', ['ไม่', 'ต้อง', 'แจ้ง', 'ใคร', 'ทั้งสิ้น']).
pattern(verification_resistance, 'ทำเดี๋ยวนี้', ['ทำ', 'เดี๋ยวนี้']).
pattern(verification_resistance, 'ทำตอนนี้ไม่ต้องถาม', ['ทำ', 'ตอนนี้', 'ไม่', 'ต้อง', 'ถาม']).

% =============== CONVERSATION CONTROL PATTERNS ===============
% Conversation control patterns - more focused
pattern(conversation_control, 'ไม่ต้องถาม', ['ไม่', 'ต้อง', 'ถาม']).
pattern(conversation_control, 'ไม่จำเป็นต้องรู้', ['ไม่', 'จำเป็น', 'ต้อง', 'รู้']).
pattern(conversation_control, 'อย่าถาม', ['อย่า', 'ถาม']).
pattern(conversation_control, 'ไม่ต้องสงสัย', ['ไม่', 'ต้อง', 'สงสัย']).
pattern(conversation_control, 'ไม่เกี่ยวกับคุณ', ['ไม่', 'เกี่ยว', 'กับ', 'คุณ']).
pattern(conversation_control, 'ห้ามถาม', ['ห้าม', 'ถาม']).
pattern(conversation_control, 'ไม่สำคัญ', ['ไม่', 'สำคัญ']).
pattern(conversation_control, 'ประเด็นอื่น', ['ประเด็น', 'อื่น']).
pattern(conversation_control, 'ทำตาม', ['ทำตาม']).
pattern(conversation_control, 'ช่วยด้วย', ['ช่วย', 'ด้วย']).
pattern(conversation_control, 'เชื่อใจ', ['เชื่อใจ']).
pattern(conversation_control, 'เป็นห่วง', ['เป็น', 'ห่วง']).
pattern(conversation_control, 'กังวล', ['กังวล']).
pattern(conversation_control, 'กลัว', ['กลัว']).
pattern(conversation_control, 'เหตุฉุกเฉิน', ['เหตุ', 'ฉุกเฉิน']).
pattern(conversation_control, 'ไม่ต้องถาม', ['ไม่', 'ต้อง', 'ถาม']).
pattern(conversation_control, 'ไม่จำเป็นต้องรู้', ['ไม่', 'จำเป็น', 'ต้อง', 'รู้']).
pattern(conversation_control, 'ไม่ควรถามเรื่องนี้', ['ไม่', 'ควร', 'ถาม', 'เรื่องนี้']).
pattern(conversation_control, 'อย่าถามมาก', ['อย่า', 'ถาม', 'มาก']).
pattern(conversation_control, 'ไม่ต้องสงสัย', ['ไม่', 'ต้อง', 'สงสัย']).
pattern(conversation_control, 'ไม่เกี่ยวข้องกับคุณ', ['ไม่', 'เกี่ยวข้อง', 'กับ', 'คุณ']).
pattern(conversation_control, 'ไม่ต้องการคำถาม', ['ไม่', 'ต้องการ', 'คำถาม']).
pattern(conversation_control, 'ห้ามถาม', ['ห้าม', 'ถาม']).
pattern(conversation_control, 'ห้ามสงสัย', ['ห้าม', 'สงสัย']).
pattern(conversation_control, 'เรามาพูดถึงเรื่องนี้ก่อน', ['เรา', 'มา', 'พูดถึง', 'เรื่องนี้', 'ก่อน']).
pattern(conversation_control, 'ไม่ต้องสนใจเรื่องนั้น', ['ไม่', 'ต้อง', 'สนใจ', 'เรื่อง', 'นั้น']).
pattern(conversation_control, 'ขอเปลี่ยนเรื่องก่อน', ['ขอ', 'เปลี่ยน', 'เรื่อง', 'ก่อน']).
pattern(conversation_control, 'พูดเรื่องอื่น', ['พูด', 'เรื่อง', 'อื่น']).
pattern(conversation_control, 'คุยเรื่องอื่น', ['คุย', 'เรื่อง', 'อื่น']).
pattern(conversation_control, 'ไม่สำคัญ', ['ไม่', 'สำคัญ']).
pattern(conversation_control, 'ไม่ใช่ประเด็น', ['ไม่ใช่', 'ประเด็น']).
pattern(conversation_control, 'ประเด็นอื่น', ['ประเด็น', 'อื่น']).
pattern(conversation_control, 'ถ้าคุณไม่ทำตามจะมีปัญหามาก', ['ถ้า', 'คุณ', 'ไม่', 'ทำตาม', 'จะ', 'มี', 'ปัญหา', 'มาก']).
pattern(conversation_control, 'คุณต้องรีบทำเพื่อไม่ให้เกิดผลเสีย', ['คุณ', 'ต้อง', 'รีบ', 'ทำ', 'เพื่อ', 'ไม่', 'ให้', 'เกิด', 'ผลเสีย']).
pattern(conversation_control, 'อย่าปล่อยให้พลาดโอกาสนี้', ['อย่า', 'ปล่อย', 'ให้', 'พลาด', 'โอกาส', 'นี้']).
pattern(conversation_control, 'คุณจะช่วยเราได้ไหม', ['คุณ', 'จะ', 'ช่วย', 'เรา', 'ได้ไหม']).
pattern(conversation_control, 'ต้องการความช่วยเหลือ', ['ต้องการ', 'ความ', 'ช่วยเหลือ']).
pattern(conversation_control, 'เป็นห่วง', ['เป็น', 'ห่วง']).
pattern(conversation_control, 'กังวลมาก', ['กังวล', 'มาก']).
pattern(conversation_control, 'กลัวว่า', ['กลัว', 'ว่า']).
pattern(conversation_control, 'ไม่ปลอดภัย', ['ไม่', 'ปลอดภัย']).
pattern(conversation_control, 'เสียโอกาส', ['เสีย', 'โอกาส']).

% =============== PATTERN MATCHING ===============

% 1. EXACT MATCH - Check if the pattern exactly matches the sentence
exact_match(Category, Sentence) :-
    pattern(Category, _, PatternTokens),
    PatternTokens = Sentence.

% 2. PATTERN WITHIN LONGER SENTENCE - Check if pattern appears as consecutive subset
consecutive_subset(PatternWords, SentenceWords) :-
    append(_, Rest, SentenceWords),
    append(PatternWords, _, Rest).

% Match pattern as consecutive subset within sentence
pattern_within_sentence(Category, Sentence) :-
    pattern(Category, _, PatternTokens),
    consecutive_subset(PatternTokens, Sentence).

% 3. SEMANTIC KEYWORDS MATCH - Check if important keywords from the pattern appear in sentence
semantic_keywords_match(Category, Sentence) :-
    pattern(Category, _, PatternTokens),
    extract_keywords(PatternTokens, Keywords),
    match_keywords(Keywords, Sentence, 0, MatchCount),
    length(Keywords, KeywordCount),
    % At least 60% of keywords must be present for a match
    MatchCount >= KeywordCount * 0.6.

% Extract important keywords (nouns, verbs, adjectives) from pattern
% For Thai, we'll use a simple heuristic by filtering out common particles/stopwords
extract_keywords(PatternTokens, Keywords) :-
    exclude(is_stopword, PatternTokens, Keywords).

% List of common Thai stopwords/particles to filter out
is_stopword('ที่').
is_stopword('ใน').
is_stopword('การ').
is_stopword('และ').
is_stopword('หรือ').
is_stopword('แต่').
is_stopword('นี้').
is_stopword('นั้น').
is_stopword('เพื่อ').
is_stopword('โดย').
is_stopword('กับ').
is_stopword('จาก').
is_stopword('ของ').
is_stopword('ให้').
is_stopword('ได้').
is_stopword('มี').
is_stopword('เป็น').
is_stopword('คือ').

% Count how many keywords from the pattern appear in the sentence
match_keywords([], _, Count, Count).
match_keywords([Keyword|Rest], Sentence, CurrentCount, FinalCount) :-
    (contains_word(Keyword, Sentence) ->
        NextCount is CurrentCount + 1
    ;
        NextCount = CurrentCount
    ),
    match_keywords(Rest, Sentence, NextCount, FinalCount).

% 4. CONTEXT MATCHING - Check for contextual clues based on word proximity
context_match(Category, Sentence) :-
    pattern(Category, _, PatternTokens),
    length(PatternTokens, Len),
    Len > 3,
    get_keyword_pairs(PatternTokens, Pairs),
    member((Word1, Word2), Pairs),
    contains_word(Word1, Sentence),
    contains_word(Word2, Sentence).

% Get important word pairs from the pattern (avoiding stopwords)
get_keyword_pairs(PatternTokens, Pairs) :-
    % Filter out stopwords
    exclude(is_stopword, PatternTokens, Keywords),
    % Get pairs from keywords
    get_distinct_pairs(Keywords, Pairs).

% Generate distinct pairs from a list
get_distinct_pairs([], []).
get_distinct_pairs([_], []).
get_distinct_pairs([H|T], Pairs) :-
    pair_with_all(H, T, HPairs),
    get_distinct_pairs(T, TPairs),
    append(HPairs, TPairs, Pairs).

% Pair an element with all elements in a list
pair_with_all(_, [], []).
pair_with_all(X, [H|T], [(X, H)|Pairs]) :-
    pair_with_all(X, T, Pairs).

% Helper to check if a word or part of a word is in the sentence
contains_word(Word, Sentence) :-
    member(Token, Sentence),
    (Token = Word ; sub_atom(Token, _, _, _, Word)).

% Main detection function combining all strategies
detect_pattern(Category, Sentence) :-
    exact_match(Category, Sentence);
    pattern_within_sentence(Category, Sentence);
    semantic_keywords_match(Category, Sentence);
    context_match(Category, Sentence).

% =============== RULE CHECKING FUNCTIONS ===============

% Check for authority claim patterns
has_authority_claim(Sentence) :-
    detect_pattern(authority_claim, Sentence).

% Check for urgency claim patterns
has_urgency_claim(Sentence) :-
    detect_pattern(urgency_claim, Sentence).

% Check for information request patterns
has_info_request(Sentence) :-
    detect_pattern(info_request, Sentence).

% Check for transaction request patterns
has_transaction_request(Sentence) :-
    detect_pattern(transaction_request, Sentence).

% Check for threat patterns
has_threat_claim(Sentence) :-
    detect_pattern(threat_claim, Sentence).

% Check for verification resistance patterns
has_verification_resistance(Sentence) :-
    detect_pattern(verification_resistance, Sentence).

% Check for conversation control patterns
has_conversation_control(Sentence) :-
    detect_pattern(conversation_control, Sentence).

% ==========================
% Scam Scoring System
% ==========================

% Define the weight of each rule (out of 100)
:- dynamic rule_weight/2.
rule_weight(authority, 14).          % 14%
rule_weight(urgency, 15).            % 15%
rule_weight(info_request, 18).       % 18%
rule_weight(transaction, 18).        % 18%
rule_weight(threat, 15).             % 15%
rule_weight(verification, 10).       % 10%
rule_weight(conversation, 10).       % 10%

% Define threshold levels
threshold_level(0, 25, low).
threshold_level(26, 50, medium).
threshold_level(51, 75, high).
threshold_level(76, 100, critical).

% Count matches for each rule type in a list of sentences
count_rule_matches([], _, 0).
count_rule_matches([S|Rest], Rule, Count) :-
    (check_rule_match(S, Rule) -> 
        count_rule_matches(Rest, Rule, SubCount),
        Count is SubCount + 1
    ;
        count_rule_matches(Rest, Rule, Count)
    ).

% Check if a specific rule matches a sentence
check_rule_match(S, authority) :- has_authority_claim(S).
check_rule_match(S, urgency) :- has_urgency_claim(S).
check_rule_match(S, info_request) :- has_info_request(S).
check_rule_match(S, transaction) :- has_transaction_request(S).
check_rule_match(S, threat) :- has_threat_claim(S).
check_rule_match(S, verification) :- has_verification_resistance(S).
check_rule_match(S, conversation) :- has_conversation_control(S).

% Calculate score for a rule with the formula
calculate_rule_score(Sentences, Rule, Score) :-
    rule_weight(Rule, Weight),
    count_rule_matches(Sentences, Rule, Matches),
    length(Sentences, TotalSentences),
    (Matches > 0 -> 
        % If we find any matches, apply a higher percentage of the weight
        % 70% base score for any match + up to 30% based on proportion of sentences
        RawScore is Weight * (0.7 + (0.3 * Matches / TotalSentences)),
        Score is min(Weight, RawScore)
    ;
        Score = 0
    ).

% Determine the threat level based on the score
determine_threat_level(Score, Level) :-
    threshold_level(Min, Max, Level),
    Score >= Min,
    Score =< Max.

% Non-backtracking detect_all_rules
detect_all_rules([]).
detect_all_rules([Sentence|Rest]) :-
    % Check each rule once without backtracking
    (has_authority_claim(Sentence) -> 
        write('Matched Rule: detect_scam_authority_claim'), nl ; true),
    (has_urgency_claim(Sentence) -> 
        write('Matched Rule: detect_scam_urgency'), nl ; true),
    (has_info_request(Sentence) -> 
        write('Matched Rule: detect_scam_info_request'), nl ; true),
    (has_transaction_request(Sentence) -> 
        write('Matched Rule: detect_scam_transaction_request'), nl ; true),
    (has_threat_claim(Sentence) -> 
        write('Matched Rule: detect_scam_threat'), nl ; true),
    (has_verification_resistance(Sentence) -> 
        write('Matched Rule: detect_scam_verification_resistance'), nl ; true),
    (has_conversation_control(Sentence) -> 
        write('Matched Rule: detect_scam_conversation_control'), nl ; true),
    
    % Process next sentence
    detect_all_rules(Rest).

% New category threshold values for individual warnings
category_warning_threshold(authority, 10).      % If >10/14, warn specifically
category_warning_threshold(urgency, 11).        % If >11/15, warn specifically
category_warning_threshold(info_request, 13).   % If >13/18, warn specifically  
category_warning_threshold(transaction, 13).    % If >13/18, warn specifically
category_warning_threshold(threat, 11).         % If >11/15, warn specifically
category_warning_threshold(verification, 7).    % If >7/10, warn specifically
category_warning_threshold(conversation, 7).    % If >7/10, warn specifically

% Check if a specific category needs a warning
check_category_warning(Category, Score, WarningMsg) :-
    category_warning_threshold(Category, Threshold),
    (Score >= Threshold -> 
        write('WARNING: '), write(WarningMsg), nl
    ; 
        % If the score is still significant (>70% of threshold), show a milder caution
        MildThreshold is Threshold * 0.7,
        (Score >= MildThreshold ->
            write('Caution: '), write(WarningMsg), nl
        ;
            true  
        )
    ).

% Provide overall recommendation that considers category-specific high scores
determine_overall_recommendation(ThreatLevel, AuthScore, UrgScore, InfoScore, TransScore, ThreatScore, VerifScore, ConvScore) :-
    % Check for any critically high individual scores
    (has_critical_category(AuthScore, UrgScore, InfoScore, TransScore, ThreatScore, VerifScore, ConvScore) ->
        write('Despite the overall threat level being '), write(ThreatLevel),
        write(', specific high-risk elements were detected. EXERCISE EXTREME CAUTION and verify through official channels.')
    ;
        % Use the standard threat level recommendations
        (ThreatLevel = low ->
            write('Low overall risk detected. Still, remain vigilant and verify when in doubt.')
        ; ThreatLevel = medium ->
            write('Medium risk detected. Verify the identity of the sender and do not share sensitive information.')
        ; ThreatLevel = high ->
            write('High risk detected. This is likely a scam attempt. Do not engage further.')
        ; ThreatLevel = critical ->
            write('CRITICAL RISK DETECTED! This is almost certainly a scam. Terminate communication immediately and report to authorities.')
        )
    ).

% Check if any category has a critically high score, regardless of overall threat level
has_critical_category(AuthScore, UrgScore, InfoScore, TransScore, ThreatScore, VerifScore, ConvScore) :-
    category_warning_threshold(authority, AuthThreshold),
    category_warning_threshold(urgency, UrgThreshold),
    category_warning_threshold(info_request, InfoThreshold),
    category_warning_threshold(transaction, TransThreshold),
    category_warning_threshold(threat, ThreatThreshold),
    category_warning_threshold(verification, VerifThreshold),
    category_warning_threshold(conversation, ConvThreshold),
    
    (AuthScore >= AuthThreshold; UrgScore >= UrgThreshold; InfoScore >= InfoThreshold;
     TransScore >= TransThreshold; ThreatScore >= ThreatThreshold; 
     VerifScore >= VerifThreshold; ConvScore >= ConvThreshold).


% Main analysis with scoring function
analyze_message(Sentences) :-
    % Detect and print matched rules
    write('Analyzing message for scam indicators...'), nl,
    
    % Display all sentences being analyzed
    write('Analyzing sentences:'), nl,
    print_sentences(Sentences, 1),
    nl,
    
    % Use once/1 to prevent backtracking on the rule detection
    once(detect_all_rules(Sentences)),
    nl,
    
    % Calculate scores for each rule
    calculate_rule_score(Sentences, authority, AuthorityScore),
    calculate_rule_score(Sentences, urgency, UrgencyScore),
    calculate_rule_score(Sentences, info_request, InfoRequestScore),
    calculate_rule_score(Sentences, transaction, TransactionScore),
    calculate_rule_score(Sentences, threat, ThreatScore),
    calculate_rule_score(Sentences, verification, VerificationScore),
    calculate_rule_score(Sentences, conversation, ConversationScore),
    
    % Calculate total score
    TotalScore is AuthorityScore + UrgencyScore + InfoRequestScore +
               TransactionScore + ThreatScore + VerificationScore + 
               ConversationScore,
    
    % Determine threat level
    determine_threat_level(TotalScore, ThreatLevel),
    
    % Generate the report
    write('===== SCAM DETECTION SUMMARY REPORT ====='), nl,
    write('----------------------------------------'), nl,
    length(Sentences, SentenceCount),
    format('Total Sentences Analyzed: ~w~n', [SentenceCount]),
    nl,
    write('RULE SCORES (Score/Max):'), nl,
    write('----------------------------------------'), nl,
    rule_weight(authority, AuthWeight),
    rule_weight(urgency, UrgWeight),
    rule_weight(info_request, InfoWeight),
    rule_weight(transaction, TransWeight),
    rule_weight(threat, ThreatWeight),
    rule_weight(verification, VerifWeight),
    rule_weight(conversation, ConvWeight),
    
    format('1. Authority Claims: ~2f/~w~n', [AuthorityScore, AuthWeight]),
    format('2. Urgency Indicators: ~2f/~w~n', [UrgencyScore, UrgWeight]),
    format('3. Information Requests: ~2f/~w~n', [InfoRequestScore, InfoWeight]),
    format('4. Transaction Requests: ~2f/~w~n', [TransactionScore, TransWeight]),
    format('5. Threats: ~2f/~w~n', [ThreatScore, ThreatWeight]),
    format('6. Verification Resistance: ~2f/~w~n', [VerificationScore, VerifWeight]),
    format('7. Conversation Control: ~2f/~w~n', [ConversationScore, ConvWeight]),
    nl,
    MaxPossibleScore is AuthWeight + UrgWeight + InfoWeight + TransWeight + ThreatWeight + VerifWeight + ConvWeight,
    format('TOTAL SCAM SCORE: ~2f/~w~n', [TotalScore, MaxPossibleScore]),
    format('THREAT LEVEL: ~w~n', [ThreatLevel]),
    nl,
    
    % Add the category-specific warnings
    write('SPECIFIC WARNINGS:'), nl,
    write('----------------------------------------'), nl,
    
    check_category_warning(authority, AuthorityScore, 'Authority claims detected. Verify the sender\'s identity through official channels.'),
    check_category_warning(urgency, UrgencyScore, 'High urgency tactics detected. Be skeptical of time pressure - legitimate organizations don\'t rush you.'),
    check_category_warning(info_request, InfoRequestScore, 'Requests for sensitive information detected. Never share personal/financial information through suspicious channels.'),
    check_category_warning(transaction, TransactionScore, 'Transaction or money transfer request detected. STOP and verify through official channels before any financial action.'),
    check_category_warning(threat, ThreatScore, 'Threats or intimidation tactics detected. Legitimate organizations don\'t threaten customers.'),
    check_category_warning(verification, VerificationScore, 'Attempts to prevent verification detected. Always verify independently.'),
    check_category_warning(conversation, ConversationScore, 'Conversation manipulation tactics detected. The sender may be trying to control your actions.'),
    
    % Then continue with overall recommendation
    nl,
    write('OVERALL RECOMMENDATION:'), nl,
    write('----------------------------------------'), nl,
    determine_overall_recommendation(ThreatLevel, AuthorityScore, UrgencyScore, InfoRequestScore, TransactionScore, ThreatScore, VerificationScore, ConversationScore),
    nl, nl,
    write('============ END OF REPORT ============='), nl,
    % Cut to prevent any backtracking after the report is generated
    !.

% Helper predicate to print all sentences with numbering
print_sentences([], _).
print_sentences([Sentence|Rest], N) :-
    format('  Sentence ~w: ', [N]),
    print_sentence_words(Sentence),
    NextN is N + 1,
    print_sentences(Rest, NextN).

% Helper predicate to print all words in a sentence
print_sentence_words([]) :- nl.
print_sentence_words([Word|Rest]) :-
    write(Word), write(' '),
    print_sentence_words(Rest).


