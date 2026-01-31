INSERT INTO question_job_mapping (question_id, job_id)
SELECT q.id, j.id
FROM (
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '공동의 목표를 가진 팀 활동 중 가장 기억에 남는 경험을 한 가지 선택하여, 팀에서의 역할과 기여, 성과를 구체적으로 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '유관 부서 또는 외부 이해관계자와의 협업을 통해 문제를 해결하거나 성과를 낸 경험을 구체적으로 서술해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '본인이 생각하는 커뮤니케이션 능력이란 무엇인지 정의하고, 이를 발휘하여 긍정적인 결과를 이끌어낸 경험을 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '조직 내 갈등 상황을 조정하거나 중재한 경험이 있다면, 상황·갈등 원인·해결 과정·성과를 중심으로 작성해 주십시오.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '팀 리더로서 목표를 설정하고 구성원들을 이끌어 성과를 낸 경험을 작성해 주세요. (목표, 역할 분담, 동기부여, 결과 포함)' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '업무 또는 학업, 프로젝트 수행 중 직면했던 가장 어려운 문제 상황을 하나 제시하고, 이를 해결하기 위해 스스로 분석하고 의사결정하여 실행한 과정을 단계별로 작성해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '데이터나 자료를 체계적으로 분석하여 더 나은 의사결정을 이끌어낸 사례를 설명해 주십시오.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '팀 내에서 의견이 갈리는 상황에서, 본인이 중심이 되어 방향을 결정하고 추진한 경험을 서술해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '감리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '새로운 활동이나 프로젝트를 기획하여 실행한 경험을 작성해 주세요. (기획 배경, 목표, 실행 과정, 결과 포함)' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '고정관념을 깨는 새로운 아이디어나 접근법으로 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '안전관리·환경' AS j_name
     ) AS seed
         JOIN question q ON q.content = seed.q_content
         JOIN job j ON j.name = seed.j_name;

INSERT INTO question_job_mapping (question_id, job_id)
SELECT q.id, j.id
FROM (
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '주어진 업무 외에 스스로 필요성을 느껴 주도적으로 실행한 경험을 서술해 주십시오.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '막중한 책임이 따르는 역할을 맡았던 경험을 제시하고, 책임을 다하기 위해 어떤 노력을 했는지 구체적으로 기술해 주십시오.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '새로운 환경이나 방식에 빠르게 적응해야 했던 경험을 구체적으로 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '실패나 부족한 성과를 계기로, 어떤 점을 학습·보완했는지 구체적으로 설명해 주세요.' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '경영기획·전략·사업기획' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '정책기획·기관기획' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '상품기획·MD' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '제품기획' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '정책기획·분석' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '도전적인 목표를 세우고 성취하기 위해 끈질기게 노력한 경험에 대해 서술해 주세요. (목표·수립 과정·어려움·노력·결과·느낀 점 포함)' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '살아오면서 경험한 팀 프로젝트 중, 구성원 간 협력이 가장 잘 이루어졌다고 생각하는 사례와 그 이유를 설명해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '공동의 목표를 달성하기 위해 다른 사람들과 힘을 합쳐 노력했던 경험을 구체적으로 기술하고, 그 경험을 통해 배운 점을 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '공식적인 직책 유무와 상관없이, 주변 사람들에게 긍정적인 영향을 미친 리더십 경험을 상황 중심으로 서술해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '최근 겪은 어려운 문제를 해결한 경험을 구체적으로 설명해 주십시오. ① 상황, ② 어려움, ③ 해결 방법, ④ 결과 및 느낀 점을 포함해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '복잡한 상황에서 핵심 원인을 분석하여 문제를 해결한 경험을 구체적으로 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name
     ) AS seed
         JOIN question q ON q.content = seed.q_content
         JOIN job j ON j.name = seed.j_name;

INSERT INTO question_job_mapping (question_id, job_id)
SELECT q.id, j.id
FROM (
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '여러 대안 중에서 어려운 선택을 해야 했던 경험을 제시하고, 선택 기준과 의사결정 과정을 상세히 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '계획에 그치지 않고 실제로 행동으로 옮겨 성과를 만든 경험에 대해, 구체적인 행동과 결과를 중심으로 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '실수나 문제 발생 시, 책임을 회피하지 않고 해결을 위해 행동한 경험을 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'ESG·지속가능경영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '채널/대리점/지점관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '카테고리매니저' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '안전관리·환경' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '구매·소싱·자재관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '펀드매니저·리스크관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'VOC관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '식음료관리' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '스스로 목표를 세우고 학습하여 역량을 향상시킨 경험을 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '인사·HR·채용·HRD' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '기업교육·HRD' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '뚜렷한 목표를 위해 새롭게 시도하고 도전한 경험에 대해 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '법무·컴플라이언스' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '총무·사무·비서' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '바이어·소싱' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '백엔드·프론트엔드·풀스택' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '시스템·네트워크·클라우드' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'DevOps·SRE' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '블록체인·핀테크' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '비즈니스인텔리전스(BI)' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'BizOps·그로스' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '테크니컬라이터' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '스마트팩토리' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '감리' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '스마트시티·인프라' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '웹툰·웹소설' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '음악·엔터테인먼트' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, 'OTT·스트리밍' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '편집·기자·PD' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '강사·트레이너' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '에듀테크·이러닝' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '공공사업·발주' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '규제·인허가' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '임상시험·CRO' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '의료기기·제약' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '디지털헬스·메드테크' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '바이오인포매틱스' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '항공·해운·크루즈' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '모빌리티·차량공유' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '피트니스·헬스케어' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '요리사·조리사' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '바리스타·베이커리' AS j_name UNION ALL
         SELECT '팀 프로젝트나 단체 활동 중 의견 충돌 또는 갈등이 발생했던 경험을 구체적으로 서술하고, 이를 어떻게 해결했는지, 그 결과 무엇을 얻었는지 작성해 주세요.' AS q_content, '푸드테크·배달플랫폼' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '재무·회계·세무·IR' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '증권·트레이더·애널리스트' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '핀테크·디지털금융' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '투자은행·기업금융·구조조정' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '투자·VC·PE' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '책임감을 가지고 신속하게 행동하여 성과를 냈던 경험에 대해 서술하여 주시기 바랍니다.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '기존 방식을 개선하기 위해 본인이 주도적으로 아이디어를 내고 기획해 실행한 경험을 구체적으로 서술해 주십시오.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '감사·감사역' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '시장조사·리서치' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '트렌드분석' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '은행원·텔러·여신·심사' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '보험심사·손해사정·계리' AS j_name UNION ALL
         SELECT '자발적으로 최고 수준의 목표를 세우고 끈질기게 성취한 경험에 대해 서술해 주십시오.' AS q_content, '교육컨설팅' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '업무(또는 학업) 수행 중 이해관계자와의 원활한 소통을 통해 문제를 예방하거나 해결한 경험을 구체적으로 작성해 주십시오.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '동료와의 관계에서 갈등이 발생했을 때, 본인이 갈등을 인식하고 해결하기 위해 취한 행동과 그 이후 변화를 대해 서술해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '국내영업·B2B/B2C' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '해외영업·무역' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '매장영업관리' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '디지털마케팅·퍼포먼스·그로스해킹' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '광고기획·제작' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, 'SNS마케팅·인플루언서' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '서비스기획' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, 'UX리서치·서비스분석' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '브랜드디자인·패키지' AS j_name
     ) AS seed
         JOIN question q ON q.content = seed.q_content
         JOIN job j ON j.name = seed.j_name;

INSERT INTO question_job_mapping (question_id, job_id)
SELECT q.id, j.id
FROM (
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '헬스케어서비스' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '콜센터·고객상담·TM' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '호텔·항공·레저 서비스' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, 'CX·고객경험' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '스포츠마케팅·매니지먼트' AS j_name UNION ALL
         SELECT '주변에서 모두가 당연하게 받아들이던 방식을 창의적으로 바꾸어 성과를 낸 사례가 있다면 설명해 주십시오.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '여러 사람과 함께 프로젝트를 수행하며 팀워크를 발휘했던 사례를 구체적으로 작성해 주십시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '다른 사람들과 협업하여 공동의 목표를 달성한 경험과, 해당 과정에서 본인은 어떠한 역할을 수행하였는지 설명해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '전달이 어려운 내용을 상대가 이해할 수 있도록 설명해야 했던 경험과, 이를 위해 활용한 커뮤니케이션 방식에 대해 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '본인이 생각하는 리더십의 의미를 정의하고, 리더십을 발휘하여 성공 또는 실패한 경험이 있다면 기술하시오.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '충분한 정보가 없거나 애매한 상황에서, 스스로 정보를 수집·정리·분석해 방향을 정했던 경험을 서술해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '제안한 아이디어가 처음에는 반대나 무시를 받았지만, 끝까지 설득하여 실행된 경험이 있다면 서술해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '익숙하지 않은 업무나 역할을 맡았을 때, 본인이 배워 가며 적응해 간 과정을 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '기술영업·영업기획·관리' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, 'PB상품개발' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '기계·자동차 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '전기전자 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '화학·소재 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '바이오·의료 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '반도체·디스플레이 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, 'SW·AI·알고리즘 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '친환경·신재생에너지 R&D' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '정책·경제연구' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '모바일·앱 개발' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '보안·해킹' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, 'AI·ML·데이터사이언티스트' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '데이터엔지니어·분석가' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '데이터아키텍트' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, 'MLOps엔지니어' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '공정엔지니어' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '건축·토목·플랜트 설계' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '교육기획·콘텐츠개발' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '정부R&D관리국제협력·ODA' AS j_name UNION ALL
         SELECT '단기간에 새로운 지식이나 기술을 습득해야 했던 경험과, 이를 위해 사용한 학습 방법을 구체적으로 서술해 주십시오.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '브랜드마케팅·IMC·PR' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '콘텐츠마케팅' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '브랜드매니저' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '게임개발' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, 'UX/UI·서비스디자인' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '그래픽·편집디자인' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '제품디자인' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '영상·모션그래픽·콘텐츠' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '작가·시나리오' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '브랜드디자인·패키지' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '방송·영상제작' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '게임기획·운영' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '콘텐츠크리에이터·MCN' AS j_name UNION ALL
         SELECT '제한된 자원 내에서 최대 효과를 내기 위해 계획을 수립하고 수행한 경험을 작성해 주세요.' AS q_content, '스포츠콘텐츠·중계' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '반복되는 실패에도 불구하고 끝까지 문제 해결을 시도해 성과를 낸 경험이 있다면 작성해 주세요.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '생산관리·공정관리·공장운영' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '품질관리(QC/QA)' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '현장시공·관리·공무' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '견적·원가·시공관리' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '물류·창고·운송관리' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, 'SCM·물류기획·공급망관리' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '매장관리·점포운영' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '플랫폼운영' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '레저시설 운영' AS j_name UNION ALL
         SELECT '예상치 못한 변화나 변수로 계획을 수정해야 했던 상황에서, 어떻게 대응하고 적응했는지 서술해 주십시오.' AS q_content, '음식점운영' AS j_name UNION ALL
         SELECT '충분한 시간이 없는 상황에서 빠르게 의사결정을 내려야 했던 경험과, 그에 따른 결과를 작성해 주십시오.' AS q_content, '생산기술·설비·보전' AS j_name UNION ALL
         SELECT '충분한 시간이 없는 상황에서 빠르게 의사결정을 내려야 했던 경험과, 그에 따른 결과를 작성해 주십시오.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '충분한 시간이 없는 상황에서 빠르게 의사결정을 내려야 했던 경험과, 그에 따른 결과를 작성해 주십시오.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '충분한 시간이 없는 상황에서 빠르게 의사결정을 내려야 했던 경험과, 그에 따른 결과를 작성해 주십시오.' AS q_content, '물류운전·포크레인·트럭' AS j_name UNION ALL
         SELECT '짧은 시간 안에 많은 일을 처리해야 했던 상황에서, 어떻게 우선순위를 정하고 실행하여 마무리했는지 작성해 주세요.' AS q_content, '이커머스물류·풀필먼트' AS j_name UNION ALL
         SELECT '짧은 시간 안에 많은 일을 처리해야 했던 상황에서, 어떻게 우선순위를 정하고 실행하여 마무리했는지 작성해 주세요.' AS q_content, '택배·배송·기사' AS j_name UNION ALL
         SELECT '짧은 시간 안에 많은 일을 처리해야 했던 상황에서, 어떻게 우선순위를 정하고 실행하여 마무리했는지 작성해 주세요.' AS q_content, '물류운전·포크레인·트럭' AS j_name
     ) AS seed
         JOIN question q ON q.content = seed.q_content
         JOIN job j ON j.name = seed.j_name;