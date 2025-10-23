var SideNavButton;
(function (SideNavButton) {
    SideNavButton["HEROES_CHOISE"] = "Heroes Choise";
    SideNavButton["LASTHIT"] = "Lasthit";
    SideNavButton["MANTA_DODGE"] = "Manta Dodge";
    SideNavButton["AIM"] = "Aim";
    SideNavButton["MULTITASK"] = "Multitask";
    SideNavButton["UNIT_CONTROL"] = "UnitControl";
})(SideNavButton || (SideNavButton = {}));
var PageNames;
(function (PageNames) {
    PageNames["LASTHIT"] = "LasthitPage";
    PageNames["AIM"] = "AimPage";
    PageNames["MULTITASK"] = "MultitaskPage";
    PageNames["MANTA_DODGE"] = "MantaDodgePage";
})(PageNames || (PageNames = {}));
var SIDE_NAV_CONFIG = [
    { name: SideNavButton.HEROES_CHOISE, class: HeroesChoiseNavigationButton },
    { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
    { name: SideNavButton.AIM, class: AimNavButton },
    { name: SideNavButton.MANTA_DODGE, class: MantaDodgeNavButton },
    // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },
    // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
