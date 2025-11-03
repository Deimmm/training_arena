interface MantaDodgeLaunchOptions {
    spells: string[];
}
interface Spell {
    hero: string;
    ability_name: string;
}
declare var SPELLS: Spell[];
declare class MantaDodgePageComponent extends PageComponent {
    constructor(id: string, root: Panel);
    private form;
    loadAbilityGrid(): void;
    eventBus(): void;
}
