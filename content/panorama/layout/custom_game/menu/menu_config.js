var SideNavButton;
(function (SideNavButton) {
    SideNavButton["LASTHIT"] = "Lasthit";
    SideNavButton["SPELL_DODGE"] = "Spell Dodge";
    SideNavButton["AIM"] = "Aim";
    SideNavButton["MULTITASK"] = "Multitask";
    SideNavButton["UNIT_CONTROL"] = "UnitControl";
})(SideNavButton || (SideNavButton = {}));
var PageNames;
(function (PageNames) {
    PageNames["LASTHIT"] = "LasthitPage";
    PageNames["AIM"] = "AimPage";
    PageNames["MULTITASK"] = "MultitaskPage";
})(PageNames || (PageNames = {}));
var SIDE_NAV_CONFIG = [
    { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
    { name: SideNavButton.AIM, class: AimNavButton },
    // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },
    // { name: SideNavButton.SPELL_DODGE, class: SpellDodgeNavButton },
    // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
