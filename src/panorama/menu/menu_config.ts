type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons =
  | LastitNavigationButton
  | AimNavButton
  | SpellDodgeNavButton
  | MultitaskNavButton
  | UnitControllNavButton;

interface SideNavConfig {
  name: string;
  class: ButtonConstructor<NavButtons>;
}
enum SideNavButton {
  LASTHIT = "Lasthit",
  SPELL_DODGE = "Spell Dodge",
  AIM = "Aim",
  MULTITASK = "Multitask",
  UNIT_CONTROL = "UnitControl",
}
var SIDE_NAV_CONFIG: SideNavConfig[] = [
  { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
  { name: SideNavButton.AIM, class: AimNavButton },
  // { name: SideNavButton.SPELL_DODGE, class: SpellDodgeNavButton },
  // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },
  // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
