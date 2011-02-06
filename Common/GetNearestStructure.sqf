// returns nearest structure
// args: [pos]
// return: [struct, type, distance]

private ["_x", "_struct", "_type", "_distMin", "_si", "_ct", "_t", "_dist"];

_struct = objNull;
_type = -1;
_distMin = 100000;

_si = si0;
_ct = count (structMatrix select _si);
_t = 0;
while "_t < _ct" do
{
	{
	  if (!(isNull _x)) then
	  {
		  _dist = [_this select 0, _x] call funcCalcDistanceToObject;
		  if (_distMin > _dist) then
		  {
			  _struct = _x;
			  _type = _t;
			  _distMin = _dist;
		  };
	  };
	} foreach ((structMatrix select _si) select _t);
	_t = _t + 1;
};

_si = si1;
_ct = count (structMatrix select _si);
_t = 0;
while "_t < _ct" do
{
	{
	  if (!(isNull _x)) then
	  {
		  _dist = [_this select 0, _x] call funcCalcDistanceToObject;
		  if (_distMin > _dist) then
		  {
			  _struct = _x;
			  _type = _t;
			  _distMin = _dist;
		  };
	  };
	} foreach ((structMatrix select _si) select _t);
	_t = _t + 1;
};

[_struct, _type, _distMin]