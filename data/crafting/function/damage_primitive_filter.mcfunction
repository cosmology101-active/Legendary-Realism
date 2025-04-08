# Ensure the scoreboard objective exists (run this once, ideally in a load function)
scoreboard objectives add filter_damage dummy

# Tag the player who triggered the function (e.g., via an advancement)
tag @s add crafting_player

# Process each slot (0-8): Increment damage if the Primitive Filter is present
# Slot 0
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:0b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:0b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:1b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:1b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 2
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:2b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:2b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 3
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:3b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:3b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 4
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:4b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:4b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:5b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:5b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 6
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:6b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:6b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 7
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:7b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:7b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Slot 8
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s filter_damage run data get entity @s Inventory[{Slot:8b}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s filter_damage 1
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result entity @s Inventory[{Slot:8b}].components."minecraft:damage" int 1 run scoreboard players get @s filter_damage

# Remove the filter from each slot if damage is 5 or greater
# Slot 0
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run tag @s add filter_to_remove
execute as @a[tag=filter_to_remove] if score @s filter_damage matches 5.. run replaceitem entity @s container.0 air
# Slot 1
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.1 air
# Slot 2
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.2 air
# Slot 3
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.3 air
# Slot 4
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.4 air
# Slot 5
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.5 air
# Slot 6
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.6 air
# Slot 7
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.7 air
# Slot 8
execute as @a[tag=crafting_player,nbt={Inventory:[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] if score @s filter_damage matches 5.. run replaceitem entity @s container.8 air

# Clean up
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
