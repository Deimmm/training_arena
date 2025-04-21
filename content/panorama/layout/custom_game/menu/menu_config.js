var SideNavButton;
(function (SideNavButton) {
    SideNavButton["LASTHIT"] = "Lasthit";
    SideNavButton["SPELL_DODGE"] = "Spell Dodge";
    SideNavButton["AIM"] = "Aim";
    SideNavButton["MULTITASK"] = "Multitask";
    SideNavButton["UNIT_CONTROL"] = "UnitControl";
})(SideNavButton || (SideNavButton = {}));
var SIDE_NAV_CONFIG = [
    { name: SideNavButton.LASTHIT, class: LastitNavigationButton },
    { name: SideNavButton.AIM, class: AimNavButton },
    // { name: SideNavButton.SPELL_DODGE, class: SpellDodgeNavButton },
    // { name: SideNavButton.MULTITASK, class: MultitaskNavButton },
    // { name: SideNavButton.UNIT_CONTROL, class: UnitControllNavButton },
];
