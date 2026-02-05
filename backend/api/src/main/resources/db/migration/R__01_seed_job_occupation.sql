INSERT INTO occupations (name) VALUES
                                  ('경영지원·사무'),
                                  ('영업·영업관리'),
                                  ('마케팅·광고·PR'),
                                  ('상품기획·MD·바이어'),
                                  ('연구개발(R&D)'),
                                  ('IT·개발'),
                                  ('데이터·AI'),
                                  ('제품·서비스기획'),
                                  ('생산·제조·품질'),
                                  ('건설·토목·설비'),
                                  ('구매·물류·SCM'),
                                  ('금융·보험·투자'),
                                  ('디자인·크리에이티브'),
                                  ('미디어·콘텐츠·엔터테인먼트'),
                                  ('교육·이러닝'),
                                  ('의료·헬스케어'),
                                  ('정부사업·공공'),
                                  ('고객상담·서비스·CS'),
                                  ('운전·운송·배송'),
                                  ('식음료·외식'),
                                  ('스포츠·레저')
    ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('경영기획·전략·사업기획', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('인사·HR·채용·HRD', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('법무·컴플라이언스', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('총무·사무·비서', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('재무·회계·세무·IR', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('감사·감사역', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('ESG·지속가능경영', (SELECT id FROM occupations WHERE name='경영지원·사무')),
                                          ('정책기획·기관기획', (SELECT id FROM occupations WHERE name='경영지원·사무'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('국내영업·B2B/B2C', (SELECT id FROM occupations WHERE name='영업·영업관리')),
                                          ('해외영업·무역', (SELECT id FROM occupations WHERE name='영업·영업관리')),
                                          ('기술영업·영업기획·관리', (SELECT id FROM occupations WHERE name='영업·영업관리')),
                                          ('채널/대리점/지점관리', (SELECT id FROM occupations WHERE name='영업·영업관리')),
                                          ('매장영업관리', (SELECT id FROM occupations WHERE name='영업·영업관리'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('브랜드마케팅·IMC·PR', (SELECT id FROM occupations WHERE name='마케팅·광고·PR')),
                                          ('디지털마케팅·퍼포먼스·그로스해킹', (SELECT id FROM occupations WHERE name='마케팅·광고·PR')),
                                          ('시장조사·리서치', (SELECT id FROM occupations WHERE name='마케팅·광고·PR')),
                                          ('광고기획·제작', (SELECT id FROM occupations WHERE name='마케팅·광고·PR')),
                                          ('콘텐츠마케팅', (SELECT id FROM occupations WHERE name='마케팅·광고·PR')),
                                          ('SNS마케팅·인플루언서', (SELECT id FROM occupations WHERE name='마케팅·광고·PR'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('상품기획·MD', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어')),
                                          ('카테고리매니저', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어')),
                                          ('바이어·소싱', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어')),
                                          ('PB상품개발', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어')),
                                          ('트렌드분석', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어')),
                                          ('브랜드매니저', (SELECT id FROM occupations WHERE name='상품기획·MD·바이어'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('기계·자동차 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('전기전자 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('화학·소재 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('바이오·의료 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('반도체·디스플레이 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('SW·AI·알고리즘 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('친환경·신재생에너지 R&D', (SELECT id FROM occupations WHERE name='연구개발(R&D)')),
                                          ('정책·경제연구', (SELECT id FROM occupations WHERE name='연구개발(R&D)'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('백엔드·프론트엔드·풀스택', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('모바일·앱 개발', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('게임개발', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('시스템·네트워크·클라우드', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('보안·해킹', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('DevOps·SRE', (SELECT id FROM occupations WHERE name='IT·개발')),
                                          ('블록체인·핀테크', (SELECT id FROM occupations WHERE name='IT·개발'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('AI·ML·데이터사이언티스트', (SELECT id FROM occupations WHERE name='데이터·AI')),
                                          ('데이터엔지니어·분석가', (SELECT id FROM occupations WHERE name='데이터·AI')),
                                          ('데이터아키텍트', (SELECT id FROM occupations WHERE name='데이터·AI')),
                                          ('MLOps엔지니어', (SELECT id FROM occupations WHERE name='데이터·AI')),
                                          ('비즈니스인텔리전스(BI)', (SELECT id FROM occupations WHERE name='데이터·AI'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('제품기획', (SELECT id FROM occupations WHERE name='제품·서비스기획')),
                                          ('서비스기획', (SELECT id FROM occupations WHERE name='제품·서비스기획')),
                                          ('BizOps·그로스', (SELECT id FROM occupations WHERE name='제품·서비스기획')),
                                          ('UX리서치·서비스분석', (SELECT id FROM occupations WHERE name='제품·서비스기획')),
                                          ('테크니컬라이터', (SELECT id FROM occupations WHERE name='제품·서비스기획'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('생산관리·공정관리·공장운영', (SELECT id FROM occupations WHERE name='생산·제조·품질')),
                                          ('생산기술·설비·보전', (SELECT id FROM occupations WHERE name='생산·제조·품질')),
                                          ('품질관리(QC/QA)', (SELECT id FROM occupations WHERE name='생산·제조·품질')),
                                          ('공정엔지니어', (SELECT id FROM occupations WHERE name='생산·제조·품질')),
                                          ('스마트팩토리', (SELECT id FROM occupations WHERE name='생산·제조·품질'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('건축·토목·플랜트 설계', (SELECT id FROM occupations WHERE name='건설·토목·설비')),
                                          ('현장시공·관리·공무', (SELECT id FROM occupations WHERE name='건설·토목·설비')),
                                          ('안전관리·환경', (SELECT id FROM occupations WHERE name='건설·토목·설비')),
                                          ('견적·원가·시공관리', (SELECT id FROM occupations WHERE name='건설·토목·설비')),
                                          ('감리', (SELECT id FROM occupations WHERE name='건설·토목·설비')),
                                          ('스마트시티·인프라', (SELECT id FROM occupations WHERE name='건설·토목·설비'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('구매·소싱·자재관리', (SELECT id FROM occupations WHERE name='구매·물류·SCM')),
                                          ('물류·창고·운송관리', (SELECT id FROM occupations WHERE name='구매·물류·SCM')),
                                          ('SCM·물류기획·공급망관리', (SELECT id FROM occupations WHERE name='구매·물류·SCM')),
                                          ('이커머스물류·풀필먼트', (SELECT id FROM occupations WHERE name='구매·물류·SCM'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('은행원·텔러·여신·심사', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('증권·트레이더·애널리스트', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('보험심사·손해사정·계리', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('펀드매니저·리스크관리', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('핀테크·디지털금융', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('투자은행·기업금융·구조조정', (SELECT id FROM occupations WHERE name='금융·보험·투자')),
                                          ('투자·VC·PE', (SELECT id FROM occupations WHERE name='금융·보험·투자'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('UX/UI·서비스디자인', (SELECT id FROM occupations WHERE name='디자인·크리에이티브')),
                                          ('그래픽·편집디자인', (SELECT id FROM occupations WHERE name='디자인·크리에이티브')),
                                          ('제품디자인', (SELECT id FROM occupations WHERE name='디자인·크리에이티브')),
                                          ('영상·모션그래픽·콘텐츠', (SELECT id FROM occupations WHERE name='디자인·크리에이티브')),
                                          ('작가·시나리오', (SELECT id FROM occupations WHERE name='디자인·크리에이티브')),
                                          ('브랜드디자인·패키지', (SELECT id FROM occupations WHERE name='디자인·크리에이티브'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('방송·영상제작', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('게임기획·운영', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('웹툰·웹소설', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('음악·엔터테인먼트', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('콘텐츠크리에이터·MCN', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('OTT·스트리밍', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트')),
                                          ('편집·기자·PD', (SELECT id FROM occupations WHERE name='미디어·콘텐츠·엔터테인먼트'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('교육기획·콘텐츠개발', (SELECT id FROM occupations WHERE name='교육·이러닝')),
                                          ('강사·트레이너', (SELECT id FROM occupations WHERE name='교육·이러닝')),
                                          ('에듀테크·이러닝', (SELECT id FROM occupations WHERE name='교육·이러닝')),
                                          ('교육컨설팅', (SELECT id FROM occupations WHERE name='교육·이러닝')),
                                          ('기업교육·HRD', (SELECT id FROM occupations WHERE name='교육·이러닝'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('임상시험·CRO', (SELECT id FROM occupations WHERE name='의료·헬스케어')),
                                          ('의료기기·제약', (SELECT id FROM occupations WHERE name='의료·헬스케어')),
                                          ('헬스케어서비스', (SELECT id FROM occupations WHERE name='의료·헬스케어')),
                                          ('디지털헬스·메드테크', (SELECT id FROM occupations WHERE name='의료·헬스케어')),
                                          ('바이오인포매틱스', (SELECT id FROM occupations WHERE name='의료·헬스케어'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('정책기획·분석', (SELECT id FROM occupations WHERE name='정부사업·공공')),
                                          ('공공사업·발주', (SELECT id FROM occupations WHERE name='정부사업·공공')),
                                          ('정부R&D관리·국제협력·ODA', (SELECT id FROM occupations WHERE name='정부사업·공공')),
                                          ('규제·인허가', (SELECT id FROM occupations WHERE name='정부사업·공공'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('콜센터·고객상담·TM', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS')),
                                          ('VOC관리', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS')),
                                          ('매장관리·점포운영', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS')),
                                          ('호텔·항공·레저 서비스', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS')),
                                          ('플랫폼운영', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS')),
                                          ('CX·고객경험', (SELECT id FROM occupations WHERE name='고객상담·서비스·CS'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('택배·배송·기사', (SELECT id FROM occupations WHERE name='운전·운송·배송')),
                                          ('물류운전·포크레인·트럭', (SELECT id FROM occupations WHERE name='운전·운송·배송')),
                                          ('항공·해운·크루즈', (SELECT id FROM occupations WHERE name='운전·운송·배송')),
                                          ('모빌리티·차량공유', (SELECT id FROM occupations WHERE name='운전·운송·배송'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('요리사·조리사', (SELECT id FROM occupations WHERE name='식음료·외식')),
                                          ('바리스타·베이커리', (SELECT id FROM occupations WHERE name='식음료·외식')),
                                          ('식음료관리', (SELECT id FROM occupations WHERE name='식음료·외식')),
                                          ('음식점운영', (SELECT id FROM occupations WHERE name='식음료·외식')),
                                          ('푸드테크·배달플랫폼', (SELECT id FROM occupations WHERE name='식음료·외식'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);

INSERT INTO jobs (name, occupation_id) VALUES
                                          ('스포츠마케팅·매니지먼트', (SELECT id FROM occupations WHERE name='스포츠·레저')),
                                          ('피트니스·헬스케어', (SELECT id FROM occupations WHERE name='스포츠·레저')),
                                          ('레저시설 운영', (SELECT id FROM occupations WHERE name='스포츠·레저')),
                                          ('스포츠콘텐츠·중계', (SELECT id FROM occupations WHERE name='스포츠·레저'))
    ON DUPLICATE KEY UPDATE occupation_id = VALUES(occupation_id);
