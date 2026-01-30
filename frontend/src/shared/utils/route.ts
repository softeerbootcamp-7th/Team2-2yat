export const ROUTE_PATHS = {
    home: "/",
    mindmap: {
        list: "/mindmaps",
        detail: "/mindmaps/:mindmap_id",
    },
    episode_archive: "/episode_archive",
    self_diagnosis: {
        list: "/self_diagnoses",
        detail: "/self_diagnoses/:self_diagnosis_id",
    },
    login: "/login",
    landing: "/landing",
} as const;

/**
 endpoint를 사용해야하는 경우(ex. useNavigate, Link to)에 해당 헬퍼 함수를 사용합니다.
*/
export const routeHelper = {
    home: () => ROUTE_PATHS.home,

    mindmap: {
        list: () => ROUTE_PATHS.mindmap.list,
        // 매우 짧은 문자열의 replace는 성능에 거의 영향을 주지 않으므로 사용함. 변화에 더 대응하기 쉬운 방식
        detail: (mindmapId: number | string) => ROUTE_PATHS.mindmap.detail.replace(":mindmap_id", String(mindmapId)),
    },

    episode_archive: () => ROUTE_PATHS.episode_archive,

    self_diagnosis: {
        list: () => ROUTE_PATHS.self_diagnosis.list,
        detail: (selfDiagnosisId: number | string) =>
            ROUTE_PATHS.self_diagnosis.detail.replace(":self_diagnosis_id", String(selfDiagnosisId)),
    },

    login: () => ROUTE_PATHS.login,
    landing: () => ROUTE_PATHS.landing,
};
