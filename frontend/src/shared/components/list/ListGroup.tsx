import { ReactNode } from "react";

type Props = {
    children: ReactNode;
};

// 아직은 뭐가 없고, Group별로 header가 필요할 경우 그때 추가하겠슴다.
const ListGroup = ({ children }: Props) => {
    return <>{children}</>;
};

export default ListGroup;
