type Params = {
    startDOM: HTMLElement;
    className: string;
};

const findParentDOMByClass = ({ startDOM, className }: Params): HTMLElement => {
    const className_ = className.startsWith(".") ? className : `.${className}`;
    const parentDOM = startDOM.closest<HTMLElement>(className_);

    if (!parentDOM) {
        throw new Error(`${className}을 갖고 있는 parentDOM이 없습니다.`);
    }

    return parentDOM;
};

export default findParentDOMByClass;
