# $slot is passed as 0-8 or -1 for mainhand
execute if score $slot dummy matches 0 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 1 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 2 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 3 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 4 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 5 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 6 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 7 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches 8 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base
execute if score $slot dummy matches -1 run loot spawn ~ ~ ~ loot crafting:primitive_filter_base

# Copy damage from the player's item
execute if score $slot dummy matches 0..8 run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] Item.components."minecraft:damage" set from entity @s Inventory[{Slot:0b}].components."minecraft:damage"
execute if score $slot dummy matches -1 run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] Item.components."minecraft:damage" set from entity @s SelectedItem.components."minecraft:damage"

# Increment damage
execute as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run data modify entity @s Item.components."minecraft:damage" merge value 1b

# Replace the item
execute if score $slot dummy matches 0 run loot replace entity @s container.0 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 1 run loot replace entity @s container.1 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 2 run loot replace entity @s container.2 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 3 run loot replace entity @s container.3 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 4 run loot replace entity @s container.4 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 5 run loot replace entity @s container.5 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 6 run loot replace entity @s container.6 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 7 run loot replace entity @s container.7 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches 8 run loot replace entity @s container.8 mine ~ ~ ~ air{drop_contents:1b}
execute if score $slot dummy matches -1 run loot replace entity @s weapon.mainhand mine ~ ~ ~ air{drop_contents:1b}

# Break if damage reaches 5
execute if score $slot dummy matches 0 if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.0 air
execute if score $slot dummy matches 1 if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.1 air
execute if score $slot dummy matches 2 if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.2 air
execute if score $slot dummy matches 3 if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.3 air
execute if score $slot dummy matches 4 if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.4 air
execute if score $slot dummy matches 5 if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.5 air
execute if score $slot dummy matches 6 if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.6 air
execute if score $slot dummy matches 7 if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.7 air
execute if score $slot dummy matches 8 if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.8 air
execute if score $slot dummy matches -1 if data entity @s SelectedItem{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}} run clear @s minecraft:gunpowder[custom_data={custom_model_data:1004}] 1

# Clean up
kill @e[type=item,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}]
