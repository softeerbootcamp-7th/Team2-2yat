import useToggle from "@shared/hooks/useToggle";
import { ReactNode, useEffect, useRef, useState } from "react";
import Button from "@shared/components/button/Button";
import { createPortal } from "react-dom";
import Icon from "@shared/components/icon/Icon";

type Props = {
    children: ReactNode;
    placeholder?: string;
    value?: string;
};

const GAP = 8;

const Dropdown = ({ children, placeholder = "선택해주세요", value }: Props) => {
    const [isOpen, openHandler] = useToggle();
    const [coords, setCoords] = useState({ top: 0, left: 0, width: 0 });
    const triggerRef = useRef<HTMLButtonElement>(null);

    const displayText = value || placeholder;
    const isPlaceholder = value === "";

    function updateCoords() {
        const trigger = triggerRef.current;
        if (!trigger) return;

        const rect = trigger.getBoundingClientRect();

        setCoords({
            top: rect.bottom + window.scrollY,
            left: rect.left + window.scrollX,
            width: rect.width,
        });
    }

    const toggleDropdown = () => {
        updateCoords();
        openHandler.toggle();
    };

    useEffect(() => {
        if (!isOpen) {
            return;
        }

        const handleClickOutside = (e: MouseEvent) => {
            if (!(e.target instanceof Node)) {
                return;
            }

            if (triggerRef.current && !triggerRef.current.contains(e.target)) {
                openHandler.off();
            }
        };

        window.addEventListener("click", handleClickOutside);
        return () => {
            window.removeEventListener("click", handleClickOutside);
        };
    }, [isOpen]);

    return (
        <>
            <Button
                ref={triggerRef}
                size="md"
                align="left"
                onClick={toggleDropdown}
                variant={isOpen ? "quaternary_accent_outlined" : "quaternary_outlined"}
                rightSlot={<Icon name="ic_dropdown" rotate={isOpen ? 180 : 0} />}
                className={isPlaceholder ? "text-gray-400" : "text-black"}
            >
                {displayText}
            </Button>

            {isOpen &&
                createPortal(
                    <div
                        style={{
                            position: "absolute",
                            top: `${coords.top + GAP}px`,
                            left: `${coords.left}px`,
                            minWidth: `${coords.width}px`,
                            background: "white",
                            zIndex: 9999,
                        }}
                    >
                        {children}
                    </div>,
                    document.getElementById("portal_root") as HTMLElement,
                )}
        </>
    );
};

export default Dropdown;
