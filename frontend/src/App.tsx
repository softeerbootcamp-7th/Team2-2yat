import { createBrowserRouter, Outlet, RouterProvider } from "react-router";

import { authMiddleWare } from "@/features/auth/middleware/auth_middleware";
import { AuthProvider } from "@/features/auth/providers/AuthProvider";
import EpisodeArchivePage from "@/features/episode_archive/pages/EpisodeArchivePage";
import HomePage from "@/features/home/pages/HomePage";
import LandingPage from "@/features/landing/pages/LandingPage";
import MindmapPage from "@/features/mindmap/pages/MindmapPage";
import SelfDiagnosisPage from "@/features/self_diagnosis/pages/SelfDiagnosisPage";
import LoginPage from "@/features/user/login/pages/LoginPages";
import { Toaster } from "@/shared/components/ui/sonner";
import { routeHelper } from "@/shared/utils/route";

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
                middleware: [authMiddleWare],
                children: [
                    {
                        index: true,
                        element: <MindmapPage />,
                    },
                    {
                        path: routeHelper.mindmap.list(),
                        element: <MindmapPage />,
                    },
                    {
                        path: routeHelper.episode_archive(),
                        element: <EpisodeArchivePage />,
                    },
                    {
                        path: routeHelper.self_diagnosis.list(),
                        element: <SelfDiagnosisPage />,
                    },
                ],
            },
            {
                path: routeHelper.landing(),
                element: <LandingPage />,
            },
        ],
    },
    {
        path: routeHelper.login(),
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
