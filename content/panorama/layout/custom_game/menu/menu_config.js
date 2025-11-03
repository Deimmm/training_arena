var SideNavButton;
(function (SideNavButton) {
    SideNavButton["HEROES_CHOISE"] = "Heroes Choise";
    SideNavButton["LASTHIT"] = "Lasthit";
    SideNavButton["ABILITY_DODGE"] = "Ability Dodge";
    SideNavButton["AIM"] = "Aim";
    SideNavButton["MULTITASK"] = "Multitask";
    SideNavButton["UNIT_CONTROL"] = "UnitControl";
})(SideNavButton || (SideNavButton = {}));
var PageNames;
(function (PageNames) {
    PageNames["LASTHIT"] = "LasthitPage";
    PageNames["AIM"] = "AimPage";
    PageNames["MULTITASK"] = "MultitaskPage";
    PageNames["ABILITY_DODGE"] = "AbilityDodgePage";
})(PageNames || (PageNames = {}));
var SIDE_NAV_CONFIG = [
    { name: SideNavButton.HEROES_CHOISE, class: HeroesChoiseNavigationButton },
    { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
    { name: SideNavButton.AIM, class: AimNavButton },
    { name: SideNavButton.ABILITY_DODGE, class: AbilityDodgeNavButton },
    // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },
    // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
