/**
 * ExileServer_util_getObjectContainerCargo
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private _vehicle = _this;
private _data = [];
private _allContainers = everyContainer _vehicle;
if !(_allContainers isEqualTo []) then
{
	{
		_containerType = _x select 0;
		_containerObject = _x select 1;
		_temp = [];
		_temp2 = [];
		_temp pushBack _containerType;
		_temp pushBack (weaponsItemsCargo _containerObject); 
		_temp pushBack (magazinesAmmoCargo _containerObject);
		_temp pushBack (getItemCargo _containerObject);
		{_temp2 pushback (_x #0)} foreach (everyContainer _containerObject);
		_temp pushback _temp2;
		_data pushBack _temp;
	
	} forEach _allContainers;
};
_data