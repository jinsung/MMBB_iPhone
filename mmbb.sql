CREATE TABLE IF NOT EXISTS Section (
	id INTEGER,
	title TEXT,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS Chapter (
	id INTEGER,
	section_id INTEGER,
	title TEXT,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS Unit ( 
	id INTEGER,
	chapter_id INTEGER,
	unit_num INTEGER,
	alphabet_order INTEGER,
	title TEXT,
	is_bookmarked INTEGER,
	bookmarkedDate INTEGER,
	unit_type INTEGER,
	question_group_id INTEGER,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS Tag (
	id INTEGER,
	name TEXT,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS TagUnitRelation (
	unitID INTEGER,
	tagID INTEGER
);

CREATE TABLE IF NOT EXISTS QuestionGroup (
       id INTEGER,
       title TEXT,
       PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS Question (
	id INTEGER,
	q_index INTEGER,
	group_id INTEGER,
	chapter_id INTEGER,
	type INTEGER,
	correct_answer INTEGER,
	answer INTEGER,
	answer_page_visited INTEGER,
	answer_description TEXT,
	PRIMARY KEY (`id`)
);

INSERT INTO QuestionGroup VALUES (NULL, '국토의 이해');
INSERT INTO QuestionGroup VALUES (NULL, '국토의 자연 환경');
INSERT INTO QuestionGroup VALUES (NULL, '국토의 자연 환경');
INSERT INTO QuestionGroup VALUES (NULL, '생활권 형성 기능');
INSERT INTO QuestionGroup VALUES (NULL, '생활권의 형성과 변화');
INSERT INTO QuestionGroup VALUES (NULL, '여러 지역의 생활');
INSERT INTO QuestionGroup VALUES (NULL, '국토 통일의 과제와 노력 - 지역 간 상호 의존');

INSERT INTO Question VALUES (NULL, 1, 1, 1, 1, 3, 0, 0, '남부 지방에서 북부 지방으로 갈수록 대륙의 영향을 강하게 받기 때문에 기온의 연교차가 커지지.\n \n오답풀이 ❶ 8월에는 남북 간 기온차가 약 10℃인 반면, 1월에는 24℃에 이르고 있어. ❷ A는 개마고원, B는 대관령 부근이야. 고도가 높아 주변보다 기온이 낮지. ❹ 대구는 여름에 가장 덥기로 유명한 곳인데, 위도(남쪽)와 수륙 분포(바다에서 멀리 떨어진 내륙), 지형(분지)의 영향 때문이야. ❺ 중강진은 겨울에 춥기로 유명한 곳인데, 위도(북쪽)와 수륙 분포(바다에서 멀리 떨어진 내륙) 때문이지. 긴 문장 test test test tset test test test test test test test test');
INSERT INTO Question VALUES (NULL, 2, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 1, 1, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 9, 1, 1, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 10, 1, 1, 1, 3, 0, 0, '남부 지방에서 북부 지방으로 갈수록 대륙의 영향을 강하게 받기 때문에 기온의 연교차가 커지지.\n \n오답풀이 ❶ 8월에는 남북 간 기온차가 약 10℃인 반면, 1월에는 24℃에 이르고 있어. ❷ A는 개마고원, B는 대관령 부근이야. 고도가 높아 주변보다 기온이 낮지. ❹ 대구는 여름에 가장 덥기로 유명한 곳인데, 위도(남쪽)와 수륙 분포(바다에서 멀리 떨어진 내륙), 지형(분지)의 영향 때문이야. ❺ 중강진은 겨울에 춥기로 유명한 곳인데, 위도(북쪽)와 수륙 분포(바다에서 멀리 떨어진 내륙) 때문이지.');
INSERT INTO Question VALUES (NULL, 1, 1, 1, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 1, 1, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 1, 1, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 9, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 10, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 11, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 12, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 13, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 14, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 15, 2, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 16, 2, 2, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 2, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 2, 2, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 9, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 10, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 11, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 12, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 13, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 14, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 15, 3, 2, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 16, 3, 2, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 3, 2, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 3, 2, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 9, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 10, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 11, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 12, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 13, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 14, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 15, 4, 3, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 16, 4, 3, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 4, 3, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 4, 3, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 9, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 10, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 11, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 12, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 13, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 14, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 15, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 16, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 17, 5, 4, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 18, 5, 4, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 5, 4, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 5, 4, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 6, 5, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 6, 5, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 6, 5, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 6, 5, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 6, 5, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 6, 5, 2, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 5, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 6, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 7, 7, 6, 1, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 8, 7, 6, 1, 3, 0, 0, '');

INSERT INTO Question VALUES (NULL, 1, 7, 6, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 2, 7, 6, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 3, 7, 6, 2, 3, 0, 0, '');
INSERT INTO Question VALUES (NULL, 4, 7, 6, 2, 3, 0, 0, '');

INSERT INTO Section VALUES (NULL, '국토의 이해');
INSERT INTO Section VALUES (NULL, '국토의 자연 환경');
INSERT INTO Section VALUES (NULL, '생활권 형성 기능');
INSERT INTO Section VALUES (NULL, '생활권의 형성과 변화');
INSERT INTO Section VALUES (NULL, '여러 지역의 생활');
INSERT INTO Section VALUES (NULL, '국토 통일의 과제와 노력');
INSERT INTO Section VALUES (NULL, '지역 간 상호 의존');

INSERT INTO Chapter VALUES (NULL, 1, '정보화 사회와 지리정보');
INSERT INTO Chapter VALUES (NULL, 1, '위치와 지역 형성');
INSERT INTO Chapter VALUES (NULL, 2, '기후와 인간 생활');
INSERT INTO Chapter VALUES (NULL, 2, '지형과 인간 생활');
INSERT INTO Chapter VALUES (NULL, 3, '자원');
INSERT INTO Chapter VALUES (NULL, 3, '공업');
INSERT INTO Chapter VALUES (NULL, 3, '서비스 산업');
INSERT INTO Chapter VALUES (NULL, 4, '인구');
INSERT INTO Chapter VALUES (NULL, 4, '도시');
INSERT INTO Chapter VALUES (NULL, 4, '지역 개발');
INSERT INTO Chapter VALUES (NULL, 5, '수도권');
INSERT INTO Chapter VALUES (NULL, 5, '평야 지역');
INSERT INTO Chapter VALUES (NULL, 5, '산지 지역');
INSERT INTO Chapter VALUES (NULL, 5, '해안 지역');
INSERT INTO Chapter VALUES (NULL, 6, '북부 지역의 이해');
INSERT INTO Chapter VALUES (NULL, 6, '국토의 잠재력과 국토 통일');
INSERT INTO Chapter VALUES (NULL, 7, '지역 간 상호 보완과 복지 국가 건설');
INSERT INTO Chapter VALUES (NULL, 7, '세계 평화 유지에의 기여');

INSERT INTO Unit VALUES (NULL, 1, 1, 7, '우리나라 지방의 별명', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 1, 1, 7, '인간과 자연과의 관계', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 2, 8, '지역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 3, 8, '지도1-지도 기호', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 4, 8, '지도2-축척', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 5, 8, '지도3-등고선', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 6, 8, '지리 조사', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 7, 8, '지리 정보', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 8, 8, '지리 정보 체계', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 1, 8, 'GIS를 직접 즐겨 보자고', 0, 0, 3, 0);

INSERT INTO Unit VALUES (NULL, 2, 9, 7, '우리나라의 위치1-수리적 위치', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 1, 5, '본초 자오선, 대척점', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 2, 2, 6, '세계의 시간대', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 2, 10, 7, '우리나라의 위치2-지리적 위치', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 2, 9, '철의 실크로드', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 2, 11, 7, '우리나라의 위치3-관계적 위치', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 3, 7, '베세토 벨트', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 2, 12, 7, '우리나라의 영역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 13, 7, '우리나라의 영역-영해 해리', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 4, 13, '해리, 저조선, 대한해협', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 2, 14, 5, '배타적 경제 수역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 3, 2, '독도는 없다', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 2, 15, 8, '지역 생활권', 0, 0, 0, 1);

INSERT INTO Unit VALUES (NULL, 3, 2, 0, '고기압과 저기압', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 3, 0, '기단과 전선', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 16, 0, '기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 17, 0, '기온 특징', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 4, 7, '육지 vs 바다', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 18, 0, '기온 분포', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 5, 0, '강수의 4가지 유형', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 19, 0, '강수 특징', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 20, 0, '강수 분포1-다우지와 소우지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 21, 0, '강수 분포2-다설지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 5, 0, '강수, 강우, 강설', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 3, 22, 5, '바람1-계절풍', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 23, 5, '바람2-높새바람', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 6, 12, '푄 현상', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 24, 5, '바람3-태풍', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 6, 13, '해일, 열수지, 적조 현상', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 3, 25, 0, '계절4-겨울', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 26, 0, '계절1-봄', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 27, 0, '계절2-여름', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 28, 0, '계절3-가을', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 4, 0, '기후 관련 속담 모음', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 3, 29, 1, '농작물의 북한계선과 무상일수', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 30, 10, '쾨펜과 온량 지수에 의한 기후 구분', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 31, 8, '지리적 특징에 의한 기후 구분', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 32, 8, '지리적 특징에 의한 기후 구분1-북부', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 7, 7, '일조시수, 천일제염, 진압농법', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 3, 33, 8, '지리적 특징에 의한 기후 구분2-중부', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 34, 8, '지리적 특징에 의한 기후 구분3-남부', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 35, 8, '지리적 특징에 의한 기후 구분4-특수형', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 36, 8, '전통 가옥 구조1', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 37, 8, '전통 가옥 구조2-제주도와 울릉도', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 5, 11, '특징적 가옥 구조 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 3, 38, 0, '국지 기후1-산지 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 8, 6, '바람의 방향', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 3, 39, 0, '국지 기후2-분지 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 40, 0, '국지 기후3-해안 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 41, 0, '국지 기후4-도시 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 42, 8, '지구 온난화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 7, 1, '나무의 종류', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 43, 6, '식생 분포', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 9, 0, '관목', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 3, 44, 6, '식생의 가치', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 8, 11, '토양 학습에 필요한 화학 용어', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 3, 45, 11, '토양 분포1-성대 토양', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 46, 11, '토양 분포2-간대 토양', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 47, 11, '토양 분포3-미성숙토', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 6, 6, '심화 학습-정말 미치겠다 토양의 분류!', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 3, 7, 11, '토양, 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 3, 1, 7, '용탈, 집적', 0, 0, 4, 0);
INSERT INTO Unit VALUES (NULL, 3, 48, 11, '토양과 식생의 보존', 0, 0, 0, 2);

INSERT INTO Unit VALUES (NULL, 4, 49, 8, '지형 형성 작용', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 10, 11, '풍화, 조산 운동, 조륙 운동', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 9, 7, '암석의 종류', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 10, 8, '지각 관련 용어 정리', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 50, 13, '한반도의 지질 구조', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 51, 13, '한반도의 지체 구조', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 8, 8, '지질 구조 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 52, 8, '지각 변동', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 11, 13, '향사·배사, 지질 구조선, 지구대', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 11, 8, '지질 시대와 지질 계통', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 12, 13, '해수면 변동과 관련된 개념 정리', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 53, 6, '신생대 제4기의 기후 변화와 지형 발달1-빙기', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 54, 6, '신생대 제4기의 기후 변화와 지형 발달2-후빙기', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 55, 6, '산지의 특색1-구릉성 산지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 56, 6, '산지의 특색2-경동 지형', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 57, 0, '고위 평탄면', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 58, 6, '산맥의 구분', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 13, 5, '분수계와 유역의 개념', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 59, 6, '산맥도와 산경도', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 12, 2, '대간·정맥·정간', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 9, 6, '산지 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 60, 13, '하천의 특색', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 13, 7, '유황', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 61, 0, '감조 하천', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 14, 7, '염해, 하굿둑, 방조제', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 10, 6, '시사-하굿둑! 부숴? 말어?', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 62, 8, '자유 곡류 하천', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 63, 0, '감입 곡류 하천', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 11, 13, '하천 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 64, 13, '하안 단구', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 65, 12, '평야', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 15, 0, '곡저 평야', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 66, 12, '침식 평야', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 67, 12, '침식 분지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 12, 13, '하천 침식 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 68, 9, '충적 평야1-선상지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 16, 5, '복류천, 용천대', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 69, 9, '충적 평야2-범람원', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 70, 9, '충적 평야3-삼각주', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 13, 9, '충적 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 14, 5, '바닷물 관련된 용어 정리', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 71, 2, '동해안', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 72, 2, '황·남해안', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 17, 3, '리아스식 해안', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 14, 6, '시사-해안선이 짧아지고 있다!', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 15, 13, '황해안과 동해안 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 73, 13, '해안 침식 지형1-해식애와 해식동', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 74, 13, '해안 침식 지형2-파식대', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 18, 0, '기저', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 75, 13, '해안 침식 지형3-해안 단구', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 16, 13, '해안 침식 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 76, 13, '해안 퇴적 지형1-사빈과 사구', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 77, 13, '해안 퇴적 지형2-사주', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 78, 13, '해안 퇴적 지형3-석호', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 79, 13, '해안 퇴적 지형4-간석지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 19, 0, '갯벌, 간척', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 17, 13, '해안 퇴적 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 15, 4, '마그마의 유동성과 화산의 모양', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 4, 80, 13, '화산지형1-백두산', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 81, 13, '화산지형2-제주도', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 18, 8, '제주는 용암 동굴의 세계적 보고!', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 82, 13, '화산지형3-울릉도', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 20, 6, '소수력 발전', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 4, 83, 13, '화산지형4-용암 대지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 19, 13, '화산 지형 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 4, 84, 10, '카르스트 지형', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 4, 20, 10, '카르스트 지형 사진으로 보기', 0, 0, 3, 3);

INSERT INTO Unit VALUES (NULL, 5, 85, 8, '자원', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 86, 8, '자원의 특성', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 21, 6, '석유 수출국 기구(OPEC)', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 5, 87, 7, '우리 나라의 자원 문제와 대책', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 22, 5, '부존량', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 5, 21, 13, '한국인, 이대론 안돼!', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 5, 88, 2, '동력 자원의 소비 구조', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 89, 2, '동력 자원1-석탄', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 90, 2, '동력 자원2-석유와 천연 가스', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 91, 8, '전력1-수력 발전', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 23, 2, '댐식, 유역 변경식, 양수식, 수로식, 저낙차식', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 5, 92, 8, '전력2-화력 발전', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 93, 8, '전력3-원자력 발전', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 16, 5, '발전 설비 용량?  발전량?  발전 단가?', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 5, 94, 6, '신, 재생 에너지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 95, 8, '지하 자원', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 96, 8, '자원과 공업', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 5, 97, 8, '자원 개발과 지역 변화', 0, 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 6, 98, 0, '공업의 발달사', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 24, 0, '공업의 분류', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 6, 99, 7, '우리나라 공업의 특징', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 100, 0, '공업 입지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 101, 0, '공업 입지 유형', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 102, 5, '베버의 공업입지론', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 103, 8, '주요 공업 지역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 22, 8, '주요 공업 지역 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 6, 104, 0, '공업 지역의 변화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 105, 2, '다국적 기업', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 6, 106, 0, '공업 발달의 문제점', 0, 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 7, 17, 9, '최소 요구치와 재화의 도달 범위', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 7, 107, 6, '상업 입지', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 25, 8, '정기 시장과 상설 시장', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 7, 108, 6, '서비스 산업의 발달', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 109, 7, '운송비', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 26, 6, '선적비, 하역비', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 7, 110, 0, '교통수단별 특징', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 111, 11, '통신의 발달', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 112, 0, '관광 산업', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 7, 23, 7, '우리나라 관광지들', 0, 0, 3, 4);

INSERT INTO Unit VALUES (NULL, 8, 18, 7, '인구 통계의 이해를 위해 필요한 용어들', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 8, 113, 7, '인구 성장 모형', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 114, 7, '우리나라의 인구 성장', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 115, 7, '인구 피라미드', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 116, 7, '우리나라의 인구 구조', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 117, 7, '인구 분포', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 118, 7, '인구 이동', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 8, 119, 7, '인구 문제와 대책', 0, 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 9, 120, 2, '도시의 발달', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 121, 2, '도시화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 19, 2, '도시화와 반대되는 움직임들', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 9, 122, 2, '도시의 기능', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 24, 7, '여러 기능의 도시들 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 9, 123, 8, '중심지 이론', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 124, 2, '도시체계', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 125, 2, '도시 내부의 분화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 27, 8, '지대, 스프롤', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 9, 126, 2, '도시 내부 구조 이론', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 127, 2, '대도시권', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 20, 2, '도시의 거대화', 0, 0, 1, 0);
INSERT INTO Unit VALUES (NULL, 9, 128, 2, '도시문제', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 9, 28, 6, '슬럼', 0, 0, 2, 0);

INSERT INTO Unit VALUES (NULL, 10, 129, 8, '지역 개발', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 10, 130, 8, '제1,2,3차 국토 종합개발 계획', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 10, 29, 6, '사회 간접 자본', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 10, 131, 8, '제4차 국토 종합개발 계획', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 10, 132, 8, '지역 개발에 따른 갈등', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 10, 133, 5, '바람직한 지역 개발', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 10, 25, 0, '건국 이래 최대의 개발, 최대의 갈등-4대강 사업', 0, 0, 3, 5);

INSERT INTO Unit VALUES (NULL, 11, 134, 6, '수도권의 공업', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 11, 135, 6, '서울의 지역 분화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 11, 26, 6, '서울 각 지역 사진으로 보기', 0, 0, 3, 0);
INSERT INTO Unit VALUES (NULL, 11, 136, 6, '수도권의 형성과 확대', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 11, 137, 6, '수도권의 문제와 대책', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 11, 27, 6, '수도권 각 지역 사진으로 보기', 0, 0, 3, 0);

INSERT INTO Unit VALUES (NULL, 12, 138, 1, '농업과 농촌의 변화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 12, 30, 7, '원예농업', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 12, 139, 8, '전통 농업 지역과 시설 농업 지역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 12, 140, 0, '근교농업 지역과 원교 농업 지역', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 12, 31, 1, '노지재배', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 12, 141, 1, '농촌의 문제와 대책', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 12, 32, 14, 'WTO', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 12, 28, 1, '농촌 지역의 이모저모', 0, 0, 3, 0);

INSERT INTO Unit VALUES (NULL, 13, 142, 6, '산지 지역의 지형과 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 13, 143, 6, '산지 지역의 생활과 변화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 13, 144, 6, '산지 지역의 이용', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 13, 145, 6, '산지 지역의 중요성 및 보존', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 13, 29, 6, '산지 지역의 이모저모', 0, 0, 3, 0);

INSERT INTO Unit VALUES (NULL, 14, 146, 13, '해안 지역의 주민 생활', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 14, 33, 7, '어장에 따른 어업의 분류', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 14, 147, 13, '항구', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 14, 34, 5, '방파제, 부두, 물양장, 위판장', 0, 0, 2, 0);
INSERT INTO Unit VALUES (NULL, 14, 148, 0, '간척 평야와 해안 평야', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 14, 149, 0, '간석지와 간척 사', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 14, 30, 13, '해안 지역의 이모저모', 0, 0, 3, 6);

INSERT INTO Unit VALUES (NULL, 15, 150, 5, '북부 지역의 지형과 기후', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 15, 151, 5, '북부 지역의 인문 환경', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 15, 152, 5, '북부 지역의 산업', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 15, 153, 5, '북한의 변화와 개방', 0, 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 16, 154, 0, '국토의 분단과 통일', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 16, 155, 1, '남북한 상호 보완과 교류', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 16, 31, 5, '북한의 이모저모', 0, 0, 3, 0);

INSERT INTO Unit VALUES (NULL, 17, 156, 0, '국제 사회의 변화와 상호 보완', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 17, 157, 5, '복지 국가의 건설', 0, 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 18, 158, 6, '세계화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 18, 159, 8, '지역화', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 18, 160, 6, '세계 속의 우리나라', 0, 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 18, 21, 8, '지역 경제 협력 기구', 0, 0, 1, 7);
