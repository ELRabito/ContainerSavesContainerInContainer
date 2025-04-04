/**
 * ExileServer_util_fill_fillContainers
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params["_object", "_containers"];
if ((typeName _containers) isEqualTo "ARRAY") then 
{
	if!(_containers isEqualTo [])then
	{
		private _current_filled = [];
		private _control = [];
		{
			private _container = _x select 0;
			private _weapons = _x select 1;
			private _magazines = _x select 2;
			private _items = _x select 3;
			private _ContainersInContainers = _x select 4;
			if(isNil "_ContainersInContainers") then {_ContainersInContainers = []};
			private _type = [_container] call BIS_fnc_itemType;
			if((_type select 1) isEqualTo "Backpack")then
			{
				_object addBackpackCargoGlobal [_container,1];
			}
			else
			{
				_object addItemCargoGlobal [_container,1];
			};
			{
				private _type2 = [_x] call BIS_fnc_itemType;
				if((_type2 select 1) isEqualTo "Backpack")then
				{
					_object addBackpackCargoGlobal [_x,1];
				}
				else
				{
					_object addItemCargoGlobal [_x,1];
				};

			} foreach _ContainersInContainers;
			_control = (everyContainer _object);
			{
				if!((_x select 1) in _current_filled)exitWith
				{
					_current_filled pushBack (_x select 1);
				};
			}
			forEach _control;
			if!(_weapons isEqualTo [])then
			{
				[(_current_filled select _forEachIndex),_weapons] call ExileServer_util_fill_fillWeapons;
			};
			if!(_magazines isEqualTo [])then
			{
				[(_current_filled select _forEachIndex),_magazines] call ExileServer_util_fill_fillMagazines;
			};
			if!(_items isEqualTo [[],[]])then
			{
				[(_current_filled select _forEachIndex),_items] call ExileServer_util_fill_fillItems;
			};
		}
		forEach _containers;
	};
};
true
