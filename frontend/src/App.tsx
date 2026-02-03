import { createBrowserRouter, Outlet, RouterProvider } from "react-router";
import { Toaster } from "sonner";

import { middleWare } from "@/features/auth/middleware/middleware";
import { AuthProvider } from "@/features/auth/providers/AuthProvider";
import EpisodeArchivePage from "@/features/episode_archive/pages/EpisodeArchivePage";
import HomePage from "@/features/home/pages/HomePage";
import LandingPage from "@/features/landing/pages/LandingPage";
import MindmapPage from "@/features/mindmap/pages/MindmapPage";
import SelfDiagnosisPage from "@/features/self_diagnosis/pages/SelfDiagnosisPage";
import LoginPage from "@/features/user/login/pages/LoginPages";
import { ROUTE_PATHS } from "@/shared/utils/route";

function RootLayout() {
    return (
        <AuthProvider>
            <Outlet />
        </AuthProvider>
    );
}

const router = createBrowserRouter([
    {
        element: <RootLayout />,
        children: [
            {
                element: <HomePage />,
                middleware: [middleWare],
                children: [
                    {
                        index: true,
                        element: <MindmapPage />,
                    },
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
        ],
    },
    {
        path: "/login",
        element: <LoginPage />,
    },
]);

function App() {
    return (
        <>
            <Toaster position="top-center" duration={2000} />
            <RouterProvider router={router}></RouterProvider>
        </>
    );
}

export default App;
