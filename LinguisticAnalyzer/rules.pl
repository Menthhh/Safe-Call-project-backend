:- encoding(utf8).

% Add discontiguous declarations for predicates that might be defined in multiple places
:- discontiguous urgency_word/1.
:- discontiguous info_request_action/1.
:- discontiguous info_request_data/1.
:- discontiguous transaction_action/1.
:- discontiguous transaction_object/1.
:- discontiguous transaction_urgency/1.
:- discontiguous threat_word/1.
:- discontiguous verification_resistance_word/1.
:- discontiguous conversation_control_interrupt/1.
:- discontiguous conversation_control_redirect/1.
:- discontiguous conversation_control_emotion/1.

% =============== AUTHORITY CLAIM INDICATORS ===============
% Thai pronouns commonly used in authority claims
pronoun('ผม').
pronoun('ดิฉัน').
pronoun('กระผม').
pronoun('ข้าพเจ้า').
pronoun('เรา').
pronoun('ทาง').
pronoun('ทางเรา').

% Thai prepositions used to establish connection to authority
preposition('เป็น').
preposition('คือ').
preposition('มาจาก').
preposition('ทำงานให้กับ').
preposition('ทำงานที่').
preposition('สังกัด').
preposition('ในนามของ').
preposition('ตัวแทนจาก').
preposition('ในฐานะ').
preposition('จาก').

authority_org('ธนาคาร').
authority_org('กรุงไทย').
authority_org('กสิกร').
authority_org('ไทยพาณิชย์').
authority_org('กรุงเทพ').
authority_org('ตำรวจ').
authority_org('ตร').
authority_org('ศาล').
authority_org('กรมสรรพากร').
authority_org('สรรพากร').
authority_org('ภาษี').
authority_org('ทหาร').
authority_org('รัฐบาล').
authority_org('กระทรวง').
authority_org('ไปรษณีย์').
authority_org('ประกันสังคม').
authority_org('covid').
authority_org('โควิด').

authority_position('ฝ่ายความปลอดภัย').
authority_position('ฝ่ายบริการลูกค้า').
authority_position('เจ้าหน้าที่').
authority_position('พนักงาน').
authority_position('ผู้จัดการ').
authority_position('ผู้จัดการใหญ่').
authority_position('ผู้อำนวยการ').
authority_position('นายก').
authority_position('นาย').
authority_position('นายตำรวจ').
authority_position('ผู้กำกับ').
authority_position('ผู้พิพากษา').
authority_position('พิเศษ').
authority_position('ได้รับมอบหมาย').

authority_vague('ต้องการพูดกับ').
authority_vague('ผมมาจาก').
authority_vague('ผมชื่อ').
authority_vague('โทรมาจาก').
authority_vague('แผนก').
authority_vague('ฝ่าย').
authority_vague('ระบบ').
authority_vague('จากสำนักงาน').


% Check if the sentence contains a pronoun
contains_pronoun(Sentence) :-
    member(Word, Sentence),
    pronoun(Word).

% Check if the sentence contains a preposition
contains_preposition(Sentence) :-
    member(Word, Sentence),
    preposition(Word).

% Check if the sentence contains any authority element
contains_authority_element(Sentence) :-
    member(Word, Sentence),
    (
        authority_position(Word);
        authority_org(Word);
        authority_vague(Word)
    ).

% Check if a sentence contains all required components
has_authority_claim(Sentence) :-
    contains_pronoun(Sentence),
    contains_preposition(Sentence),
    contains_authority_element(Sentence).

% =============== URGENCY INDICATORS ===============
% Single-word urgency indicators
urgency_word('ด่วน').
urgency_word('ทันที').
urgency_word('ภายใน').
urgency_word('ชั่วโมง').
urgency_word('นาที').
urgency_word('ไม่เช่นนั้น').
urgency_word('หากไม่').
urgency_word('จะถูก').
urgency_word('จะระงับ').
urgency_word('เสี่ยงต่อ').
urgency_word('ปิดบัญชี').
urgency_word('อายัด').
urgency_word('ฟ้องร้อง').

% Split-word patterns
% These are individual words that, when found together in a sentence,
% indicate urgency
split_urgency_pattern('ติดต่อ', 'กลับ').    % Contact back
split_urgency_pattern('ทำ', 'ทันที').       % Do immediately
split_urgency_pattern('ตอบ', 'กลับ').       % Reply back
split_urgency_pattern('ต้อง', 'ทำ').        % Must do 
split_urgency_pattern('ต้อง', 'รีบ').       % Must hurry
split_urgency_pattern('รีบ', 'ดำเนินการ').  % Hurry to take action
split_urgency_pattern('โปรด', 'ติดต่อ').    % Please contact
split_urgency_pattern('โปรด', 'ตอบ').       % Please reply
split_urgency_pattern('กรุณา', 'ดำเนินการ').% Please take action
split_urgency_pattern('กรุณา', 'ติดต่อ').   % Please contact
split_urgency_pattern('กรุณา', 'ตอบ').      % Please answer
split_urgency_pattern('ด่วน', 'ที่สุด').    % Most urgent
split_urgency_pattern('รีบ', 'ที่สุด').     % Hurry most
split_urgency_pattern('เร่ง', 'ด่วน').      % Rush

% For backward compatibility: keep the combined forms too
urgency_word('ติดต่อกลับ').
urgency_word('ทำทันที').
urgency_word('ตอบกลับ').
urgency_word('ต้องทำ').
urgency_word('ต้องรีบ').
urgency_word('รีบดำเนินการ').
urgency_word('โปรดติดต่อ').
urgency_word('โปรดตอบ').
urgency_word('กรุณาดำเนินการ').
urgency_word('กรุณาติดต่อ').
urgency_word('กรุณาตอบ').
urgency_word('ด่วนที่สุด').
urgency_word('รีบที่สุด').
urgency_word('เร่งด่วน').

% Check if the sentence contains any single-word urgency indicator
contains_urgency_single(Sentence) :-
    member(Word, Sentence),
    urgency_word(Word).

% Check if the sentence contains any split urgency pattern
% This checks for both adjacent words and non-adjacent words
contains_urgency_pattern(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,  % Ensure we're not matching the same word
    split_urgency_pattern(First, Second).

% Check if the sentence contains any urgency indicator
contains_urgency(Sentence) :-
    contains_urgency_single(Sentence);
    contains_urgency_pattern(Sentence).

has_urgency_claim(Sentence) :-
    contains_urgency(Sentence).

% =============== INFORMATION REQUEST COMPONENTS ===============

% Single-word action verbs (for backward compatibility)
info_request_action('กรุณาส่ง').
info_request_action('กรุณายืนยัน').
info_request_action('กรุณากรอก').
info_request_action('ยืนยัน').
info_request_action('กรุณาตอบ').
info_request_action('ต้องการ').
info_request_action('ขอ').
info_request_action('ให้').

% Split action verb patterns
split_action_pattern('กรุณา', 'ส่ง').
split_action_pattern('กรุณา', 'ยืนยัน').
split_action_pattern('กรุณา', 'กรอก').
split_action_pattern('กรุณา', 'ตอบ').
split_action_pattern('ต้อง', 'การ').
split_action_pattern('ช่วย', 'ยืนยัน').
split_action_pattern('ช่วย', 'กรอก').
split_action_pattern('ช่วย', 'ส่ง').
split_action_pattern('โปรด', 'ส่ง').
split_action_pattern('โปรด', 'ยืนยัน').
split_action_pattern('โปรด', 'กรอก').
split_action_pattern('ขอ', 'ทราบ').
split_action_pattern('แจ้ง', 'ข้อมูล').

% Single-word information types (for backward compatibility)
info_request_data('ข้อมูลส่วนตัว').
info_request_data('ข้อมูลส่วนบุคคล').
info_request_data('ชื่อบัญชี').
info_request_data('ชื่อเต็ม').
info_request_data('หมายเลขโทรศัพท์').
info_request_data('อีเมล').
info_request_data('หมายเลขบัตรเครดิต').
info_request_data('วันหมดอายุ').
info_request_data('บัตรประชาชน').

% Split data type patterns
split_data_pattern('ข้อมูล', 'ส่วนตัว').
split_data_pattern('ข้อมูล', 'ส่วนบุคคล').
split_data_pattern('ข้อมูล', 'บัญชี').
split_data_pattern('ชื่อ', 'บัญชี').
split_data_pattern('ชื่อ', 'เต็ม').
split_data_pattern('หมายเลข', 'โทรศัพท์').
split_data_pattern('เบอร์', 'โทร').
split_data_pattern('เบอร์', 'โทรศัพท์').
split_data_pattern('ที่', 'อยู่').
split_data_pattern('อี', 'เมล').
split_data_pattern('หมายเลข', 'บัตรเครดิต').
split_data_pattern('บัตร', 'เครดิต').
split_data_pattern('วัน', 'หมดอายุ').
split_data_pattern('บัตร', 'ประชาชน').
split_data_pattern('รหัส', 'ผ่าน').
split_data_pattern('รหัส', 'บัตร').
split_data_pattern('รหัส', 'พิน').
split_data_pattern('รหัส', 'โอทีพี').
split_data_pattern('รหัส', 'OTP').
split_data_pattern('รหัส', 'ยืนยัน').

% Check if the sentence contains any single-word action verb
contains_single_action(Sentence) :-
    member(Word, Sentence),
    info_request_action(Word).

% Check if the sentence contains a split action verb pattern
contains_split_action(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_action_pattern(First, Second).

% Check if the sentence contains any action verb (single or split)
contains_info_request_action(Sentence) :-
    contains_single_action(Sentence);
    contains_split_action(Sentence).

% Check if the sentence contains any single-word data type
contains_single_data(Sentence) :-
    member(Word, Sentence),
    info_request_data(Word).

% Check if the sentence contains a split data type pattern
contains_split_data(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_data_pattern(First, Second).

% Check if the sentence contains any data type (single or split)
contains_info_request_data(Sentence) :-
    contains_single_data(Sentence);
    contains_split_data(Sentence).

% Check if the sentence contains both an action verb and a data type
contains_info_request(Sentence) :-
    contains_info_request_action(Sentence),
    contains_info_request_data(Sentence).

% Full rule to check for information request
has_info_request(Sentence) :-
    contains_info_request_action(Sentence),
    contains_info_request_data(Sentence).


% =============== TRANSACTION REQUEST COMPONENTS ===============

% Action Verbs
transaction_action('โอน').
transaction_action('ซื้อ').
transaction_action('ส่ง').
transaction_action('ช่วยโอน').
transaction_action('กรุณาโอน').
transaction_action('ต้องการโอน').

% Objects or items involved in transactions
transaction_object('เงิน').
transaction_object('บัตร').
transaction_object('บัตรของขวัญ').
transaction_object('รหัสบัตร').
transaction_object('เติมเงิน').
transaction_object('บัตรไอที').
transaction_object('บัตรสตรีม').

% Urgency indicators
transaction_urgency('ด่วน').
transaction_urgency('ทันที').
transaction_urgency('ต้องการ').
transaction_urgency('ช่วย').
transaction_urgency('การทำธุรกรรมด่วน').

% Check if the sentence contains any transaction-related components
contains_transaction_action(Sentence) :-
    member(Word, Sentence),
    transaction_action(Word).

contains_transaction_object(Sentence) :-
    member(Word, Sentence),
    transaction_object(Word).

contains_transaction_urgency(Sentence) :-
    member(Word, Sentence),
    transaction_urgency(Word).

% Check if the sentence contains any of the transaction request components
contains_transaction_request(Sentence) :-
    contains_transaction_action(Sentence),
    contains_transaction_object(Sentence),
    contains_transaction_urgency(Sentence).

% Full rule to check for transaction request
has_transaction_request(Sentence) :-
    contains_transaction_action(Sentence),
    contains_transaction_object(Sentence),
    contains_transaction_urgency(Sentence).

% =============== THREAT INDICATORS ===============

% Single-word threat indicators (for backward compatibility)
threat_word('ฟ้องร้อง').            % Legal action or lawsuit
threat_word('อายัด').               % Seize
threat_word('เสี่ยงต่อ').           % At risk
threat_word('ถูกดำเนินคดี').        % Legal action
threat_word('ทำร้าย').              % Harm or hurt
threat_word('หากไม่').              % If not (indicating a consequence)
threat_word('จะถูก').               % Will be (followed by a consequence)
threat_word('ปิดบัญชี').            % Account suspension
threat_word('ระงับ').               % Suspension
threat_word('คุกคาม').              % Threaten

% Split threat word patterns
split_threat_pattern('ฟ้อง', 'ร้อง').           % Legal action
split_threat_pattern('เสี่ยง', 'ต่อ').          % At risk
split_threat_pattern('ถูก', 'ดำเนินคดี').       % Legal action
split_threat_pattern('ทำ', 'ร้าย').             % Harm or hurt
split_threat_pattern('หาก', 'ไม่').             % If not
split_threat_pattern('จะ', 'ถูก').              % Will be
split_threat_pattern('ปิด', 'บัญชี').           % Account suspension
split_threat_pattern('ระงับ', 'บัญชี').         % Account suspension
split_threat_pattern('ระงับ', 'บริการ').        % Service suspension
split_threat_pattern('คุก', 'คาม').            % Threaten
split_threat_pattern('ดำเนิน', 'คดี').         % Legal action
split_threat_pattern('แจ้ง', 'ความ').          % File complaint
split_threat_pattern('อาญา', 'หนัก').          % Heavy criminal penalties
split_threat_pattern('โทษ', 'ทางกฎหมาย').      % Legal penalties
split_threat_pattern('ถูก', 'ปรับ').           % Be fined
split_threat_pattern('ถูก', 'จับ').            % Be arrested
split_threat_pattern('ติด', 'คุก').            % Go to jail
split_threat_pattern('สูญ', 'เสีย').           % Lose
split_threat_pattern('ยึด', 'ทรัพย์').         % Asset seizure
split_threat_pattern('อันตราย', 'ต่อ').        % Danger to

% Check if the sentence contains any single-word threat
contains_single_threat(Sentence) :-
    member(Word, Sentence),
    threat_word(Word).

% Check if the sentence contains any split threat pattern
contains_split_threat(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_threat_pattern(First, Second).

% Check if the sentence contains any threat indicator
contains_threat(Sentence) :-
    contains_single_threat(Sentence);
    contains_split_threat(Sentence).

% Full rule to check for threat pattern
has_threat_claim(Sentence) :-
    contains_threat(Sentence).

% =============== VERIFICATION RESISTANCE INDICATORS ===============

% Single-word verification resistance indicators (for backward compatibility)
verification_resistance_word('ไม่ต้องยืนยัน').   % No need to confirm
verification_resistance_word('ไม่ต้องตรวจสอบ').  % No need to check
verification_resistance_word('ยืนยันไม่จำเป็น'). % Confirmation not necessary
verification_resistance_word('ไม่ต้องสอบถาม').   % No need to ask
verification_resistance_word('ไม่จำเป็นต้องยืนยันตัวตน'). % No need to verify identity
verification_resistance_word('ไม่สามารถรอการยืนยัน'). % Can't wait for confirmation
verification_resistance_word('ต้องทำทันที').      % Must do immediately
verification_resistance_word('อย่ารอการยืนยัน'). % Don't wait for confirmation

% Split verification resistance patterns
split_verification_pattern('ไม่', 'ต้องยืนยัน').          % No need to confirm
split_verification_pattern('ไม่ต้อง', 'ยืนยัน').          % No need to confirm
split_verification_pattern('ไม่', 'ต้องตรวจสอบ').        % No need to check
split_verification_pattern('ไม่ต้อง', 'ตรวจสอบ').        % No need to check
split_verification_pattern('ยืนยัน', 'ไม่จำเป็น').        % Confirmation not necessary
split_verification_pattern('ไม่', 'ต้องสอบถาม').         % No need to ask
split_verification_pattern('ไม่ต้อง', 'สอบถาม').         % No need to ask
split_verification_pattern('ไม่จำเป็น', 'ต้องยืนยันตัวตน'). % No need to verify identity
split_verification_pattern('ไม่', 'จำเป็นต้องยืนยัน').    % No need to confirm
split_verification_pattern('ไม่สามารถ', 'รอการยืนยัน').   % Can't wait for confirmation
split_verification_pattern('ไม่', 'สามารถรอการยืนยัน').   % Can't wait for confirmation
split_verification_pattern('ต้อง', 'ทำทันที').           % Must do immediately
split_verification_pattern('อย่า', 'รอการยืนยัน').        % Don't wait for confirmation
split_verification_pattern('ไม่', 'ควรบอกใคร').          % Shouldn't tell anyone
split_verification_pattern('ห้าม', 'บอกใคร').            % Don't tell anyone
split_verification_pattern('ห้าม', 'แจ้ง').              % Don't notify
split_verification_pattern('เก็บ', 'เป็นความลับ').        % Keep secret
split_verification_pattern('ไม่', 'ต้องแจ้ง').           % No need to notify
split_verification_pattern('ไม่ต้อง', 'แจ้ง').           % No need to notify
split_verification_pattern('ทำ', 'เดี๋ยวนี้').            % Do it now
split_verification_pattern('ทำ', 'ตอนนี้').              % Do it now

% Check if the sentence contains any single-word verification resistance indicator
contains_single_verification_resistance(Sentence) :-
    member(Word, Sentence),
    verification_resistance_word(Word).

% Check if the sentence contains any split verification resistance pattern
contains_split_verification_resistance(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_verification_pattern(First, Second).

% Check if the sentence contains any verification resistance indicator
contains_verification_resistance(Sentence) :-
    contains_single_verification_resistance(Sentence);
    contains_split_verification_resistance(Sentence).

% Full rule to check for verification resistance
has_verification_resistance(Sentence) :-
    contains_verification_resistance(Sentence).

% =============== CONVERSATION CONTROL INDICATORS ===============

% Single-word interruption indicators (for backward compatibility)
conversation_control_interrupt('ไม่ต้องถาม').    % No need to ask
conversation_control_interrupt('ไม่จำเป็นต้องรู้').  % No need to know
conversation_control_interrupt('ไม่ควรถามเรื่องนี้'). % Shouldn't ask this question
conversation_control_interrupt('อย่าถามมาก').   % Don't ask too much

% Split interruption patterns
split_interrupt_pattern('ไม่', 'ต้องถาม').         % No need to ask
split_interrupt_pattern('ไม่ต้อง', 'ถาม').         % No need to ask
split_interrupt_pattern('ไม่', 'จำเป็นต้องรู้').     % No need to know
split_interrupt_pattern('ไม่จำเป็น', 'ต้องรู้').     % No need to know
split_interrupt_pattern('ไม่ควร', 'ถามเรื่องนี้').   % Shouldn't ask this question
split_interrupt_pattern('ไม่', 'ควรถาม').          % Shouldn't ask
split_interrupt_pattern('อย่า', 'ถามมาก').         % Don't ask too much
split_interrupt_pattern('ไม่ต้อง', 'สงสัย').        % No need to doubt
split_interrupt_pattern('ไม่', 'ต้องสงสัย').        % No need to doubt
split_interrupt_pattern('ไม่', 'เกี่ยวข้องกับคุณ').   % Not your business
split_interrupt_pattern('ไม่', 'ต้องการคำถาม').      % Don't want questions
split_interrupt_pattern('ห้าม', 'ถาม').            % Don't ask
split_interrupt_pattern('ห้าม', 'สงสัย').           % Don't doubt

% Single-word redirection indicators (for backward compatibility)
conversation_control_redirect('เรามาพูดถึงเรื่องนี้ก่อน'). % Let's talk about this first
conversation_control_redirect('ไม่ต้องสนใจเรื่องนั้น').    % Don't worry about that
conversation_control_redirect('ขอเปลี่ยนเรื่องก่อน').      % Let's change the topic

% Split redirection patterns
split_redirect_pattern('เรา', 'มาพูดถึงเรื่องนี้ก่อน').   % Let's talk about this first
split_redirect_pattern('มาพูด', 'เรื่องนี้ก่อน').         % Let's talk about this first
split_redirect_pattern('ไม่ต้อง', 'สนใจเรื่องนั้น').      % Don't worry about that
split_redirect_pattern('ไม่', 'ต้องสนใจ').               % Don't need to pay attention
split_redirect_pattern('ขอ', 'เปลี่ยนเรื่อง').           % Let's change the topic
split_redirect_pattern('เปลี่ยน', 'เรื่อง').             % Change topic
split_redirect_pattern('พูด', 'เรื่องอื่น').              % Talk about something else
split_redirect_pattern('คุย', 'เรื่องอื่น').              % Chat about something else
split_redirect_pattern('ไม่', 'สำคัญ').                  % Not important
split_redirect_pattern('ไม่ใช่', 'ประเด็น').              % Not the point
split_redirect_pattern('ประเด็น', 'อื่น').                % Another point

% Single-word emotional manipulation indicators (for backward compatibility)
conversation_control_emotion('ถ้าคุณไม่ทำตามจะมีปัญหามาก'). % If you don't follow, there will be problems
conversation_control_emotion('คุณต้องรีบทำเพื่อไม่ให้เกิดผลเสีย'). % You need to act quickly to avoid consequences
conversation_control_emotion('อย่าปล่อยให้พลาดโอกาสนี้').  % Don't let this opportunity pass by
conversation_control_emotion('คุณจะช่วยเราได้ไหม').       % Can you help us?

% Split emotional manipulation patterns
split_emotion_pattern('ถ้า', 'คุณไม่ทำตาม').             % If you don't follow
split_emotion_pattern('จะมี', 'ปัญหา').                  % There will be problems
split_emotion_pattern('ปัญหา', 'มาก').                   % Big problems
split_emotion_pattern('คุณ', 'ต้องรีบ').                  % You need to hurry
split_emotion_pattern('ทำ', 'เพื่อไม่ให้เกิดผลเสีย').       % Do to avoid negative consequences
split_emotion_pattern('อย่า', 'พลาดโอกาส').               % Don't miss the opportunity
split_emotion_pattern('โอกาส', 'ดี').                     % Good opportunity
split_emotion_pattern('คุณ', 'จะช่วย').                   % You will help
split_emotion_pattern('ช่วย', 'เรา').                     % Help us
split_emotion_pattern('ช่วย', 'ได้ไหม').                  % Can you help
split_emotion_pattern('ต้องการ', 'ความช่วยเหลือ').         % Need help
split_emotion_pattern('เป็น', 'ห่วง').                    % Worried
split_emotion_pattern('กังวล', 'มาก').                    % Very worried
split_emotion_pattern('กลัว', 'ว่า').                      % Afraid that
split_emotion_pattern('ไม่', 'ปลอดภัย').                  % Not safe
split_emotion_pattern('เสีย', 'โอกาส').                   % Miss opportunity

% Check if the sentence contains any single-word interruption indicator
contains_single_conversation_control_interrupt(Sentence) :-
    member(Word, Sentence),
    conversation_control_interrupt(Word).

% Check if the sentence contains any split interruption pattern
contains_split_conversation_control_interrupt(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_interrupt_pattern(First, Second).

% Check if the sentence contains any interruption indicator (single or split)
contains_conversation_control_interrupt(Sentence) :-
    contains_single_conversation_control_interrupt(Sentence);
    contains_split_conversation_control_interrupt(Sentence).

% Check if the sentence contains any single-word redirection indicator
contains_single_conversation_control_redirect(Sentence) :-
    member(Word, Sentence),
    conversation_control_redirect(Word).

% Check if the sentence contains any split redirection pattern
contains_split_conversation_control_redirect(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_redirect_pattern(First, Second).

% Check if the sentence contains any redirection indicator (single or split)
contains_conversation_control_redirect(Sentence) :-
    contains_single_conversation_control_redirect(Sentence);
    contains_split_conversation_control_redirect(Sentence).

% Check if the sentence contains any single-word emotional manipulation indicator
contains_single_conversation_control_emotion(Sentence) :-
    member(Word, Sentence),
    conversation_control_emotion(Word).

% Check if the sentence contains any split emotional manipulation pattern
contains_split_conversation_control_emotion(Sentence) :-
    member(First, Sentence),
    member(Second, Sentence),
    First \= Second,
    split_emotion_pattern(First, Second).

% Check if the sentence contains any emotional manipulation indicator (single or split)
contains_conversation_control_emotion(Sentence) :-
    contains_single_conversation_control_emotion(Sentence);
    contains_split_conversation_control_emotion(Sentence).

% Check if the sentence contains any conversation control pattern
contains_conversation_control(Sentence) :-
    contains_conversation_control_interrupt(Sentence);
    contains_conversation_control_redirect(Sentence);
    contains_conversation_control_emotion(Sentence).

% Full rule to check for conversation control
has_conversation_control(Sentence) :-
    contains_conversation_control(Sentence).

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

% Calculate score for a rule with the new formula
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

% Non-backtracking detect_all_rules to replace detect_scam
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
    write('RECOMMENDATION:'), nl,
    write('----------------------------------------'), nl,
    (   ThreatLevel = low ->
        write('Low risk detected. Continue with caution.')
    ;   ThreatLevel = medium ->
        write('Medium risk detected. Verify the identity of the sender and do not share sensitive information.')
    ;   ThreatLevel = high ->
        write('High risk detected. This is likely a scam attempt. Do not engage further.')
    ;   ThreatLevel = critical ->
        write('CRITICAL RISK DETECTED! This is almost certainly a scam. Terminate communication immediately and report to authorities.')
    ),
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

% Example usage:
% ?- analyze_message([['ผม', 'มาจาก', 'ธนาคาร', 'กรุงไทย'], ['กรุณายืนยัน', 'ข้อมูลส่วนตัว', 'ด่วน'], ['ต้องทำทันที', 'เสี่ยงต่อ', 'ปิดบัญชี']]).