// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerTags.sqf
//	@file Author: RevoLand
//	@file Args:

nameDistance = _this select 0;
showDistance = _this select 1;

while {true} do
{
	_currentPlayerCount = count allPlayers;
	waitUntil {
		_currentPlayerCount > 1;
	};
	
	ShowPlayerNames = addMissionEventHandler ["Draw3D",
	{
		_players = allPlayers;
		{
			if (!(isNull _x) && (isPlayer _x) && (_x != player)) then
			{
				_distance = cameraOn distance _x;
				_alpha = (1-(_distance/nameDistance));
				_clr = [1, 1, 1, _alpha];
				_crew = crew (vehicle _x);
				_name = '';
				{
					if (_x != player) then
					{
						_name = format ['%3%1%2', ['', format ['%1, ', _name]] select (_name != ''), name _x, ['', format ['[%1] ', round(player distance _x)]] select (showDistance)];
					};
				} forEach _crew;
				_veh = vehicle _x;
				_bbr = boundingBoxReal _veh;
				_p1 = _bbr select 0;
				_p2 = _bbr select 1;
				_maxHeight = (abs ((_p2 select 2) - (_p1 select 2))) * 1.25; 
				_pos = visiblePosition _veh;
				_pos set[2,(_pos select 2) + _maxHeight];
				
				drawIcon3D['', _clr, _pos, 0, 0, 0, _name, 1, 0.03];
				// texture (null), color (_clr), position (_pos), width (0), height (0), angle (0), text (_name), shadow (1), textSize (0.03), font, textAlign, drawSideArrows
			};
		} forEach _players;
	}];

	_currentPlayerCount = count allPlayers;
	waitUntil {
		_currentPlayerCount != count allPlayers;
	};
	
	removeMissionEventHandler ["Draw3D", ShowPlayerNames];
	
	sleep 1;
};