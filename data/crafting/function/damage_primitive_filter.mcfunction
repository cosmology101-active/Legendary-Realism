# Tag the player who crafted Filtered Water
tag @s add crafting_player

# Initialize scoreboard for slot tracking
scoreboard objectives add slot dummy
scoreboard players set $slot slot -1

# Check and damage the filter in inventory slots 0-8
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 0
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 2
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 3
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 4
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 6
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 7
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players set @s slot 8
execute as @a[tag=crafting_player] at @s if predicate crafting:has_filter run scoreboard players set @s slot -1

# Run the damage function for players with a valid slot
execute as @a[tag=crafting_player,scores={slot=..8}] at @s run function crafting:damage_slot

# Clean up tags and reset advancement
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
scoreboard objectives remove slot
