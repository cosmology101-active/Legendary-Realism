# Spawn a base filter item
loot spawn ~ ~ ~ loot crafting:primitive_filter_base

# Copy and increment damage from the player's item
execute if score @s slot matches 0..8 run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] Item.components."minecraft:damage" set from entity @s Inventory[{Slot:0b}].components."minecraft:damage"
execute if score @s slot matches -1 run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] Item.components."minecraft:damage" set from entity @s SelectedItem.components."minecraft:damage"
execute as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run data modify entity @s Item.components."minecraft:damage" merge value 1b

# Replace the item in the player's inventory with the modified spawned item
execute if score @s slot matches 0 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.0 loot minecraft:entities/item
execute if score @s slot matches 1 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.1 loot minecraft:entities/item
execute if score @s slot matches 2 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.2 loot minecraft:entities/item
execute if score @s slot matches 3 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.3 loot minecraft:entities/item
execute if score @s slot matches 4 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.4 loot minecraft:entities/item
execute if score @s slot matches 5 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.5 loot minecraft:entities/item
execute if score @s slot matches 6 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.6 loot minecraft:entities/item
execute if score @s slot matches 7 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.7 loot minecraft:entities/item
execute if score @s slot matches 8 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p container.8 loot minecraft:entities/item
execute if score @s slot matches -1 as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}] at @s run loot replace entity @p weapon.mainhand loot minecraft:entities/item

# Break if damage reaches 5
execute if score @s slot matches 0 if data entity @s Inventory[{Slot:0b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.0 air
execute if score @s slot matches 1 if data entity @s Inventory[{Slot:1b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.1 air
execute if score @s slot matches 2 if data entity @s Inventory[{Slot:2b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.2 air
execute if score @s slot matches 3 if data entity @s Inventory[{Slot:3b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.3 air
execute if score @s slot matches 4 if data entity @s Inventory[{Slot:4b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.4 air
execute if score @s slot matches 5 if data entity @s Inventory[{Slot:5b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.5 air
execute if score @s slot matches 6 if data entity @s Inventory[{Slot:6b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.6 air
execute if score @s slot matches 7 if data entity @s Inventory[{Slot:7b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.7 air
execute if score @s slot matches 8 if data entity @s Inventory[{Slot:8b,id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}}] run replaceitem entity @s container.8 air
execute if score @s slot matches -1 if data entity @s SelectedItem{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004},"minecraft:damage":5}} run clear @s minecraft:gunpowder[custom_data={custom_model_data:1004}] 1

# Clean up dropped items
kill @e[type=item,nbt={Item:{id:"minecraft:gunpowder",components:{"minecraft:custom_data":{custom_model_data:1004}}}}]
