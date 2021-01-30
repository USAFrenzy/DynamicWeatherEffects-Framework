extern "C" DLLEXPORT bool SKSEAPI SKSEPlugin_Query(const SKSE::QueryInterface* a_skse, SKSE::PluginInfo* a_info)
{
#ifndef NDEBUG
	auto sink = std::make_shared<spdlog::sinks::msvc_sink_mt>();
#else
	auto path = logger::log_directory();
	if (!path) {
		return false;
	}

	*path /= "DynamicWeatherEffects.log"sv;
	auto sink = std::make_shared<spdlog::sinks::basic_file_sink_mt>(path->string(), true);
#endif

	auto log = std::make_shared<spdlog::logger>("global log"s, std::move(sink));

#ifndef NDEBUG
	log->set_level(spdlog::level::trace);
#else
	log->set_level(spdlog::level::info);
	log->flush_on(spdlog::level::warn);
#endif

	spdlog::set_default_logger(std::move(log));
	spdlog::set_pattern("%g(%#): [%^%l%$] %v"s);

	logger::info("DynamicWeatherEffects v0.1.0");

	a_info->infoVersion = SKSE::PluginInfo::kVersion;
	a_info->name = "DynamicWeatherEffects";
	a_info->version = 1;

	if (a_skse->IsEditor()) {
		logger::critical("DynamicWeatherEffects Loaded In Editor - Marking As Incompatible"sv);
		return false;
	}

	const auto ver = a_skse->RuntimeVersion();
	if (ver < SKSE::RUNTIME_1_5_97) {
		logger::critical(FMT_STRING("Unsupported Runtime Version Detected - Please Update Your SKSE64 Install [Version Detected: {} ]"), ver.string());
		return false;
	}

	return true;
}


extern "C" DLLEXPORT bool SKSEAPI SKSEPlugin_Load(const SKSE::LoadInterface* a_skse)
{
	logger::info("DynamicWeatherEffects Has Been Successfully Loaded!");

	SKSE::Init(a_skse);

	return true;
}
