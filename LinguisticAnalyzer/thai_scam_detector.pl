:- encoding(utf8).

% Calculate total scam score with word count multiplier
detect_scam(Sentences, ScamReport, TotalScore, RiskCategory) :-
    % Flatten the list of sentences
    flatten_list(Sentences, FlattenedWords),
    
    % Count total words for density calculation
    length(FlattenedWords, TotalWordCount),
    
    % Detect scam categories
    detect_scam_categories(FlattenedWords, ScamCategories),
    
    % Calculate total score with word count factor
    calculate_weighted_score(ScamCategories, TotalWordCount, TotalScore, ScamReport),
    
    % Determine risk level
    enhanced_risk_level(TotalScore, RiskCategory).  

% Improved Bank Impersonation Category with more comprehensive keyword matching
scam_category(bank_impersonation, 
    [
        % Bank-related impersonation words - expanded
        'ฝ่ายความปลอดภัย',   % Security department
        'ความปลอดภัย',       % Security (partial match)
        'ฝ่าย',              % Department (partial match)
        'ธนาคาร',            % Bank
        'กรุงไทย',           % Krungthai (bank name)
        'กสิกร',             % Kasikorn (bank name)
        'ไทยพาณิชย์',        % SCB (bank name)
        'กรุงเทพ',           % Bangkok Bank (bank name)
        'ออมสิน',            % GSB (bank name)
        'กรุงศรี',           % Bank of Ayudhya (bank name)
        'บัญชี',             % Account
        'ล็อคบัญชี',         % Lock account
        'ระงับบัญชี',         % Suspend account 
        'ล็อค',              % Lock (partial match)
        'ปลดล็อค',           % Unlock
        'ระงับ',             % Block/suspend
        'เจ้าหน้าที่',        % Official
        'ตรวจสอบ',           % Verify
        'ธุรกรรม',           % Transaction
        'น่าสงสัย',          % Suspicious
        'ผู้จัดการ',          % Manager
        'ระบบ',              % System
        'อินเตอร์เน็ตแบงค์',   % Internet banking
        'แบงค์กิ้ง',          % Banking
        'แบงค์',             % Bank (colloquial)
        'อัพเดท',            % Update
        'ข้อมูลบัญชี'         % Account information
    ], 
    'Sophisticated impersonation of bank officials to manipulate victims').

% Improved Financial Pressure Category
scam_category(financial_pressure, 
    [
        % Financial manipulation words - expanded
        'หนี้',              % Debt
        'ชำระเงิน',          % Payment
        'โอน',               % Transfer
        'โอนเงิน',           % Transfer money
        'ถอน',               % Withdraw
        'เงิน',              % Money
        'บัตรเครดิต',        % Credit card
        'เบิกเงิน',          % Cash withdrawal
        'ค้างชำระ',          % Overdue
        'ค่าปรับ',           % Penalty
        'งวด',               % Installment
        'ต่างประเทศ',        % Foreign country (often used in money transfer scams)
        'จำนวน',             % Amount
        'บาท',               % Baht (Thai currency)
        'สูญเสียเงิน',        % Lose money
        'เหลือ',             % Remaining
        'บัญชีชั่วคราว',      % Temporary account
        'โอนกลับ',           % Transfer back
        'กลับ'               % Back (in context of money)
    ], 
    'Elaborate financial manipulation tactics to create urgent monetary pressure').

% Improved Personal Information Request Category
scam_category(personal_info_request, 
    [
        % Personal information extraction words - expanded
        'ข้อมูลส่วนตัว',      % Personal information
        'รหัสผ่าน',          % Password
        'รหัส',              % Code/Password (partial)
        'PIN',
        'OTP',
        'SMS',               % SMS (often used for OTP delivery)
        'เบอร์โทร',          % Phone number
        'อีเมล',             % Email
        'ลงทะเบียน',         % Register
        'ตรวจสอบตัวตน',      % Verify identity
        'ยืนยัน',            % Confirm
        'ยืนยันตัวตน',        % Identity verification
        'กรอกข้อมูล',         % Fill in information
        'แจ้ง',              % Notify/Inform
        'เข้าระบบ',          % Log in
        'เข้าสู่ระบบ',        % Log in (formal)
        'ล็อกอิน',           % Login (transliteration)
        'ไอดี',              % ID
        'เลขบัตรประชาชน',    % ID card number
        'เลขหลังบัตร'        % Card verification value
    ], 
    'Sophisticated social engineering to extract sensitive personal details').

% Improved Urgency Manipulation Category
scam_category(urgency_manipulation, 
    [
        % Urgency and pressure-related words - expanded
        'ด่วน',              % Urgent
        'เร่งด่วน',          % Extremely urgent
        'ความเร่งด่วน',       % Urgency
        'ก่อนที่',            % Before
        'ทันที',             % Immediately
        'ภายใน',             % Within
        'รีบ',               % Hurry
        'ต้อง',              % Must
        'จำเป็น',            % Necessary
        'จำเป็นต้อง',         % Must necessarily
        'เสี่ยง',            % Risk
        'กำลังจะ',           % About to
        'ไม่เช่นนั้น',        % Otherwise
        'มิฉะนั้น',          % Otherwise (formal)
        'ชั่วคราว',          % Temporary
        'ถาวร',              % Permanent
        'ปัญหา',             % Problem
        'ไม่สามารถ',         % Cannot
        'ไม่ได้',            % Cannot (colloquial)
        'หมดเวลา'           % Time's up
    ], 
    'Advanced psychological manipulation using time pressure and fear').

% Improved Threat/Intimidation Category
scam_category(threat_intimidation, 
    [
        % Threat and coercion words - expanded
        'หลอก',              % Deceive
        'ฉ้อโกง',            % Fraud
        'ลวง',               % Trick
        'ข่มขู่',             % Threaten
        'ระวัง',             % Beware
        'ดำเนินคดี',         % Legal action
        'ความผิด',           % Offense
        'จับกุม',            % Arrest
        'ปรับ',              % Fine
        'อาจ',               % May (as in "you may lose...")
        'สูญ',               % Lose
        'เสียหาย',           % Damage
        'อันตราย',           % Danger
        'ผิดกฎหมาย',         % Illegal
        'แจ้งความ',          % File a police report
        'อาชญากรรม',         % Crime
        'มิจฉาชีพ',          % Criminal
        'แก๊ง',              % Gang
        'อย่าบอกใคร',        % Don't tell anyone
        'เป็นความลับ'        % Confidential
    ], 
    'Complex psychological manipulation through fear and legal threats').

% Improved Government Impersonation Category
scam_category(government_impersonation, 
    [
        % Government impersonation words - expanded
        'ตำรวจ',            % Police
        'กรมสรรพากร',       % Revenue Department
        'ศาล',              % Court
        'ทนายความ',         % Lawyer
        'กระทรวง',          % Ministry
        'ภาษี',             % Tax
        'ติดต่อด่วน',        % Urgent contact
        'เอกสารราชการ',     % Official documents
        'พัสดุ',            % Parcel
        'ไปรษณีย์',         % Post office
        'ประกัน',           % Insurance
        'ราชการ',           % Government
        'หน่วยงาน',         % Agency
        'สำนักงาน',         % Office
        'ข้าราชการ',        % Government officer
        'ใบแจ้งหนี้',        % Bill/Invoice
        'ค่าใช้จ่าย'         % Expenses
    ], 
    'Impersonation of government officials, police, or legal authorities to instill fear and compliance').

% Improved Job Opportunity Scam Category
scam_category(job_opportunity_scam, 
    [
        % Job scam related words
        'งานออนไลน์',        % Online job
        'รายได้เสริม',       % Extra income
        'งานพิเศษ',         % Part-time job
        'รายได้พิเศษ',       % Special income
        'สมัครงาน',         % Job application
        'เงินเดือนสูง',      % High salary
        'งานง่าย',          % Easy job
        'ค่าลงทะเบียน',     % Registration fee
        'ค่ามัดจำ',         % Deposit fee
        'งานฟรีแลนซ์',      % Freelance job
        'ทำงานที่บ้าน',      % Work from home
        'รายได้หลักแสน',    % Six-figure income
        'อิสระทางการเงิน',   % Financial freedom
        'ลงทุนน้อย'         % Small investment
    ], 
    'Elaborate fake job offers that require upfront payment or personal information').

% Improved Shopping Delivery Scam Category
scam_category(shopping_delivery_scam, 
    [
        % Online shopping/delivery scam words
        'สินค้า',            % Product
        'โปรโมชัน',          % Promotion
        'ส่วนลด',           % Discount
        'จัดส่ง',            % Delivery
        'สั่งซื้อ',          % Order
        'ค่าส่ง',            % Shipping fee
        'ลดราคา',           % Price reduction
        'สินค้าหมด',         % Out of stock
        'ชำระเงินปลายทาง',   % Cash on delivery
        'ติดตามพัสดุ',       % Package tracking
        'ส่งฟรี',           % Free shipping
        'ของแท้',           % Authentic product
        'ลดล้างสต๊อก',       % Clearance sale
        'สั่งซื้อวันนี้'      % Order today
    ], 
    'Fraudulent online shopping sites or delivery status manipulation').

% Improved Isolation Tactics Category (NEW)
scam_category(isolation_tactics, 
    [
        % Words used to isolate victims
        'อย่าบอก',           % Don't tell
        'ห้ามบอก',           % Forbidden to tell
        'เป็นความลับ',        % It's a secret
        'ไม่ต้องบอกใคร',      % Don't need to tell anyone
        'ระหว่างเรา',         % Between us
        'ลับเฉพาะ',           % Confidential
        'รั่วไหล',            % Leak
        'ร่วมมือ',            % Cooperate
        'คนใน',              % Insider
        'แฮ็ก',              % Hack
        'ดักฟัง',             % Wiretap
        'ติดตาม',             % Monitor/track
        'ไม่ปลอดภัย'          % Not safe
    ],
    'Tactics to isolate victims from friends, family, or legitimate authorities who might intervene').

% Scoring for enhanced categories
category_score(bank_impersonation, 40).
category_score(financial_pressure, 35).
category_score(personal_info_request, 45).
category_score(urgency_manipulation, 40).
category_score(prize_lottery, 30).
category_score(threat_intimidation, 40).
category_score(online_service_impersonation, 35).
category_score(investment_crypto_scam, 35).
category_score(romance_social_engineering, 30).
category_score(government_impersonation, 40).
category_score(job_opportunity_scam, 30).
category_score(shopping_delivery_scam, 25).
category_score(religious_spiritual_scam, 35).
category_score(mobile_app_scam, 30).
category_score(covid_healthcare_scam, 35).
category_score(tourism_travel_scam, 25).
category_score(student_education_scam, 30).
category_score(isolation_tactics, 50).

% Enhanced pattern matching system
word_match(Word, Pattern) :-
    sub_atom(Word, _, _, _, Pattern).

% Enhanced detect_scam_categories with partial word matching
detect_scam_categories(Words, ScamCategories) :-
    findall(
        (Category, Score, Reason, MatchedWordList),
        (
            scam_category(Category, CategoryWords, Reason),
            category_score(Category, Score),
            findall(
                MatchedWord, 
                (
                    member(Word, Words),
                    member(CategoryKeyword, CategoryWords),
                    (
                        Word = CategoryKeyword -> MatchedWord = Word;
                        (word_match(Word, CategoryKeyword) -> MatchedWord = Word;
                         word_match(CategoryKeyword, Word) -> MatchedWord = Word;
                         fail)
                    )
                ),
                MatchedWordList
            ),
            MatchedWordList \= []
        ),
        ScamCategories
    ).% Sum up category scores with word density factor
calculate_weighted_score([], _, 0, []).
calculate_weighted_score([(Category, Score, Reason, MatchedWords)|Rest], TotalWordCount, TotalScore, 
                    [(Category, WeightedScore, Reason, MatchedWords)|ProcessedRest]) :-
    calculate_weighted_score(Rest, TotalWordCount, RestScore, ProcessedRest),
    
    % Count unique matched words for this category
    sort(MatchedWords, UniqueMatched),
    length(UniqueMatched, UniqueCount),
    
    % Calculate weight based on density and importance
    Weight is max(1, min(3, UniqueCount / 5)),
    WeightedScore is round(Score * Weight),
    
    TotalScore is RestScore + WeightedScore.

% Enhanced risk categorization
enhanced_risk_level(Score, RiskCategory) :-
    (Score =< 30 -> RiskCategory = low_risk;
     Score =< 70 -> RiskCategory = medium_risk;
     Score =< 120 -> RiskCategory = high_risk;
     RiskCategory = critical_risk).

% Flatten a list of lists into a single list
flatten_list([], []).
flatten_list([L|Ls], FlatList) :-
    flatten_list(Ls, RestFlat),
    append(L, RestFlat, FlatList).

% Additional rule to specifically detect common bank scam patterns
detect_bank_scam_pattern(Words, IsLikelyBankScam) :-
    % Key patterns that strongly indicate banking scams
    bank_words(BankTerms),
    urgent_words(UrgentTerms),
    sensitive_info_words(SensitiveTerms),
    money_words(MoneyTerms),
    
    % Count occurrences
    count_matches(Words, BankTerms, BankCount),
    count_matches(Words, UrgentTerms, UrgentCount),
    count_matches(Words, SensitiveTerms, SensitiveCount),
    count_matches(Words, MoneyTerms, MoneyCount),
    
    % Calculate bank scam likelihood score
    BankScamScore is BankCount*5 + UrgentCount*3 + SensitiveCount*8 + MoneyCount*4,
    
    % If score is above threshold, it's likely a bank scam
    (BankScamScore >= 40 -> IsLikelyBankScam = true; IsLikelyBankScam = false).

% Common word groups for pattern detection
bank_words(['ธนาคาร', 'บัญชี', 'เงิน', 'โอน', 'ระบบ', 'ล็อค', 'ระงับ', 'ตรวจสอบ']).
urgent_words(['ด่วน', 'ทันที', 'เร่งด่วน', 'ชั่วคราว', 'ถาวร', 'รีบ', 'ภายใน']).
sensitive_info_words(['รหัส', 'OTP', 'PIN', 'รหัสผ่าน', 'ยืนยัน', 'ตัวตน']).
money_words(['เงิน', 'โอน', 'บาท', 'จำนวน', 'ชำระ', 'ค่า']).

% Count matching words from a list
count_matches([], _, 0).
count_matches([Word|Rest], TargetTerms, Count) :-
    (member(Target, TargetTerms), (word_match(Word, Target); word_match(Target, Word))) ->
        count_matches(Rest, TargetTerms, RestCount),
        Count is RestCount + 1;
        count_matches(Rest, TargetTerms, Count).

% Comprehensive detection (original version)
comprehensive_scam_detection(Sentences, DetailedReport) :-
    flatten_list(Sentences, Words),
    
    % Standard category detection
    detect_scam_categories(Words, Categories),
    calculate_weighted_score(Categories, _, Score, _),
    enhanced_risk_level(Score, Risk),
    
    % Bank scam pattern detection
    detect_bank_scam_pattern(Words, IsBankScam),
    
    % Create comprehensive report
    create_detailed_report(Categories, Score, Risk, IsBankScam, Words, DetailedReport).

create_detailed_report(Categories, Score, Risk, IsBankScam, Words, 
                      report(Score, Risk, Categories, IsBankScam, WordCount, Recommendation)) :-
    length(Words, WordCount),
    
    % Generate specific recommendation based on detected patterns
    (IsBankScam == true ->
        Recommendation = 'แพตเทิร์นของข้อความนี้ตรงกับการหลอกลวงทางธนาคาร โปรดติดต่อธนาคารโดยตรงทางช่องทางที่เป็นทางการเท่านั้น อย่าโอนเงินหรือให้รหัส OTP ในทุกกรณี';
        
        Risk == critical_risk ->
        Recommendation = 'ข้อความนี้มีความเสี่ยงสูงมาก และมีลักษณะของการหลอกลวงหลายรูปแบบ ควรบล็อกและรายงานไปยังหน่วยงานที่เกี่ยวข้อง';
        
        Risk == high_risk ->
        Recommendation = 'ข้อความนี้มีความเสี่ยงสูง ไม่ควรให้ข้อมูลส่วนตัวหรือทำธุรกรรมตามที่ร้องขอ';
        
        Risk == medium_risk ->
        Recommendation = 'ข้อความนี้มีความเสี่ยงปานกลาง ควรตรวจสอบความถูกต้องจากแหล่งข้อมูลที่เชื่อถือได้ก่อนดำเนินการใดๆ';
        
        Recommendation = 'ข้อความนี้มีความเสี่ยงต่ำ แต่ควรพิจารณาอย่างรอบคอบก่อนดำเนินการตาม'
    ).

% ==============================================================
% SENTENCE-LEVEL DETECTION ENHANCEMENTS
% ==============================================================

% Analyze each sentence individually, then combine results
sentence_level_detection(Sentences, SentenceScores, SentenceCategories, NarrativeFlow) :-
    % Analyze each sentence separately
    maplist(analyze_single_sentence, Sentences, SentenceAnalyses),
    
    % Extract scores and categories
    maplist(extract_sentence_score, SentenceAnalyses, SentenceScores),
    maplist(extract_sentence_categories, SentenceAnalyses, SentenceCategories),
    
    % Analyze narrative flow (intro, problem, urgency, action)
    analyze_narrative_flow(SentenceAnalyses, NarrativeFlow).

% Analyze a single sentence
analyze_single_sentence(Sentence, sentence_analysis(Sentence, Categories, Score, DensityScore, KeyCombinations)) :-
    % Detect categories for this sentence
    detect_scam_categories(Sentence, Categories),
    
    % Calculate raw score
    calculate_weighted_score(Categories, _, Score, _),
    
    % Calculate density score (higher when more keywords in shorter sentence)
    length(Sentence, SentenceLength),
    flatten_categories_words(Categories, AllMatchedWords),
    length(AllMatchedWords, MatchCount),
    
    % Density formula: matched words / total words, scaled
    (SentenceLength > 0 ->
        Density is (MatchCount / SentenceLength) * 100,
        DensityScore is round(Density * 2);
        DensityScore = 0
    ),
    
    % Detect key combinations in same sentence
    detect_keyword_combinations(Sentence, KeyCombinations).

% Extract combined list of matched words from all categories
flatten_categories_words([], []).
flatten_categories_words([(_, _, _, MatchedWords)|Rest], AllWords) :-
    flatten_categories_words(Rest, RestWords),
    append(MatchedWords, RestWords, AllWords).

% Extract score from sentence analysis
extract_sentence_score(sentence_analysis(_, _, Score, DensityScore, KeyCombinations), 
                        sentence_score(Score, DensityScore, CombinationScore)) :-
    length(KeyCombinations, CombCount),
    CombinationScore is CombCount * 15.  % Each key combination adds 15 points

% Extract categories from sentence analysis
extract_sentence_categories(sentence_analysis(_, Categories, _, _, _), Categories).

% ==============================================================
% PROXIMITY DETECTION
% ==============================================================

% Key combinations that are suspicious when in the same sentence
suspicious_combination(auth_request, ['ยืนยัน', 'รหัส']).          % Verify + code
suspicious_combination(auth_request, ['OTP', 'แจ้ง']).             % OTP + inform
suspicious_combination(auth_request, ['รหัสผ่าน', 'เข้าสู่ระบบ']).  % Password + login
suspicious_combination(money_auth, ['เงิน', 'โอน', 'ยืนยัน']).      % Money + transfer + verify
suspicious_combination(emergency_auth, ['ด่วน', 'ยืนยัน']).         % Urgent + verify
suspicious_combination(emergency_auth, ['ทันที', 'รหัส']).          % Immediate + code
suspicious_combination(isolation, ['อย่าบอก', 'ใคร']).             % Don't tell + anyone
suspicious_combination(bank_emergency, ['ธนาคาร', 'ด่วน']).         % Bank + urgent
suspicious_combination(bank_emergency, ['บัญชี', 'ระงับ']).         % Account + suspend
suspicious_combination(threatening, ['เสี่ยง', 'สูญเสีย']).         % Risk + lose
suspicious_combination(threatening, ['ไม่', 'ดำเนินการ', 'ทันที']).  % Not + act + immediately

% Detect keyword combinations in a sentence
detect_keyword_combinations(Sentence, DetectedCombinations) :-
    findall(
        combo(Type, Words),
        (
            suspicious_combination(Type, Combination),
            % Check if ALL words in the combination are in the sentence
            forall(member(Word, Combination), 
                    (member(MatchedWord, Sentence), 
                    (word_match(MatchedWord, Word); word_match(Word, MatchedWord)))),
            Words = Combination
        ),
        DetectedCombinations
    ).

% ==============================================================
% NARRATIVE FLOW ANALYSIS
% ==============================================================

% Narrative elements in scam messages
narrative_element(introduction, ['สวัสดี', 'ครับ', 'ค่ะ', 'นาย', 'ดิฉัน', 'ผม', 'จาก', 'เป็น', 'แจ้ง']).
narrative_element(authority_claim, ['ธนาคาร', 'เจ้าหน้าที่', 'ฝ่าย', 'ความปลอดภัย', 'ผู้จัดการ', 'บริษัท']).
narrative_element(problem_statement, ['พบ', 'ตรวจพบ', 'ปัญหา', 'ผิดปกติ', 'น่าสงสัย', 'ธุรกรรม', 'ระงับ']).
narrative_element(urgency_creation, ['ด่วน', 'ทันที', 'เร่งด่วน', 'ภายใน', 'ไม่เช่นนั้น', 'ถาวร', 'จำเป็น']).
narrative_element(action_request, ['ตรวจสอบ', 'ยืนยัน', 'โอน', 'แจ้ง', 'รหัส', 'OTP', 'รหัสผ่าน', 'SMS']).
narrative_element(isolation_request, ['อย่าบอก', 'ไม่ต้องบอก', 'เป็นความลับ', 'ระหว่างเรา', 'ร่วมมือ', 'แก๊ง']).

% Analyze the narrative flow of the message
analyze_narrative_flow(SentenceAnalyses, NarrativeFlow) :-
    % For each narrative element, find where it appears in the message
    findall(
        narrative(Element, Position, Strength),
        (
            narrative_element(Element, Keywords),
            find_narrative_element_position(Keywords, SentenceAnalyses, Position, Strength)
        ),
        NarrativeElements
    ),
    
    % Check for typical scam narrative pattern
    check_narrative_pattern(NarrativeElements, NarrativeFlow).

% Find where a narrative element appears in the message
find_narrative_element_position(Keywords, SentenceAnalyses, Position, Strength) :-
    % Enumerate sentences with position index
    length(SentenceAnalyses, TotalSentences),
    findall(
        (Pos, MatchCount),
        (
            between(1, TotalSentences, Pos),
            nth1(Pos, SentenceAnalyses, sentence_analysis(Sentence, _, _, _, _)),
            % Count matching keywords
            count_narrative_keywords(Sentence, Keywords, MatchCount)
        ),
        PositionMatches
    ),
    
    % Find position with maximum match
    max_match_position(PositionMatches, Position, Strength).

% Count matching narrative keywords in a sentence
count_narrative_keywords(Sentence, Keywords, Count) :-
    findall(
        Match,
        (
            member(Word, Sentence),
            member(Keyword, Keywords),
            (word_match(Word, Keyword); word_match(Keyword, Word)),
            Match = Word
        ),
        Matches
    ),
    length(Matches, Count).

% Find position with maximum match count
max_match_position([], 0, 0).
max_match_position([(Pos, Count)], Pos, Count).
max_match_position([(Pos1, Count1), (Pos2, Count2)|Rest], MaxPos, MaxCount) :-
    (Count1 >= Count2 ->
        max_match_position([(Pos1, Count1)|Rest], MaxPos, MaxCount);
        max_match_position([(Pos2, Count2)|Rest], MaxPos, MaxCount)
    ).

% Check for typical scam narrative pattern
check_narrative_pattern(NarrativeElements, flow(Score, HasPattern, Elements)) :-
    % Extract positions
    findall(
        pos(Element, Position, Strength),
        member(narrative(Element, Position, Strength), NarrativeElements),
        ElementPositions
    ),
    
    % Check if we have the typical scam flow pattern:
    % 1. Introduction/authority at beginning
    % 2. Problem statement after introduction
    % 3. Urgency creation in middle/late
    % 4. Action request toward end
    % 5. Optional isolation request at end
    
    % Check introduction/authority at beginning
    (find_element_in_range(ElementPositions, introduction, 1, 2, IntroStrength) -> true; IntroStrength = 0),
    (find_element_in_range(ElementPositions, authority_claim, 1, 3, AuthStrength) -> true; AuthStrength = 0),
    (find_element_in_range(ElementPositions, problem_statement, 2, 5, ProblemStrength) -> true; ProblemStrength = 0),
    
    % Check urgency in middle-late
    (find_element_in_range(ElementPositions, urgency_creation, 3, 10, UrgencyStrength) -> true; UrgencyStrength = 0),
    
    % Check action request toward end
    find_element_position(ElementPositions, action_request, ActionPos, ActionStrength),
    find_element_position(ElementPositions, isolation_request, IsolationPos, IsolationStrength),
    
    % Build narrative elements list
    Elements = [
        element(introduction, IntroStrength),
        element(authority_claim, AuthStrength),
        element(problem_statement, ProblemStrength),
        element(urgency_creation, UrgencyStrength),
        element(action_request, ActionStrength),
        element(isolation_request, IsolationStrength)
    ],
    
    % Calculate pattern match score
    BaseScore is IntroStrength + AuthStrength + ProblemStrength + UrgencyStrength + 
                ActionStrength + IsolationStrength,
                
    % Calculate pattern sequence bonus
    (IntroStrength > 0, AuthStrength > 0, ProblemStrength > 0, 
        UrgencyStrength > 0, ActionStrength > 0 ->
        HasPattern = true,
        % Additional score if action request is after urgency
        (ActionPos > 0, find_element_position(ElementPositions, urgency_creation, UrgencyPos, _),
            ActionPos > UrgencyPos ->
            SequenceBonus = 40;
            SequenceBonus = 20
        );
        HasPattern = false,
        SequenceBonus = 0
    ),
    
    % Add isolation bonus if present at the end
    (IsolationStrength > 0, 
        length(ElementPositions, TotalElements),
        IsolationPos >= TotalElements - 2 ->
        IsolationBonus = 25;
        IsolationBonus = 0
    ),
    
    % Final narrative flow score
    Score is BaseScore + SequenceBonus + IsolationBonus.

% Find if an element exists in a specific position range
find_element_in_range(Positions, Element, MinPos, MaxPos, Strength) :-
    member(pos(Element, Position, Strength), Positions),
    Position >= MinPos,
    Position =< MaxPos.

% Find position of a specific element
find_element_position(Positions, Element, Position, Strength) :-
    member(pos(Element, Position, Strength), Positions),
    !.
find_element_position(_, _, 0, 0).

% ==============================================================
% ENHANCED COMPREHENSIVE DETECTION
% ==============================================================

% Enhanced comprehensive detection with sentence-level analysis
enhanced_scam_detection(Sentences, EnhancedReport) :-
    % Perform sentence-level analysis
    sentence_level_detection(Sentences, SentenceScores, SentenceCategories, NarrativeFlow),
    
    % Also perform overall message analysis (original approach)
    flatten_list(Sentences, AllWords),
    detect_scam_categories(AllWords, OverallCategories),
    calculate_weighted_score(OverallCategories, _, OverallScore, _),
    
    % Combine sentence scores
    combine_sentence_scores(SentenceScores, SentenceTotalScore),
    
    % Calculate narrative flow bonus
    NarrativeFlow = flow(NarrativeScore, _, _),
    
    % Add specific bonuses for dangerous combinations across the message
    detect_cross_sentence_patterns(SentenceCategories, CrossPatternScore),
    
    % Calculate final score with all components
    FinalScore is OverallScore + SentenceTotalScore + NarrativeScore + CrossPatternScore,
    
    % Determine risk level
    enhanced_risk_level(FinalScore, RiskLevel),
    
    % Detect bank scam pattern (original)
    detect_bank_scam_pattern(AllWords, IsBankScam),
    
    % Create enhanced report with additional details
    create_enhanced_report(
        OverallCategories, OverallScore, SentenceScores, 
        SentenceCategories, NarrativeFlow, CrossPatternScore,
        FinalScore, RiskLevel, IsBankScam, AllWords, Sentences, 
        EnhancedReport
    ).

% Combine scores from all sentences
combine_sentence_scores(SentenceScores, TotalScore) :-
    sum_sentence_scores(SentenceScores, BaseSum, DensitySum, ComboSum),
    % We give more weight to combinations and density
    TotalScore is BaseSum + (DensitySum * 2) + (ComboSum * 3).

% Sum up individual sentence scores
sum_sentence_scores([], 0, 0, 0).
sum_sentence_scores([sentence_score(Score, DensityScore, ComboScore)|Rest], 
                    TotalScore, TotalDensity, TotalCombo) :-
    sum_sentence_scores(Rest, RestScore, RestDensity, RestCombo),
    TotalScore is RestScore + Score,
    TotalDensity is RestDensity + DensityScore,
    TotalCombo is RestCombo + ComboScore.

% Detect dangerous patterns across sentences (sequence patterns)
detect_cross_sentence_patterns(SentenceCategories, PatternScore) :-
    % Check for sequence: authority claim -> problem -> urgency -> request
    check_category_sequence(SentenceCategories, AuthRequestScore),
    
    % Check for mix of threat and request categories
    check_threat_request_mix(SentenceCategories, ThreatRequestScore),
    
    PatternScore is AuthRequestScore + ThreatRequestScore.

% Check for sequence patterns across sentences
check_category_sequence(SentenceCategories, Score) :-
    % Check if we have authority claim early
    has_category_in_range(SentenceCategories, 1, 2, bank_impersonation, HasAuth),
    
    % Check if we have problem statement after
    has_category_in_range(SentenceCategories, 2, 4, financial_pressure, HasProblem),
    
    % Check if we have urgency later
    has_category_in_range(SentenceCategories, 3, 6, urgency_manipulation, HasUrgency),
    
    % Check if we have info request at end
    get_sentence_count(SentenceCategories, Count),
    EndPos is max(1, Count - 2),
    has_category_in_range(SentenceCategories, EndPos, Count, personal_info_request, HasRequest),
    
    % Score based on pattern completeness
    (HasAuth = true, HasProblem = true, HasUrgency = true, HasRequest = true ->
        Score = 60;  % Complete pattern
        
        HasAuth = true, (HasProblem = true; HasUrgency = true), HasRequest = true ->
        Score = 35;  % Partial pattern
        
        Score = 0
    ).

% Check if there's a mix of threats and requests
check_threat_request_mix(SentenceCategories, Score) :-
    % Check for threat categories
    (has_category_anywhere(SentenceCategories, threat_intimidation, HasThreat) -> true; HasThreat = false),
    
    % Check for info request
    (has_category_anywhere(SentenceCategories, personal_info_request, HasRequest) -> true; HasRequest = false),
    
    % Check for isolation tactics
    (has_category_anywhere(SentenceCategories, isolation_tactics, HasIsolation) -> true; HasIsolation = false),
    
    % Score based on combination
    (HasThreat = true, HasRequest = true, HasIsolation = true ->
        Score = 45;  % Complete threat+request+isolation
        
        HasThreat = true, HasRequest = true ->
        Score = 30;  % Threat + request
        
        Score = 0
    ).

% Check if a category appears in a specific range of sentences
has_category_in_range(SentenceCategories, Start, End, Category, Result) :-
    between(Start, End, Position),
    nth1(Position, SentenceCategories, CategoriesInSentence),
    member((Category, _, _, _), CategoriesInSentence),
    Result = true,
    !.
has_category_in_range(_, _, _, _, false).

% Check if a category appears anywhere in the message
has_category_anywhere(SentenceCategories, Category, true) :-
    member(SentenceCats, SentenceCategories),
    member((Category, _, _, _), SentenceCats),
    !.
has_category_anywhere(_, _, false).

% Get count of sentences
get_sentence_count(SentenceCategories, Count) :-
    length(SentenceCategories, Count).

% ==============================================================
% ENHANCED REPORTING
% ==============================================================

% Create enhanced report with all analysis components
create_enhanced_report(
    OverallCategories, _, SentenceScores, 
    SentenceCategories, NarrativeFlow, CrossPatternScore,
    FinalScore, RiskLevel, IsBankScam, AllWords, Sentences,
    enhanced_report(
        FinalScore, RiskLevel, OverallCategories, 
        sentence_analysis(SentenceScores, SentenceCategories),
        narrative_analysis(NarrativeFlow, CrossPatternScore),
        message_stats(WordCount, SentenceCount),
        IsBankScam, Recommendation
    )
) :-
    % Count words and sentences
    length(AllWords, WordCount),
    length(Sentences, SentenceCount),
    
    % Generate specific recommendation
    generate_enhanced_recommendation(
        RiskLevel, IsBankScam, NarrativeFlow, OverallCategories, 
        SentenceScores, SentenceCategories, Recommendation
    ).

% Generate enhanced recommendation with more specific details
generate_enhanced_recommendation(
    RiskLevel, IsBankScam, NarrativeFlow, _OverallCategories, 
    _SentenceScores, SentenceCategories, Recommendation
) :-
    NarrativeFlow = flow(_, HasScamPattern, _),
    
    % Check for specific scam types to provide targeted advice
    (IsBankScam == true ->
        BankScamRec = 'ข้อความนี้มีรูปแบบของการหลอกลวงทางธนาคาร โปรดติดต่อธนาคารโดยตรงทางเบอร์บนบัตร ATM หรือเว็บไซต์ทางการ อย่าโอนเงินหรือให้รหัส OTP/PIN';
        BankScamRec = ''
    ),
    
    % Check for personal data requests
    (has_category_anywhere(SentenceCategories, personal_info_request, true) ->
        DataRec = 'ข้อความนี้พยายามที่จะขอข้อมูลส่วนตัว (เช่น รหัส OTP รหัสผ่าน) ซึ่งองค์กรที่น่าเชื่อถือจะไม่ขอข้อมูลเหล่านี้ทางข้อความ';
        DataRec = ''
    ),
    
    % Check for isolation tactics 
    (has_category_anywhere(SentenceCategories, isolation_tactics, true) ->
        IsolationRec = 'ข้อความนี้พยายามขอให้คุณเก็บเรื่องเป็นความลับ ซึ่งเป็นเทคนิคที่หลอกลวงใช้เพื่อป้องกันไม่ให้คุณปรึกษากับคนอื่น';
        IsolationRec = ''
    ),
    
    % Check for narrative flow pattern
    (HasScamPattern == true ->
        NarrativeRec = 'ข้อความนี้มีโครงสร้างที่ตรงกับรูปแบบการหลอกลวงทั่วไป: แนะนำตัวอ้างสิทธิ์ → แจ้งปัญหา → สร้างความเร่งด่วน → ขอข้อมูล/เงิน';
        NarrativeRec = ''
    ),
    
    % Primary recommendation based on risk level
    (RiskLevel == critical_risk ->
        BaseRec = 'ข้อความนี้มีความเสี่ยงสูงมาก และมีลักษณะของการหลอกลวงหลายรูปแบบ ควรบล็อกและรายงานไปยังหน่วยงานที่เกี่ยวข้อง';
        
        RiskLevel == high_risk ->
        BaseRec = 'ข้อความนี้มีความเสี่ยงสูง ไม่ควรให้ข้อมูลส่วนตัวหรือทำธุรกรรมตามที่ร้องขอ';
        
        RiskLevel == medium_risk ->
        BaseRec = 'ข้อความนี้มีความเสี่ยงปานกลาง ควรตรวจสอบความถูกต้องจากแหล่งข้อมูลที่เชื่อถือได้ก่อนดำเนินการใดๆ';
        
        BaseRec = 'ข้อความนี้มีความเสี่ยงต่ำ แต่ควรพิจารณาอย่างรอบคอบก่อนดำเนินการตาม'
    ),
    
    % Combine all recommendations
    atomic_list_concat([BaseRec, BankScamRec, DataRec, IsolationRec, NarrativeRec], ' ', Recommendation).

% ==============================================================
% PRETTY PRINTING FOR ENHANCED REPORT
% ==============================================================

% Enhanced pretty print function for the improved report
pretty_print_enhanced_report(EnhancedReport) :-
    EnhancedReport = enhanced_report(
        FinalScore, RiskLevel, OverallCategories, 
        sentence_analysis(SentenceScores, SentenceCategories),
        narrative_analysis(NarrativeFlow, CrossPatternScore),
        message_stats(WordCount, SentenceCount),
        IsBankScam, Recommendation
    ),
    
    nl, write('====================================================='), nl,
    write('       ENHANCED THAI SCAM MESSAGE ANALYSIS          '), nl,
    write('====================================================='), nl, nl,
    
    % Print overall risk assessment
    format('RISK LEVEL: ~w~n', [RiskLevel]),
    format('FINAL SCAM SCORE: ~w~n', [FinalScore]),
    format('MESSAGE STATS: ~w words in ~w sentences~n', [WordCount, SentenceCount]),
    
    % Bank scam specific detection
    (IsBankScam == true -> 
        write('BANK SCAM DETECTED: YES (High confidence)'), nl;
        write('BANK SCAM DETECTED: NO'), nl
    ),
    
    % Print narrative flow analysis
    NarrativeFlow = flow(NarrativeScore, HasScamPattern, NarrativeElements),
    nl, write('====================================================='), nl,
    write('NARRATIVE ANALYSIS:'), nl,
    write('====================================================='), nl,
    format('Narrative Flow Score: ~w~n', [NarrativeScore]),
    (HasScamPattern == true ->
        write('TYPICAL SCAM STRUCTURE DETECTED: YES'), nl;
        write('TYPICAL SCAM STRUCTURE DETECTED: NO'), nl
    ),
    
    write('Narrative Elements:'), nl,
    print_narrative_elements(NarrativeElements),
    
    format('Cross-Sentence Pattern Score: ~w~n', [CrossPatternScore]),
    
    % Print sentence-by-sentence analysis
    nl, write('====================================================='), nl,
    write('SENTENCE-LEVEL ANALYSIS:'), nl,
    write('====================================================='), nl,
    
    % Print each sentence with its scores and categories
    print_sentence_analysis(SentenceScores, SentenceCategories, 1),
    
    % Print overall categories (from original algorithm)
    nl, write('====================================================='), nl,
    write('OVERALL CATEGORIES DETECTED:'), nl,
    write('====================================================='), nl,
    
    % Sort categories by score (highest first)
    predsort(compare_by_score, OverallCategories, SortedCategories),
    
    % Print each category with score and matched terms
    print_categories(SortedCategories),
    
    nl, write('====================================================='), nl,
    write('RECOMMENDATION:'), nl,
    write('====================================================='), nl,
    write(Recommendation), nl, nl.

% Print narrative elements
print_narrative_elements([]).
print_narrative_elements([element(Element, Strength)|Rest]) :-
    format('  - ~w: Strength ~w~n', [Element, Strength]),
    print_narrative_elements(Rest).

% Print sentence-by-sentence analysis
print_sentence_analysis([], [], _).
print_sentence_analysis([SentScore|RestScores], [SentCats|RestCats], Index) :-
    SentScore = sentence_score(Score, DensityScore, ComboScore),
    
    format('~nSentence #~w:~n', [Index]),
    format('  - Base Score: ~w~n', [Score]),
    format('  - Density Score: ~w~n', [DensityScore]),
    format('  - Combination Score: ~w~n', [ComboScore]),
    
    % Print top categories for this sentence
    write('  - Categories: '),
    print_top_sentence_categories(SentCats, 3),
    
    % Increment index and continue
    NextIndex is Index + 1,
    print_sentence_analysis(RestScores, RestCats, NextIndex).

% Print top N categories in a sentence
print_top_sentence_categories(Categories, N) :-
    % Sort categories by score
    predsort(compare_by_score, Categories, SortedCategories),
    
    % Take top N categories
    take(N, SortedCategories, TopCategories),
    
    % Print them
    maplist(extract_category_name, TopCategories, CategoryNames),
    print_comma_list(CategoryNames),
    nl.

% Extract just the category name from category tuple
extract_category_name((Category, _, _, _), CategoryName) :-
    atom_codes(Category, CategoryCodes),
    maplist(replace_underscore, CategoryCodes, ReadableCodes),
    atom_codes(CategoryName, ReadableCodes).

% Print a comma-separated list
print_comma_list([]).
print_comma_list([Item]) :- 
    write(Item), !.
print_comma_list([Item|Rest]) :- 
    write(Item), write(', '),
    print_comma_list(Rest).

% Compare predicate for sorting categories by score
compare_by_score(Order, (Cat1, Score1, _, _), (Cat2, Score2, _, _)) :-
    (Score1 > Score2 -> Order = (<);
     Score1 < Score2 -> Order = (>);
     compare(Order, Cat1, Cat2)).

% Take first N elements from a list
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Result]) :-
    N > 0,
    N1 is N - 1,
    take(N1, T, Result).

% ==============================================================
% INTERFACE FUNCTION
% ==============================================================

% Main interface function for enhanced detection
analyze_thai_scam_enhanced(Sentences) :-
    enhanced_scam_detection(Sentences, EnhancedReport),
    pretty_print_enhanced_report(EnhancedReport).

% Backward compatibility with original interface
analyze_thai_scam(Sentences) :-
    analyze_thai_scam_enhanced(Sentences).

% Original pretty print function
pretty_print_report(DetailedReport) :-
    DetailedReport = report(TotalScore, RiskLevel, Categories, IsBankScam, WordCount, Recommendation),
    
    nl, write('========================================='), nl,
    write('       THAI SCAM MESSAGE ANALYSIS          '), nl,
    write('========================================='), nl, nl,
    
    % Print overall risk assessment
    format('RISK LEVEL: ~w~n', [RiskLevel]),
    format('TOTAL SCAM SCORE: ~w~n', [TotalScore]),
    format('MESSAGE LENGTH: ~w words~n', [WordCount]),
    
    % Bank scam specific detection
    (IsBankScam == true -> 
        write('BANK SCAM DETECTED: YES (High confidence)'), nl;
        write('BANK SCAM DETECTED: NO'), nl
    ),
    
    nl, write('========================================='), nl,
    write('DETECTED SCAM CATEGORIES:'), nl,
    write('========================================='), nl,
    
    % Sort categories by score (highest first)
    predsort(compare_by_score, Categories, SortedCategories),
    
    % Print each category with score and matched terms
    print_categories(SortedCategories),
    
    nl, write('========================================='), nl,
    write('RECOMMENDATION:'), nl,
    write('========================================='), nl,
    write(Recommendation), nl, nl.

% Original print categories function
print_categories([]).
print_categories([(Category, Score, Reason, MatchedWords)|Rest]) :-
    % Convert category atom to readable string (replace underscores with spaces)
    atom_codes(Category, CategoryCodes),
    maplist(replace_underscore, CategoryCodes, ReadableCodes),
    atom_codes(ReadableCategory, ReadableCodes),
    
    % Capitalize first letter
    capitalize_first(ReadableCategory, CapitalizedCategory),
    
    % Count unique matched words
    sort(MatchedWords, UniqueMatchedWords),
    length(UniqueMatchedWords, UniqueCount),
    length(MatchedWords, TotalCount),
    
    % Print category information
    format('~n■ ~w~n', [CapitalizedCategory]),
    format('  Score: ~w~n', [Score]),
    format('  Matched ~w unique terms (~w total mentions)~n', [UniqueCount, TotalCount]),
    format('  Description: ~w~n', [Reason]),
    
    % Print top matched terms (limited to 10 for readability)
    (UniqueCount > 0 ->
        write('  Key terms detected: '),
        take(10, UniqueMatchedWords, TopTerms),
        print_terms(TopTerms),
        (UniqueCount > 10 -> 
            format(' and ~w more...', [UniqueCount - 10]);
            true
        ),
        nl;
        true
    ),
    
    % Print remaining categories
    print_categories(Rest).

% Original print terms function
print_terms([]).
print_terms([Term]) :- 
    write(Term), !.
print_terms([Term|Rest]) :- 
    write(Term), write(', '),
    print_terms(Rest).

% Original replace underscore function
replace_underscore(0'_, 32) :- !.  % 32 is ASCII for space
replace_underscore(X, X).

% Original capitalize first letter of atom
capitalize_first(Atom, Capitalized) :-
    atom_codes(Atom, [First|Rest]),
    to_upper(First, UpperFirst),
    atom_codes(Capitalized, [UpperFirst|Rest]).