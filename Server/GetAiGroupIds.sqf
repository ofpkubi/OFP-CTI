// args: si (e.g. si0)
// return: [gi1, gi2, ...]

private ["_x", "_res", "_gi"];

_res = [];

_gi = 0;
{
	if (_x in (groupAiMatrix select _this)) then
	{
		_res set [count _res, _gi];
	};
	_gi = _gi + 1;
} foreach (groupMatrix select _this);

_res