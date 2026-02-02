import { createBrowserRouter, RouterProvider } from "react-router";

import { AuthProvider } from "@/features/auth/providers/AuthProvider";
import EpisodeArchivePage from "@/features/episode_archive/pages/EpisodeArchivePage";
import HomePage from "@/features/home/pages/HomePage";
import LandingPage from "@/features/landing/pages/LandingPage";
import MindmapPage from "@/features/mindmap/pages/MindmapPage";
import SelfDiagnosisPage from "@/features/self_diagnosis/pages/SelfDiagnosisPage";
import { ROUTE_PATHS } from "@/shared/utils/route";

const router = createBrowserRouter([
    {
        path: ROUTE_PATHS.home,
        element: <HomePage />,
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
    return (
        <AuthProvider>
            <RouterProvider router={router} />
        </AuthProvider>
    );
}

export default App;
