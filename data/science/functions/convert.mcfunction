# Check if valid amount
execute as @a[scores={sci_convert=1..}] run {
  # Store player's current level
  execute store result score @s xp_levels run experience query @s levels

  # Verify sufficient XP
  execute if score @s xp_levels >= @s sci_convert run {
    # Deduct levels
    experience add @s -${@s sci_convert} levels
    
    # Give Science items
    give @s minecraft:gunpowder{display:{Name:'{"text":"Science","italic":false}'},CustomModelData:1004} ${@s sci_convert}
    
    # Feedback
    tellraw @s ["Converted ", {"score":{"name":"@s","objective":"sci_convert"}}, " levels to Science!"]
  }
  
  # Error if not enough XP
  execute unless score @s xp_levels >= @s sci_convert run tellraw @s {"text":"Not enough levels!","color":"red"}
  
  # Reset trigger
  scoreboard players reset @s sci_convert
}
