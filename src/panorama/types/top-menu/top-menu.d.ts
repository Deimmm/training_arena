declare var ClientEventBus: {
    emit(event: string, data: any): void;
};
declare var ServerEventBus: {
    emit(event: string, data: any): void;
};
declare function toogleShowHideBtn(): void;
declare function startHeroChoise(): void;
