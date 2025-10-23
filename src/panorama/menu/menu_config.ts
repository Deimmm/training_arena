type ButtonConstructor<T extends ButtonComponent> = new (...args: any[]) => T;
type PageConstructor<T extends PageComponent> = new (...args: any[]) => T;
type NavButtons =
  | LastitNavigationButton
  | AimNavButton
  | MantaDodgeNavButton
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
  MANTA_DODGE = "Manta Dodge",
  AIM = "Aim",
  MULTITASK = "Multitask",
  UNIT_CONTROL = "UnitControl",
}
enum PageNames {
  LASTHIT = "LasthitPage",
  AIM = "AimPage",
  MULTITASK = "MultitaskPage",
  MANTA_DODGE = "MantaDodgePage",
}

var SIDE_NAV_CONFIG: SideNavConfig[] = [
  { name: SideNavButton.HEROES_CHOISE, class: HeroesChoiseNavigationButton },
  { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
  { name: SideNavButton.AIM, class: AimNavButton },
  { name: SideNavButton.MANTA_DODGE, class: MantaDodgeNavButton },
  // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },

  // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
