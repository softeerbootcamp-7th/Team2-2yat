import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

/*
    외부에서 className prop으로 받아서 병합할 때 충돌 방지 함수
*/
export function cn(...inputs: ClassValue[]) {
    return twMerge(clsx(inputs));
}
