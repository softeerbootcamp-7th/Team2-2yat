type Props = {
    length: number;
    currentStep: number;
    onChange?: (stepIndex: number) => void;
};

const ProgressStep = ({ onChange, currentStep, length }: Props) => {
    const arr = Array.from({ length }, (_, i) => i);

    return (
        <div className="flex items-center">
            {arr.map((step) => (
                <button key={step} onClick={onChange ? () => onChange(step) : undefined} className="p-2 group">
                    <div
                        className={`w-2.5 h-2.5 rounded-full transition-all duration-200 
                        ${step === currentStep ? "bg-primary scale-125" : "bg-gray-300 group-hover:bg-gray-400"}`}
                    />
                </button>
            ))}
        </div>
    );
};

export default ProgressStep;
