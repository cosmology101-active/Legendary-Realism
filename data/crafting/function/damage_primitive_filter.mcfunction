# Tag the crafting player
tag @s add crafting_player

# Store the Primitive Filter's damage in a scoreboard
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] store result score @s temp_damage if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}].components."minecraft:damage".value

# Clear the crafting grid (only removes the custom gunpowder items)
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 0
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 1
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 2
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 3
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 4
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 5
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 6
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 7
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004}}} 8

# Reinsert the Primitive Filter with +1 damage (if not broken)
execute as @a[tag=crafting_player] if score @s temp_damage matches ..4 run {
    give @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":{value:1}}}
}

# Clean up
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
