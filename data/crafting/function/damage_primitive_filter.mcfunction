# Ensure the scoreboard objective exists (should already be in your setup)
scoreboard objectives add filter_damage dummy

# Tag the player who triggered the function (e.g., via an advancement)
tag @s add crafting_player

# Process each slot (0-8): Increment damage if the Primitive Filter is present
# Slot 0
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:0b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:0b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Repeat for slots 1-8, adjusting Slot:Xb and container.X accordingly
# Slot 1 (example)
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:1b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:1b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
# Continue for slots 2-8...

# Remove the filter from each slot if damage is 5 or greater
# Slot 0
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.0 air
# Slot 1
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.1 air
# Repeat for slots 2-8, adjusting Slot:Xb and container.X accordingly
# ...

# Clean up
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
