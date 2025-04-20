# Tag the crafting player
tag @s add crafting_player

# Store the Primitive Filter's damage
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] store result score @s temp_damage if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}].components."minecraft:damage".value

# Clear crafting grid slots (without NBT filtering)
execute as @a[tag=crafting_player] at @s run {
    clear @s minecraft:gunpowder 0
    clear @s minecraft:gunpowder 1
    clear @s minecraft:gunpowder 2
    clear @s minecraft:gunpowder 3
    clear @s minecraft:gunpowder 4
    clear @s minecraft:gunpowder 5
    clear @s minecraft:gunpowder 6
    clear @s minecraft:gunpowder 7
    clear @s minecraft:gunpowder 8
}

# Reinsert custom item with +1 damage (if not broken)
execute as @a[tag=crafting_player] if score @s temp_damage matches ..4 run {
    give @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":{value:1}}}
}

# Clean up
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
