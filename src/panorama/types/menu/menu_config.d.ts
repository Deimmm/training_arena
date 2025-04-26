type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons = LastitNavigationButton | AimNavButton | SpellDodgeNavButton | MultitaskNavButton | UnitControllNavButton;
interface SideNavConfig {
    name: string;
    class: ButtonConstructor<NavButtons>;
}
declare enum SideNavButton {
    LASTHIT = "Lasthit",
    SPELL_DODGE = "Spell Dodge",
    AIM = "Aim",
    MULTITASK = "Multitask",
    UNIT_CONTROL = "UnitControl"
}
declare var SIDE_NAV_CONFIG: SideNavConfig[];
declare enum PageNames {
    LASTHIT = "LasthitPage",
    AIM = "AimPage"
}
