# Ensure scoreboard objective exists (run this once, ideally in a load function)
scoreboard objectives add filter_damage dummy

# Tag the player who crafted Filtered Water
tag @s add crafting_player

# Slot 0: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:0b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:0b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.0 air

# Slot 1: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:1b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:1b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.1 air

# Slot 2: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:2b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:2b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.2 air

# Slot 3: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:3b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:3b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.3 air

# Slot 4: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:4b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:4b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.4 air

# Slot 5: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:5b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:5b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.5 air

# Slot 6: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:6b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:6b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.6 air

# Slot 7: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:7b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:7b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.7 air

# Slot 8: Check and damage the filter, remove if damage >= 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:8b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:8b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute if score @s filter_damage matches 5.. run replaceitem entity @s container.8 air

# Clean up: Remove the tag and revoke the advancement
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
