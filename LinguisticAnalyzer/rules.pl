:- encoding(utf8).

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
urgency_word('ด่วน').
urgency_word('ทันที').
urgency_word('กรุณาดำเนินการ').
urgency_word('กรุณาติดต่อกลับ').
urgency_word('โปรดติดต่อ').
urgency_word('โปรดตอบกลับ').
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

contains_urgency(Sentence) :-
    member(Word, Sentence),
    urgency_word(Word).

has_urgency_claim(Sentence) :-
    contains_urgency(Sentence).

% =============== INFORMATION REQUEST COMPONENTS ===============

% Action Verbs (verbs related to requesting or confirming information)
info_request_action('กรุณาส่ง').
info_request_action('กรุณายืนยัน').
info_request_action('กรุณากรอก').
info_request_action('ยืนยัน').
info_request_action('กรุณาตอบ').
info_request_action('ต้องการ').

% Information or Personal Data being requested
info_request_data('ข้อมูลส่วนตัว').
info_request_data('ข้อมูลส่วนบุคคล').
info_request_data('ชื่อบัญชี').
info_request_data('ชื่อเต็ม').
info_request_data('หมายเลขโทรศัพท์').
info_request_data('อีเมล').
info_request_data('หมายเลขบัตรเครดิต').
info_request_data('วันหมดอายุ').

% Check if the sentence contains any action verb related to information requests
contains_info_request_action(Sentence) :-
    member(Word, Sentence),
    info_request_action(Word).

% Check if the sentence contains any request object (e.g., personal data, email, etc.)
contains_info_request_data(Sentence) :-
    member(Word, Sentence),
    info_request_data(Word).

% Check if the sentence contains any of the information request components
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

% Common words related to threats and harm
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

% Check if the sentence contains any threat-related word
contains_threat(Sentence) :-
    member(Word, Sentence),
    threat_word(Word).

% Full rule to check for threat pattern
has_threat_claim(Sentence) :-
    contains_threat(Sentence).


% =============== VERIFICATION RESISTANCE INDICATORS ===============

% Common phrases related to resisting verification or discouraging it
verification_resistance_word('ไม่ต้องยืนยัน').   % No need to confirm
verification_resistance_word('ไม่ต้องตรวจสอบ').  % No need to check
verification_resistance_word('ยืนยันไม่จำเป็น'). % Confirmation not necessary
verification_resistance_word('ไม่ต้องสอบถาม').   % No need to ask
verification_resistance_word('ไม่จำเป็นต้องยืนยันตัวตน'). % No need to verify identity
verification_resistance_word('ไม่สามารถรอการยืนยัน'). % Can't wait for confirmation
verification_resistance_word('ต้องทำทันที').      % Must do immediately
verification_resistance_word('อย่ารอการยืนยัน'). % Don’t wait for confirmation

% Check if the sentence contains any resistance to verification word
contains_verification_resistance(Sentence) :-
    member(Word, Sentence),
    verification_resistance_word(Word).

% Full rule to check for verification resistance
has_verification_resistance(Sentence) :-
    contains_verification_resistance(Sentence).

% =============== CONVERSATION CONTROL INDICATORS ===============

% Excessive Interrupting or discouraging questions
conversation_control_interrupt('ไม่ต้องถาม').    % No need to ask
conversation_control_interrupt('ไม่จำเป็นต้องรู้').  % No need to know
conversation_control_interrupt('ไม่ควรถามเรื่องนี้'). % Shouldn't ask this question
conversation_control_interrupt('อย่าถามมาก').   % Don’t ask too much

% Redirecting conversation to avoid details or questions
conversation_control_redirect('เรามาพูดถึงเรื่องนี้ก่อน'). % Let’s talk about this first
conversation_control_redirect('ไม่ต้องสนใจเรื่องนั้น').    % Don't worry about that
conversation_control_redirect('ขอเปลี่ยนเรื่องก่อน').      % Let’s change the topic

% Emotional manipulation phrases (Fear, Excitement, Sympathy)
conversation_control_emotion('ถ้าคุณไม่ทำตามจะมีปัญหามาก'). % If you don't follow, there will be problems
conversation_control_emotion('คุณต้องรีบทำเพื่อไม่ให้เกิดผลเสีย'). % You need to act quickly to avoid consequences
conversation_control_emotion('อย่าปล่อยให้พลาดโอกาสนี้').  % Don’t let this opportunity pass by
conversation_control_emotion('คุณจะช่วยเราได้ไหม').       % Can you help us?

% Check if the sentence contains any conversation control related to interruption
contains_conversation_control_interrupt(Sentence) :-
    member(Word, Sentence),
    conversation_control_interrupt(Word).

% Check if the sentence contains any conversation control related to redirection
contains_conversation_control_redirect(Sentence) :-
    member(Word, Sentence),
    conversation_control_redirect(Word).

% Check if the sentence contains any emotional manipulation
contains_conversation_control_emotion(Sentence) :-
    member(Word, Sentence),
    conversation_control_emotion(Word).

% Check if the sentence contains any conversation control pattern
contains_conversation_control(Sentence) :-
    contains_conversation_control_interrupt(Sentence);
    contains_conversation_control_redirect(Sentence);
    contains_conversation_control_emotion(Sentence).

% Full rule to check for conversation control
has_conversation_control(Sentence) :-
    contains_conversation_control(Sentence).




% ==========================
% Scam Detection Rules
% ==========================

% Rule for detecting authority claims
detect_scam_authority_claim(Sentence) :-
    has_authority_claim(Sentence),
    write('Matched Rule: detect_scam_authority_claim'), nl.

% Rule for detecting urgency patterns
detect_scam_urgency(Sentence) :-
    has_urgency_claim(Sentence),
    write('Matched Rule: detect_scam_urgency'), nl.

% Rule for detecting information requests
detect_scam_info_request(Sentence) :-
    has_info_request(Sentence),
    write('Matched Rule: detect_scam_info_request'), nl.

% Rule for detecting transaction requests
detect_scam_transaction_request(Sentence) :-
    has_transaction_request(Sentence),
    write('Matched Rule: detect_scam_transaction_request'), nl.

% Rule for detecting threats
detect_scam_threat(Sentence) :-
    has_threat_claim(Sentence),
    write('Matched Rule: detect_scam_threat'), nl.

% Rule for detecting verification resistance
detect_scam_verification_resistance(Sentence) :-
    has_verification_resistance(Sentence),
    write('Matched Rule: detect_scam_verification_resistance'), nl.

% Rule for detecting conversation control
detect_scam_conversation_control(Sentence) :-
    has_conversation_control(Sentence),
    write('Matched Rule: detect_scam_conversation_control'), nl.

% Main rule for scam detection
detect_scam([], []).

detect_scam([Sentence|Rest], [Sentence|Matches]) :-
    (
        detect_scam_authority_claim(Sentence); 
        detect_scam_urgency(Sentence); 
        detect_scam_info_request(Sentence); 
        detect_scam_transaction_request(Sentence);
        detect_scam_threat(Sentence); % Including threat detection
        detect_scam_verification_resistance(Sentence);
        detect_scam_conversation_control(Sentence)
    ),
    detect_scam(Rest, Matches).

detect_scam([_|Rest], Matches) :-
    detect_scam(Rest, Matches).
    
% % ==============================
% % RULES FOR SCAM DETECTION PATTERNS
% % ==============================

% % Check if the sentence contains an authority claim
% detect_scam_authority_claim(Sentence) :-
%     has_authority_claim(Sentence).

% % Check if the sentence contains an urgency pattern
% detect_scam_urgency(Sentence) :-
%     has_urgency_claim(Sentence).

% % Check if the sentence contains an information request pattern
% detect_scam_info_request(Sentence) :-
%     has_info_request(Sentence).

% % Check if the sentence contains a transaction request pattern
% detect_scam_transaction_request(Sentence) :-
%     has_transaction_request(Sentence).

% detect_scam_threat(Sentence) :-
%     has_threat_claim(Sentence).

% % Check if the sentence contains a verification resistance pattern
% detect_scam_verification_resistance(Sentence) :-
%     has_verification_resistance(Sentence).

% detect_scam_conversation_control(Sentence) :-
%     has_conversation_control(Sentence).
% % ==============================
% % MAIN DETECTION RULE
% % ==============================
% detect_scam([], []).

% detect_scam([Sentence|Rest], [Sentence|Matches]) :-
%     (detect_scam_authority_claim(Sentence); 
%     detect_scam_urgency(Sentence); 
%     detect_scam_info_request(Sentence); 
%     detect_scam_transaction_request(Sentence);
%     detect_scam_threat(Sentence)),  % Include the threat detection here
%     detect_scam(Rest, Matches).

% detect_scam([_|Rest], Matches) :-
%     detect_scam(Rest, Matches).

    


    

