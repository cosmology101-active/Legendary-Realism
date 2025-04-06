# Tag the player who crafted Filtered Water
tag @s add crafting_player

# Tag players with the Primitive Filter in inventory slots 0-8 using component syntax
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run tag @s add has_filter

# Fallback: Check the cursor (SelectedItem) with component syntax
execute as @a[tag=crafting_player,tag=!has_filter] at @s if data entity @s SelectedItem{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}} run tag @s add has_filter

# Damage the filter (inventory first, then cursor)
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=has_filter] at @s unless data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] if data entity @s SelectedItem{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}} run data modify entity @s SelectedItem.components."minecraft:damage" merge value 1b

# Break the filter if damage reaches 5
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.0 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.1 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.2 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.3 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.4 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.5 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.6 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.7 air
execute as @a[tag=has_filter] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.8 air
execute as @a[tag=has_filter] at @s if data entity @s SelectedItem{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}} run clear @s minecraft:gunpowder[custom_data={custom_model_data:1004}] 1

# Clean up tags and reset advancement
tag @a[tag=has_filter] remove has_filter
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
