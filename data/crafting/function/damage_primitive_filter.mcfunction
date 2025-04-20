# Tag the crafting player
tag @s add crafting_player

# Store the Primitive Filter's damage in a scoreboard
scoreboard objectives add temp_damage dummy
execute as @a[tag=crafting_player] store result score @s temp_damage if data entity @s Inventory[{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}].components."minecraft:damage".value

# Clear the custom item from the crafting grid using direct NBT removal
execute as @a[tag=crafting_player] at @s run {
    execute if data entity @s Inventory[{Slot:0b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:0b}]
    execute if data entity @s Inventory[{Slot:1b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:1b}]
    execute if data entity @s Inventory[{Slot:2b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:2b}]
    execute if data entity @s Inventory[{Slot:3b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:3b}]
    execute if data entity @s Inventory[{Slot:4b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:4b}]
    execute if data entity @s Inventory[{Slot:5b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:5b}]
    execute if data entity @s Inventory[{Slot:6b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:6b}]
    execute if data entity @s Inventory[{Slot:7b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:7b}]
    execute if data entity @s Inventory[{Slot:8b, id:"minecraft:gunpowder", components:{"minecraft:custom_data":{custom_model_data:1004}}}] run data remove entity @s Inventory[{Slot:8b}]
}

# Reinsert the Primitive Filter with +1 damage (if not broken)
execute as @a[tag=crafting_player] if score @s temp_damage matches ..4 run {
    give @s minecraft:gunpowder{components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":{value:1}}}
}

# Clean up
scoreboard objectives remove temp_damage
tag @a[tag=crafting_player] remove crafting_player
