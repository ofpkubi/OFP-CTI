// args: [si, giFrom, giTo, amount]
// return: none

if ((_this select 3) <= (groupMoneyMatrix select (_this select 0)) select (_this select 1)) then
{
	[_this select 0, _this select 1, -(_this select 3), 0] call funcMoneyAdd;
	[_this select 0, _this select 2, _this select 3, 0] call funcMoneyAdd;

	[_this select 0, _this select 1, _this select 2, _this select 3] exec "Server\SendMoneyTransferred.sqs"
}