// arguments: none
// returns: array [[], []] with the unit numbers of human (non-AI) players (side West, East)

private ["_humanunits", "_i", "_humanunitsW", "_humanunitsE", "_groupsleadbyhumansW", "_groupsleadbyhumansE"];

_groupsleadbyhumansW = (groupMatrix select si0) - (groupAiMatrix select si0);
_groupsleadbyhumansE = (groupMatrix select si1) - (groupAiMatrix select si1);

_humanunitsW = [];
_i = 0;
{_humanunitsW set [_i, leader _x]; _i = _i+1} forEach _groupsleadbyhumansW;

_humanunitsE = [];
_i = 0;
{_humanunitsE set [_i, leader _x]; _i = _i+1} forEach _groupsleadbyhumansE;


_humanunits = [_humanunitsW, _humanunitsE];
_humanunits