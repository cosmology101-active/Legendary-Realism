# Tag the player who crafted Filtered Water
tag @s add crafting_player

# Check all crafting slots (0-8 in a 3x3 grid) and damage Primitive Filter
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:0b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:0b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:1b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:1b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:2b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:2b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:3b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:3b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:4b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:4b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:5b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:5b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:6b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:6b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:7b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:7b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:8b,components:{"minecraft:custom_data":{custom_model_data:1004}}}]}] run data modify entity @s Crafting[{Slot:8b,components:{"minecraft:custom_data":{custom_model_data:1004}}}] components."minecraft:damage" merge value 1b

# Break the filter if damage reaches 5 in any slot
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:0b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.0 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:1b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.1 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:2b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.2 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:3b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.3 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:4b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.4 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:5b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.5 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:6b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.6 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:7b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.7 air
execute as @a[tag=crafting_player] at @s if entity @s[nbt={Crafting:[{Slot:8b,components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5b}}]}] run replaceitem entity @s container.8 air

# Clean up the tag and reset advancement
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
