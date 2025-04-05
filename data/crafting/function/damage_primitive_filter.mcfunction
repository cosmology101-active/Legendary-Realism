# Increment damage on Primitive Filter in the player's crafting grid
execute as @a at @s run data modify entity @s Inventory[{Slot:1b,components:{"minecraft:custom_data":{custom_model_data:1004b}}}] components."minecraft:damage" merge value 1b

# Replace filter with air if damage reaches max (5)
execute as @a at @s if entity @s[nbt={Inventory:[{Slot:1b,components:{"minecraft:custom_data":{custom_model_data:1004b},"minecraft:damage":5b}}]}] run replaceitem entity @s container.1 air

# Reset advancement to allow repeated triggers
advancement revoke @a only crafting:use_primitive_filter
