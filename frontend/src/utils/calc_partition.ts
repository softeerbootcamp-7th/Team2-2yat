import { calcSum } from "@/utils/calc_sum";

/**
 *  number[]를 두 group으로 나눌 때 sum 차이가 가장 적은 index를 반환합니다.
 */
export function calcPartitionIndex(arr: number[]) {
    if (arr.length === 0) {
        return 0;
    }

    if (arr.length === 1) {
        return 1;
    }

    const half = calcSum(arr) / 2;
    let sum = 0;
    let prevDiff = Infinity;
    let splitIndex = 1;

    for (let i = 0; i < arr.length - 1; i++) {
        sum += arr[i]!;
        const curDiff = Math.abs(half - sum);

        if (curDiff > prevDiff) {
            splitIndex = i;
            break;
        }

        prevDiff = curDiff;
        splitIndex = i + 1;
    }

    return splitIndex;
}
