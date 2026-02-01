import { createBrowserRouter, RouterProvider } from "react-router";

import EpisodeArchivePage from "@/features/episode_archive/pages/EpisodeArchivePage";
import HomePage from "@/features/home/pages/HomePage";
import LandingPage from "@/features/landing/pages/LandingPage";
import MindmapPage from "@/features/mindmap/pages/MindmapPage";
import MindMapShowcase from "@/features/mindmap/TreeShowCase";
import SelfDiagnosisPage from "@/features/self_diagnosis/pages/SelfDiagnosisPage";
import { ROUTE_PATHS } from "@/shared/utils/route";

// import MindMapShowCase from "./ShowCase";

const router = createBrowserRouter([
    {
        path: ROUTE_PATHS.home,
        element: <MindMapShowcase />,
        children: [
            {
                path: ROUTE_PATHS.mindmap.list,
                element: <MindmapPage />,
            },
            {
                path: ROUTE_PATHS.episode_archive,
                element: <EpisodeArchivePage />,
            },
            {
                path: ROUTE_PATHS.self_diagnosis.list,
                element: <SelfDiagnosisPage />,
            },
        ],
    },
    {
        path: ROUTE_PATHS.landing,
        element: <LandingPage />,
    },
]);

function App() {
    return <RouterProvider router={router} />;
}

export default App;
