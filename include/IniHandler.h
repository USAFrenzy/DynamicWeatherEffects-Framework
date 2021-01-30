#pragma once
#include "nlohmann/json.hpp"

namespace inihandler {

	namespace config {
		using json = nlohmann::json;

		enum class Sliders { IncreasedThirst = 0, IncreasedThirstAction, IncreasedThirstNeeds };

		enum class Toggles {
			isPuddles,
			isPuddleRunoff,
			isPuddleFreeze,
			IsPuddleSublimation,
			isAridOptionEnabled,
			isDryWells,
			isFlammableWood,
			isThirstIncreased,
			isDebugEnabled,
			isModEnabled
		};
		// Functions To Map String Values To/From The Toggle State
		std::string TogOptionToStr(Toggles toggleOption);
		Toggles TogStrToOption(std::string toggleStr);
	} // namespace config

} // namespace inihandler