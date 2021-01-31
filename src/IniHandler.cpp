#include "IniHandler.h"
#include <map>

namespace inihandler {
	
	namespace reader {
		void ReadFromConfigIni( ) { }
		void LoadConfigPreset( ) { }
	} // namespace reader

	namespace writer {
		void ResetConfigIni( ) { }
		void SaveToConfigIni( ) { }
		void CurrrentConfigToPreset( ) { }
	} // namespace writer

} // namespace inihandler

namespace config {

	namespace helper {
		// Functions To Map String Values To/From The Toggle State
		const std::string TogOptionToStr(Toggles toggleOption)
		{
			std::string toggleStr;
			std::map<Toggles, std::string> toggleMap = {
			  {Toggles::isModEnabled, "isModEnabled"},
			  {Toggles::isDebugEnabled, "isDebugEnabled"},
			  {Toggles::isAridOptionEnabled, "isAridOptionEnabled"},
			  {Toggles::isThirstIncreased, "isThirstIncreased"},
			  {Toggles::isDryWells, "isDryWells"},
			  {Toggles::isFlammableWood, "isFlammableWood"},
			  {Toggles::isPuddles, "isPuddles"},
			  {Toggles::isPuddleRunoff, "isPuddleRunoff"},
			  {Toggles::isPuddleFreeze, "isPuddleFreeze"},
			  {Toggles::isPuddleSublimation, "isPuddleSublimation"},
			  {Toggles::isUndefined, "[UNDEFINED TOGGLE OPTION]"}};
			if(toggleMap.contains(toggleOption)) {
				toggleStr = toggleMap.at(toggleOption);
			} else {
				toggleStr = toggleMap.at(Toggles::isUndefined);
			}
			return toggleStr;
		}

		const Toggles TogStrToOption(std::string toggleStr)
		{
			Toggles toggleLookup;
			std::map<std::string, Toggles> toggleStrMap = {
			  {"isModEnabled", Toggles::isModEnabled},
			  {"isDebugEnabled", Toggles::isDebugEnabled},
			  {"isAridOptionEnabled", Toggles::isAridOptionEnabled},
			  {"isThirstIncreased", Toggles::isThirstIncreased},
			  {"isDryWells", Toggles::isDryWells},
			  {"isFlammableWood", Toggles::isFlammableWood},
			  {"isPuddles", Toggles::isPuddles},
			  {"isPuddleRunoff", Toggles::isPuddleRunoff},
			  {"isPuddleFreeze", Toggles::isPuddleFreeze},
			  {"isPuddleSublimation", Toggles::isPuddleSublimation},
			  {"[UNDEFINED TOGGLE OPTION]", Toggles::isUndefined}};
			if(toggleStrMap.contains(toggleStr)) {
				toggleLookup = toggleStrMap.at(toggleStr);
			} else {
				toggleLookup = toggleStrMap.at("[UNDEFINED TOGGLE OPTION]");
			}
			return toggleLookup;
		}

		// Functions To Map String Values To/From The Slider Options
		const std::string SliderToStr(Sliders sliderOption)
		{
			std::string sliderStr;
			std::map<Sliders, std::string> sliderMap = {

			  {Sliders::increasedThirst, "increasedThirst"},
			  {Sliders::increasedThirstAction, "increasedThirstAction"},
			  {Sliders::increasedThirstNeeds, "increasedThirstNeeds"},
			  {Sliders::isUndefined, "[UNDEFINED SLIDER OPTION]"}

			};
			if(sliderMap.contains(sliderOption)) {
				sliderStr = sliderMap.at(sliderOption);
			} else {
				sliderStr = sliderMap.at(Sliders::isUndefined);
			}
			return sliderStr;
		}

		const Sliders SliderStrToOption(std::string sliderStr)
		{
			Sliders sliderLookup;
			std::map<std::string, Sliders> sliderStrMap = {

			  {"increasedThirst", Sliders::increasedThirst},
			  {"increasedThirstAction", Sliders::increasedThirstAction},
			  {"increasedThirstNeeds", Sliders::increasedThirstNeeds},
			  {"[UNDEFINED SLIDER OPTION]", Sliders::isUndefined}

			};
			if(sliderStrMap.contains(sliderStr)) {
				sliderLookup = sliderStrMap.at(sliderStr);
			} else {
				sliderLookup = sliderStrMap.at("[UNDEFINED SLIDER OPTION]");
			}
			return sliderLookup;
		}

	} // namespace helper

} // namespace config