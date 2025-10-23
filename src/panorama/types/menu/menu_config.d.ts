type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons = LastitNavigationButton | AimNavButton | MantaDodgeNavButton | MultitaskNavButton | UnitControllNavButton | HeroesChoiseNavigationButton;
interface SideNavConfig {
    name: string;
    class: ButtonConstructor<NavButtons>;
}
declare enum SideNavButton {
    HEROES_CHOISE = "Heroes Choise",
    LASTHIT = "Lasthit",
    MANTA_DODGE = "Manta Dodge",
    AIM = "Aim",
    MULTITASK = "Multitask",
    UNIT_CONTROL = "UnitControl"
}
declare enum PageNames {
    LASTHIT = "LasthitPage",
    AIM = "AimPage",
    MULTITASK = "MultitaskPage",
    MANTA_DODGE = "MantaDodgePage"
}
declare var SIDE_NAV_CONFIG: SideNavConfig[];
