# Tag the player who crafted (triggered by advancement)
tag @s add crafting_player

# Clear all items from the crafting grid (slots 0-8)
execute as @a[tag=crafting_player] run replaceitem entity @s container.0 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.1 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.2 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.3 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.4 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.5 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.6 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.7 air
execute as @a[tag=crafting_player] run replaceitem entity @s container.8 air

# Check for the Primitive Filter in any slot, get its damage, and reinsert with +1 damage
# Use a temporary scoreboard to handle damage
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run execute store result score @s temp_damage run data get entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}].components."minecraft:damage"
execute as @a[tag=crafting_player] at @s if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}] run scoreboard players add @s temp_damage 1

# Reinsert the filter in slot 0 with updated damage, unless damage is 5
execute as @a[tag=crafting_player,scores={temp_damage=1}] at @s run replaceitem entity @s container.0 minecraft:gunpowder[minecraft:custom_data={custom_model_data:1004},minecraft:damage=1,minecraft:max_stack_size=1]
execute as @a[tag=crafting_player,scores={temp_damage=2}] at @s run replaceitem entity @s container.0 minecraft:gunpowder[minecraft:custom_data={custom_model_data:1004},minecraft:damage=2,minecraft:max_stack_size=1]
execute as @a[tag=crafting_player,scores={temp_damage=3}] at @s run replaceitem entity @s container.0 minecraft:gunpowder[minecraft:custom_data={custom_model_data:1004},minecraft:damage=3,minecraft:max_stack_size=1]
execute as @a[tag=crafting_player,scores={temp_damage=4}] at @s run replaceitem entity @s container.0 minecraft:gunpowder[minecraft:custom_data={custom_model_data:1004},minecraft:damage=4,minecraft:max_stack_size=1]
# If temp_damage=5, do nothing (filter breaks, no item reinserted)

# Clean up
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
advancement revoke @a only crafting:use_primitive_filter
