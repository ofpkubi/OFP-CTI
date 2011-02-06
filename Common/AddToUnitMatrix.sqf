// args: [unit, type, si]
// return: true

private [ "_unit", "_type", "_si", "_indexUnitMatrix", "_list", "_added", "_i", "_c" ];

_unit = _this select 0;
_type = _this select 1;
_si = _this select 2;

_indexUnitMatrix = _type;
if (_type >= maxUnitTypes) then
{
  _indexUnitMatrix = utCustom select _si;
};

_list = ((unitMatrix select _si) select _indexUnitMatrix);
_added = false;
_i = 0;
_c = count _list;
while "_i < _c && !_added" do { if ( !(alive(_list select _i)) ) then { _list set [_i, _unit]; _added=true }; _i=_i+1 };
if (!_added) then { _list set [count _list, _unit] };
true