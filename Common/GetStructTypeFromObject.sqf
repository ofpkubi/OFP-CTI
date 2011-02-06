// arguments: object
// return: type (-1 if not found)

private ["_x", "_type", "_i"];

_type = -1;

_i = 0;
{
	if (_this in _x) then { _type = _i; };
	_i = _i + 1;
} foreach (structMatrix select si0);

_i = 0;
{
	if (_this in _x) then { _type = _i; };
	_i = _i + 1;
} foreach (structMatrix select si1);

_type