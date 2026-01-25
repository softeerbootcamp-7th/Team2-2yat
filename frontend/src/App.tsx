import AddNodeButton from "@features/mindmap/node/add_node/AddNodeButton";
import AddNodeDot from "@features/mindmap/node/add_node/AddNodeDot";
import AddNodeArrow from "@features/mindmap/node/add_node/AddNodeArrow";
import { NODE_COLORS, NodeColor } from "@features/mindmap/node/constants/colors";

function App() {
    return (
        <div className="w-full h-screen bg-gray-50 p-8 flex flex-col">
            <h1 className="text-3xl font-bold mb-8">AddNode Components Showcase</h1>

            <div className="flex-1 flex flex-col gap-8">
                {/* AddNodeDot */}
                <div className="flex-1 flex flex-col">
                    <h2 className="text-lg font-semibold mb-4">AddNodeDot</h2>
                    <div className="flex-1 flex items-center justify-center bg-white rounded-lg shadow-sm border border-gray-200">
                        <div className="flex gap-6">
                            {NODE_COLORS.map((color: NodeColor) => (
                                <div key={`dot-${color}`} className="flex flex-col items-center gap-2">
                                    <div className="flex items-center justify-center h-20 w-20 bg-gray-50 rounded border-2 border-dashed border-gray-300">
                                        <AddNodeDot color={color} />
                                    </div>
                                    <span className="text-xs text-gray-600 capitalize">{color}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* AddNodeArrow */}
                <div className="flex-1 flex flex-col">
                    <h2 className="text-lg font-semibold mb-4">AddNodeArrow</h2>
                    <div className="flex-1 flex items-center justify-center bg-white rounded-lg shadow-sm border border-gray-200">
                        <div className="flex gap-6">
                            {NODE_COLORS.map((color: NodeColor) => (
                                <div key={`arrow-${color}`} className="flex flex-col items-center gap-2">
                                    <div className="flex items-center justify-center h-20 w-20 bg-gray-50 rounded border-2 border-dashed border-gray-300">
                                        <AddNodeArrow color={color} />
                                    </div>
                                    <span className="text-xs text-gray-600 capitalize">{color}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* AddNodeButton (with hover) */}
                <div className="flex-1 flex flex-col">
                    <h2 className="text-lg font-semibold mb-4">AddNodeButton (Hover를 시도해보세요)</h2>
                    <div className="flex-1 flex items-center justify-center bg-white rounded-lg shadow-sm border border-gray-200">
                        <div className="flex gap-6">
                            {NODE_COLORS.map((color: NodeColor) => (
                                <div key={`button-${color}`} className="flex flex-col items-center gap-2">
                                    <div className="flex items-center justify-center h-20 w-20 bg-gray-50 rounded border-2 border-dashed border-gray-300">
                                        <AddNodeButton color={color} />
                                    </div>
                                    <span className="text-xs text-gray-600 capitalize">{color}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>

            <div className="mt-8 bg-blue-50 border border-blue-200 rounded-lg p-4">
                <h3 className="font-semibold text-blue-900 mb-2">컴포넌트 설명</h3>
                <ul className="text-sm text-blue-800 space-y-1">
                    <li>• AddNodeDot: 작은 점 (w-3 h-3)</li>
                    <li>• AddNodeArrow: 큰 아이콘 버튼</li>
                    <li>• AddNodeButton: 상태 관리 (Hover 전: Dot, Hover 후: Arrow)</li>
                </ul>
            </div>
        </div>
    );
}

export default App;
