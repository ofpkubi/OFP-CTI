// args: [si, structType] (e.g. [si0, stBarracks])
// return: [struct, struct, ...]

private ["_x", "_res", "_structs"];

_res = [];
_structs = (structMatrix select (_this select 0)) select (_this select 1);

{
	if (!(isNull _x)) then
	{
		_res = _res + [_x]
	};
} foreach _structs;

_structs = _structs - [objNull];
(structMatrix select (_this select 0)) set [_this select 1, _structs];

_res