type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons =
  | LastitNavigationButton
  | AimNavButton
  | AbilityDodgeNavButton
  | MultitaskNavButton
  | UnitControllNavButton
  | HeroesChoiseNavigationButton;

interface SideNavConfig {
  name: string;
  class: ButtonConstructor<NavButtons>;
}
enum SideNavButton {
  HEROES_CHOISE = "Heroes Choise",
  LASTHIT = "Lasthit",
  ABILITY_DODGE = "Ability Dodge",
  AIM = "Aim",
  MULTITASK = "Multitask",
  UNIT_CONTROL = "UnitControl",
}
enum PageNames {
  LASTHIT = "LasthitPage",
  AIM = "AimPage",
  MULTITASK = "MultitaskPage",
  ABILITY_DODGE = "AbilityDodgePage",
}

var SIDE_NAV_CONFIG: SideNavConfig[] = [
  { name: SideNavButton.HEROES_CHOISE, class: HeroesChoiseNavigationButton },
  { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
  { name: SideNavButton.AIM, class: AimNavButton },
  { name: SideNavButton.ABILITY_DODGE, class: AbilityDodgeNavButton },
  // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },

  // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
