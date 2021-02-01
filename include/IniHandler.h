#pragma once
#include "nlohmann/json.hpp"

/*************************************************************
 *                         Usage
 * config::Sliders::option;
 * config::Toggles::option;
 * config::helper::TogOptionToStr(Toggles::option);
 * config::helper::SliderStrToOption("sliderOptionText");
 **************************************************************/
/*
    json git: https://github.com/nlohmann/json#examples
	Might be able to go ahead and create a struct of json objects and then parse the
    json nodes to read/write values to those nodes using the toStr and toState functions?
	Then in the config namespace of the plugin, add the json structures and
	functions to be able to use the configuration types that are converted to strings
	and then parsed by json to find the nodes and read/write the values to those nodes?
*/

namespace inihandler {
	using json = nlohmann::json;
	// reader/writer functions return type void as a placeholder
	namespace reader {
		void ReadFromConfigIni( );
		void LoadConfigPreset( );
	} // namespace reader

	namespace writer {
		void ResetConfigIni( );
		void SaveToConfigIni( );
		void CurrrentConfigToPreset( );
	} // namespace writer


} // namespace inihandler


namespace config {

	enum class Sliders { increasedThirst = 0, increasedThirstAction, increasedThirstNeeds, isUndefined };

	enum class Toggles {
		isModEnabled = 0,
		isDebugEnabled,
		isAridOptionEnabled,
		isThirstIncreased,
		isDryWells,
		isFlammableWood,
		isPuddles,
		isPuddleRunoff,
		isPuddleFreeze,
		isPuddleSublimation,
		isUndefined
	};

	namespace helper {
		// Functions To Map String Values To/From The Toggle State
		const std::string TogOptionToStr(Toggles toggleOption);
		const Toggles TogStrToOption(std::string toggleStr);

		// Functions To Map String Values To/From The Slider Options
		const std::string SliderToStr(Sliders sliderOption);
		const Sliders SliderStrToOption(std::string sliderStr);
	} // namespace helper

} // namespace config