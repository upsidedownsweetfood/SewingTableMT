print("initializing sewing table")

local mod_name = "sewing_table"

local sewing_table_ui = {}

function sewing_table_ui.get_formspec()
	local plushies = {}

	local formspec = {
		"formspec_version[4]",
		"size[8,9]",
	}

	return table.concat(formspec, "")
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= mod_name .. "main_ui" then
		return
	end
end)

minetest.register_node("sewing_table:table", {
	description = "Sewing Table",
	tiles = { "sewing_table.png" },
	groups = { cracky = 1 },
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.show_formspec(clicker:get_player_name(), mod_name .. "main_ui", sewing_table_ui.get_formspec())
	end,
})

minetest.register_craft({
	type = "shaped",
	output = "sewing_table:table 1",
	recipe = {
		{ "", "", "" },
		{ "wool:white", "wool:white", "" },
		{ "group:wood", "group:wood", "" },
	},
})
