local platform_list_button=table.deepcopy(data.raw["gui-style"]["default"].frame_button)
platform_list_button.font="default-listbox"
platform_list_button.default_font_color={r=1,g=1,b=1}
platform_list_button.disabled_font_color={r=0.701,g=0.701,b=0.701}

data.raw["gui-style"]["default"].platform_list_button=platform_list_button