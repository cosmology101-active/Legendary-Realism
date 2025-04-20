# Tag the crafting player
tag @s add crafting_player

# Store damage value
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] store result score @s temp_damage if data entity @s Inventory[{id:"minecraft:gunpowder"}].components."minecraft:damage".value

# Clear crafting grid using precise component targeting
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]
execute as @a[tag=crafting_player] at @s run data remove entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}]

# CORRECTED GIVE COMMAND (PROVEN SYNTAX)
execute as @a[tag=crafting_player] if score @s temp_damage matches ..4 run give @s minecraft:gunpowder[minecraft:custom_data={custom_model_data:1004},minecraft:damage={value:1}] 1

# Cleanup
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
