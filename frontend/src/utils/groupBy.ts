type Params<T, K extends string> = {
    array: T[];
    keyBy: (el: T) => K;
};

type Return<T, K extends string> = Record<K, T[]>;

function groupBy<T, K extends string>({ array, keyBy }: Params<T, K>): Return<T, K> {
    const res = {} as Return<T, K>; // 빈 객체에서 시작하기 때문에 as를 피하기가 쉽지 않습니다..

    array.forEach((el) => {
        const key = keyBy(el);

        if (!res[key]) {
            res[key] = [];
        }

        res[key].push(el);
    });

    return res;
}

export default groupBy;
