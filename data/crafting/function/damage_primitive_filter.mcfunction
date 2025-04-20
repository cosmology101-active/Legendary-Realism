# Tag the crafting player
tag @s add crafting_player

# Store damage value
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] store result score @s temp_damage if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{"value":1004}}}].components."minecraft:damage".value

# Clear crafting grid
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 0
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 1
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 2
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 3
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 4
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 5
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 6
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 7
execute as @a[tag=crafting_player] at @s run clear @s minecraft:gunpowder 8

# Give modified filter
execute as @a[tag=crafting_player] if score @s temp_damage matches ..4 run give @s minecraft:gunpowder[{"minecraft:custom_data":1004},{"minecraft:damage":1}] 1

# Cleanup
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
