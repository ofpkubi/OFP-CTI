// arguments: [_pos, _units, _alt, _shift]
// returns: true if command processed, false if not

// TODO - remove
// funcMapClickPlayer = preprocessFile "Player\MapClickPlayer.sqf";

private ["_x", "_pos", "_units", "_alt", "_shift", "_processed", "_posInfo", "_textPos"];

_pos = _this select 0;
_units = _this select 1;
_alt = _this select 2;
_shift = _this select 3;
_processed = false;

// TODO - remove
// format["HEJ %1", name player] call funcSideMsg;
// [playerSide, "hq"] globalchat "GLOBAL";
// (leader groupTemp0) sidechat "TEST";
// (leader grpNull) sidechat "TEST";
// player globalchat format["HighObjects = %1", [_pos, 10, 200] call funcHighObjects];
// player globalchat format["InForest = %1", [_pos] call funcInForest];
// player globalchat format["BaseArea = %1", [_pos] call funcBaseArea];
// player globalchat format["StartPos = %1", [_pos] call funcStartPos];
// player globalchat format["AreaFlat = %1", [_pos, 100] call funcAreaFlat];

if (!alive player) then
{
  _processed = true;
};

if (!_processed && (count _units) > 0) then
{
  // new order
  if (!_alt && !_shift) then
  {
    private ["_order", "_id", "_unit"];
    { _order = []; _id = -1; _unit = _x; call orderNew } foreach _units;
  };

  // test
  if (false && (count _units) > 1 && !_processed && !_alt && !_shift) then
  {
    { [_x] exec "Player\TestSatchel.sqs" } foreach _units;
    
    _processed = true;
  };

  // ai order dialog
  if (!_processed && !_alt && _shift) then
  {
    [_pos, _units] exec "Player\Dialog OrderPlayerAI.sqs";
    _processed = true;
  };
};

if (!_processed && (count _units) == 0) then
{
  // test
  if (false && !_processed && !_alt && !_shift) then
  {
    player globalchat format["InForest = %1", [_pos] call funcInForest];
    _processed = true;
  };

  // unit cam
  if (!_processed && !_alt && _shift && count ([siPlayer, stSatRec] call funcGetWorkingStructures) > 0) then
  {
    _res = [siPlayer, _pos] call funcGetClosestUnit;
    if ( (_res select 1) < 50 && (group (_res select 0)) in (groupMatrix select siPlayer) ) then
    {
      [_res select 0] exec "Player\Dialog UnitCam.sqs";
      _processed = true;
    };

    if (!_processed) then
    {
      _res = [_pos, siPlayer, [], []] call funcGetClosestVehicle;
      if ( (_res select 1) < 50 ) then
      {
        [_res select 0] exec "Player\Dialog UnitCam.sqs";
        _processed = true;
      };
    };
  };

  // set player waypoint
  if (!_processed && _alt && !_shift) then
  {
    [_pos] exec "Player\SetWaypointSmart.sqs";
    _processed = true;
  };

  // waypoint dialog
  if (!_processed && _alt && _shift) then
  {
    [_pos] exec "Player\Dialog Waypoints.sqs";
    _processed = true;
  };

  // rally point
  if (false && !_processed && _alt && _shift) then
  {
    if (abs((_pos select 0)-(posRally select 0))<10 && abs((_pos select 1)-(posRally select 1))<10) then
    {
      posRally = [-1, -1];
      "WP" setMarkerPos hiddenMarkerPos;
      player groupChat "Rally point UNSET";
    }
    else
    {
      posRally = [_pos select 0, _pos select 1];
      "WP" setMarkerPos posRally;
      _posInfo = _pos call funcCalcTownDirDistFromPos;
      _textPos = format ["%1", _posInfo];
      player groupChat format["Rally point set: %1", _textPos];
    };
    _processed = true;
  };

  // commander
  if (!_processed && groupPlayer == (groupCommander select siPlayer)) then
  {
    if (!_processed && !_alt && _shift) then
    {
      [] exec "Player\Dialog AIGroupOrders.sqs";
      _processed = true;
    };
  };
};

_processed