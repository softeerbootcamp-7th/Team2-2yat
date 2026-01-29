import React, { useState } from "react";
import SquareButton from "./SquareButton"; // 경로 수정
import Icon from "../icon/Icon";
import Tooltip from "../tooltip/Tooltip";
import SquareButtonToolTip from "./SquareButtonToolTip";
import Popover from "../popover/Popover";
import Button from "../button/Button";

const SquareButtonShowCase = () => {
    return (
        // 버튼의 흰색 배경과 그림자를 확인하기 위해 연한 그레이 배경 사용
        <div className="p-10 flex flex-col gap-16 bg-gray-50 min-h-screen text-gray-900">
            <div>
                <h1 className="text-3xl font-bold mb-2">SquareButton Showcase (Light)</h1>
                <p className="text-gray-500 font-medium">
                    Icon: 16px | No classNames | No Icon colors | Background: Light Gray
                </p>
            </div>
            <Tooltip contents={<SquareButtonToolTip>복사하기</SquareButtonToolTip>}>
                <SquareButton>
                    <Icon name="ic_copy" size={16} />
                </SquareButton>
            </Tooltip>

            <Popover contents={<div>떠라</div>}>
                <Button>으아</Button>
            </Popover>
            {/* 3. 메뉴 구성 예시 */}
            <section className="space-y-6">
                <h2 className="text-xl font-semibold border-b border-gray-200 pb-2 text-gray-700">
                    3. Functional Icons
                </h2>
                <div className="flex gap-2 p-4 bg-gray-100/50 w-fit rounded-xl border border-gray-200">
                    <SquareButton>
                        <Icon name="ic_writing" size="16" />
                    </SquareButton>
                    <SquareButton>
                        <Icon name="ic_copy" size="16" />
                    </SquareButton>
                    <SquareButton>
                        <Icon name="ic_x" size="16" />
                    </SquareButton>
                </div>
            </section>
        </div>
    );
};

export default SquareButtonShowCase;
