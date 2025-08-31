local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
	require("__flib__.gui"),
	require("script.main"),
	require("script.force"),
	require("script.player"),
	require("script.starmap.custom_star_map_tooltip"),
	require("script.starmap.platform"),
	require("script.platformCreatorGUI"),
	require("script.starmap.star_map_platform_list"),
	require("script.entity"),
	require("script.platform")
})


