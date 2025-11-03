type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons = LastitNavigationButton | AimNavButton | AbilityDodgeNavButton | MultitaskNavButton | UnitControllNavButton | HeroesChoiseNavigationButton;
interface SideNavConfig {
    name: string;
    class: ButtonConstructor<NavButtons>;
}
declare enum SideNavButton {
    HEROES_CHOISE = "Heroes Choise",
    LASTHIT = "Lasthit",
    ABILITY_DODGE = "Ability Dodge",
    AIM = "Aim",
    MULTITASK = "Multitask",
    UNIT_CONTROL = "UnitControl"
}
declare enum PageNames {
    LASTHIT = "LasthitPage",
    AIM = "AimPage",
    MULTITASK = "MultitaskPage",
    ABILITY_DODGE = "AbilityDodgePage"
}
declare var SIDE_NAV_CONFIG: SideNavConfig[];
