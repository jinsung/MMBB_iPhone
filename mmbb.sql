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
	is_special INTEGER,
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

CREATE TABLE IF NOT EXISTS Question (
	id INTEGER,
	q_index INTEGER,
	chapter_id INTEGER,
	type INTEGER,
	correct_answer INTEGER,
	answer INTEGER,
	answer_page_visited INTEGER,
	PRIMARY KEY (`id`)
);

INSERT INTO Question VALUES (NULL, 1, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 2, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 3, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 4, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 5, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 6, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 7, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 8, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 9, 1, 1, 3, 0, 0);

INSERT INTO Question VALUES (NULL, 10, 1, 1, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 1, 1, 2, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 2, 1, 2, 3, 0, 0);
INSERT INTO Question VALUES (NULL, 3, 1, 2, 3, 0, 0);

INSERT INTO Section VALUES (NULL, '국토의 이해');
INSERT INTO Section VALUES (NULL, '자연 환경과 인간 생활');
INSERT INTO Section VALUES (NULL, '생활권 형성 기능');
INSERT INTO Section VALUES (NULL, '생활권의 형성과 변화');
INSERT INTO Section VALUES (NULL, '여러 지역의 생활');
INSERT INTO Section VALUES (NULL, '국토 통일의 과제와 노력');
INSERT INTO Section VALUES (NULL, '지역 간 상호 의존');

INSERT INTO Chapter VALUES (NULL, 1, '정보화 사회와 지리정보');
INSERT INTO Chapter VALUES (NULL, 1, '위치와 지역 형성');
INSERT INTO Chapter VALUES (NULL, 2, '기후와 생활');
INSERT INTO Chapter VALUES (NULL, 2, '지형과 생활');
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
INSERT INTO Chapter VALUES (NULL, 7, '지역 간 상호 보완');
INSERT INTO Chapter VALUES (NULL, 7, '세계 평화 유지에의 기여');

INSERT INTO Unit VALUES (NULL, 1, 1, 7, '인간과 자연과의 관계', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 2, 8, '지역 구분', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 3, 8, '지도1-지도 기호', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 4, 8, '지도2-축척', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 5, 8, '지도3-등고선', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 6, 8, '지리 조사', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 7, 8, '지리 정보', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 1, 8, 8, '지리 정보 체계 / GIS를 직접 즐겨 보자고', 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 2, 9, 7, '우리나라의 위치1_수리적 위치 본초 자오선, 대척점  / 세계의 시간대', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 11, 7, '우리나라의 위치2_지리적 위치 철의 실크로드', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 12, 7, '우리나라의 위치3_관계적 위치 베세토 벨트', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 13, 7, '우리나라의 영역1', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 14, 7, '우리나라의 영역2-영해 해리, 저조선, 대한해협', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 15, 5, '배타적 경제 수역 / 독도는 없다', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 2, 16, 8, '지역 생활권', 0, 0, 0);

INSERT INTO Unit VALUES (NULL, 3, 1, 0, '고기압과 저기압', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 2, 0, '기단과 전선', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 17, 0, '기후', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 18, 0, '기온 특징', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 3, 7, '육지vs바다', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 19, 0, '기온 분포', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 4, 0, '강수의 4가지 유형', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 20, 0, '강수 특징', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 21, 0, '강수 분포1_다우지와 소우지', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 22, 0, '강수 분포2-다설지', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 23, 5, '바람1_계절풍', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 24, 5, '바람2_높새바람', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 25, 12, '푄 현상', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 26, 5, '바람3_태풍 해일, 열수지, 적조 현상', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 27, 0, '계절1_봄', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 28, 0, '계절2_여름', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 29, 0, '계절3_가을', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 30, 0, '계절4_겨울 / 4계절? 뭐가 이래? / 계절별 속담 정리', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 31, 1, '농작물의 북한계선과 무상일수', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 32, 10, '쾨펜과 온량 지수에 의한 기후 구분', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 33, 8, '지리적 특징에 의한 기후 구분', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 34, 8, '지리적 특징에 의한 기후 구분1-북부 일조시수, 천일제염, 진압농법', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 35, 8, '지리적 특징에 의한 기후 구분2-중부', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 36, 8, '지리적 특징에 의한 기후 구분3-남부', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 37, 8, '지리적 특징에 의한 기후 구분4-특수형', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 38, 8, '전통 가옥 구조1', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 39, 8, '전통 가옥 구조2_제주도와 울릉도 특수한 가옥 구조 사진', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 40, 0, '국지 기후1_ 산지', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 41, 0, '국지 기후2_ 분지', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 42, 0, '국지 기후3_ 해안', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 43, 0, '국지 기후4_ 도시', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 44, 8, '지구 온난화', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 6, 1, '나무의 명칭', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 45, 6, '식생 분포', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 46, 6, '식생의 가치', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 7, 11, '토양 학습에 필요한 화학 용어 정리', 0, 0, 1);
INSERT INTO Unit VALUES (NULL, 3, 47, 11, '토양 분포1_성대 토양', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 48, 11, '토양 분포2_간대 토양', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 49, 11, '토양 분포3_미성숙토 정말 미치겠다 토양의 분류 / 토양, 사진으로 보기+명명백백 mini', 0, 0, 0);
INSERT INTO Unit VALUES (NULL, 3, 50, 11, '토양과 식생의 보존', 0, 0, 0);