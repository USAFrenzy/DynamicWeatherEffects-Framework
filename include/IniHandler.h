#pragma once
#include "nlohmann/json.hpp"

/*************************************************************
 *                         Usage
 * config::Sliders::option;
 * config::Toggles::option;
 * config::helper::TogOptionToStr(Toggles::option);
 * config::helper::SliderStrToOption("sliderOptionText");
 **************************************************************/

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