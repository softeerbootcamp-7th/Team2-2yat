import { nanoid } from "nanoid";

// 암호 생성 로직이 바뀔 경우를 위해 분리함
const generateId = () => {
    return nanoid();
};

export default generateId;
