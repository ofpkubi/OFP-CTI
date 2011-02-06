// args: object
// return: none

private [ "_obj", "_w", "_m", "_i", "_c", "_added" ];

_obj = _this;

if (alive _obj) then
{
  _w = weapons _obj;
  _m = magazines _obj;

  _added = false;
  _i = 0;
  _c = count rearmData;
  while "_i < _c && !_added" do
  {
    if ( !alive((rearmData select _i) select 0) ) then
    {
      rearmData set [_i, [_obj, _w, _m]];
      _added=true;
    };
    _i=_i+1;
  };
  if (!_added) then { rearmData set [count rearmData, [_obj, _w, _m]] };
};
