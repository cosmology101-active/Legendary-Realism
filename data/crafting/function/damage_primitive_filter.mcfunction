# Tag the player who crafted Filtered Water
tag @s add crafting_player

# Check each crafting grid slot (0-8) for the Primitive Filter and damage it if present
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:0b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:1b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:2b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:3b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:4b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpaper",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:5b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:6b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:7b}].components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data modify entity @s Inventory[{Slot:8b}].components."minecraft:damage" merge value 1b

# Break the filter if its damage reaches 5
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.0 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.1 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.2 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.3 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.4 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.5 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.6 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.7 air
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}] run replaceitem entity @s container.8 air

# Clean up: Remove the tag and revoke the advancement
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
