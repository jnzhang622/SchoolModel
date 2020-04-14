require_relative '../config/environment'

prompt = TTY::Prompt.new

puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
puts "Welcome to the Pokemon Team Builder App"

selection = ["Search by Input","Search by Generation","Browse Items", "View/Edit Teams", "Exit"]
input = nil
choice = nil
while choice != "Exit"
  choice = prompt.select("How would you like to get started?", selection)
  
  if choice == "Search by Input" #Searches Pokemon by typing prompt.
    puts "What Pokemon would you like to look at?\n"
    input = gets.chomp.downcase
    pokequery = PokeApi.get(pokemon: input)
    puts "\nID: " + "#{pokequery.id}" + " - " + pokequery.name.capitalize
    puts "Type: " + pokequery.types.map {|t| t.type.name.capitalize}.join(" & ")
    puts "\n"

    adddontadd = prompt.select("Would you like to add this pokemon to a party?", ["Yes", "No"])
    if adddontadd == "Yes"
      puts "Which team would you like to add this pokemon to?"
      teamsave = Team.find_or_create_by(name: gets.chomp)
      nickname = prompt.select("Would you like to give it a nickname?", ["Yes", "No"])
      if nickname == "Yes"
        nickname = gets.chomp
      else
        nickname = pokequery.name
      end
      newpokemon = Pokemon.create!(team: teamsave, species: pokequery.name, name: nickname)
      abilitychoice = prompt.select("Which ability would you like to add to #{pokequery.name}", [pokequery.abilities.map {|t| t.ability.name}])
      Ability.create(pokemon:newpokemon, name:abilitychoice, description:PokeApi.get(ability: abilitychoice).effect_entries[0].short_effect)
      
    elsif adddontadd == "No"
    end
  
  elsif choice == "Search by Generation" #Searches Pokemon with menu by Generation
    generation = ["Generation I", "Generation II", "Generation III", "Generation IV", "Generation V", "Generation VI", "Generation VII", "Exit"]
    gen = nil
    while gen != "Exit"
      gen = prompt.select("Which generation would you like to look at?", generation, per_page: 8)
    end
    
  elsif choice == "Browse Items"

  elsif choice == "View/Edit Teams" #Edits any existing teams
    viewteam = prompt.select("Which Team would you like to look at?", Team.all.map {|v| v.name})
    teamselect = Team.all.find_by(name: viewteam)
    viewstats = teamselect.pokemons.map do |p| 
      puts " "
      puts "Team: " + "#{p.team.name}" + ", Species: " + "#{p.species}" + ", Name: " + "#{p.name}"
      puts "Ability: " + "#{p.abilities[0].name}" + " - #{p.abilities[0].description}"
      if p.helditems != []
        puts "Held Item: " + "#{p.helditems[0].name}"
      end
      if p.attacks != []
        puts "Attacks: " + "#{p.attacks[0].name}" + ", " + "#{p.attacks[1].name}" + ", " + "#{p.attacks[2].name}" + ", " + "#{p.attacks[2].name}" end
      end
      puts " "
    teammenu = ["Edit Pokemon Entries", "View Team", "Change Team Name", "Delete Team", "Exit"]
    teamoptions = nil
    while teamoptions != "Exit"
      teamoptions = prompt.select("What would you like to do?", teammenu)
        if teamoptions == "Edit Pokemon Entries"
          pokemonmapmenu = [teamselect.pokemons.map {|p| p.name}, "Exit"]
          pokemonselect = nil
          while pokemonselect != "Exit"
            pokemonselect = prompt.select("Who would you like to look at?", pokemonmapmenu)
            if pokemonselect != "Exit"
              input = teamselect.pokemons.find_by(name: pokemonselect)
              pokequery = PokeApi.get(pokemon: input.species)
              anothermenu = ["Change Nickname", "Edit Ability", "Add/Edit Held Item", "Add/Edit Attacks", "Remove Pokemon", "Exit"]
              pokemonselectaction = nil
              while pokemonselectaction != "Exit"
                pokemonselectaction = prompt.select("What would you like to do with #{pokemonselect.chomp}?", anothermenu)
                  if pokemonselectaction == "Change Nickname"
                    puts "What would you like to change #{pokemonselect}'s name to?"
                    input.update(:name => gets.chomp)
                  elsif pokemonselectaction == "Edit Ability"
                    newability = prompt.select("Which ability would you like #{pokemonselect.chomp}'s to change to?", [pokequery.abilities.map {|t| t.ability.name}])
                    abilityquery = PokeApi.get(ability: newability)
                    input.abilities[0].update(:name => abilityquery.name, :description => abilityquery.effect_entries[0].short_effect)
                  elsif pokemonselectaction == "Add/Edit Held Item"
                    if input.helditems.count < 1
                      puts "What item would you like to add to #{pokemonselect}?"
                      itemselect = gets.chomp
                      if PokeApi.get(item: itemselect)
                        itemquery = PokeApi.get(item: itemselect)
                        Helditem.create(pokemon:input, name:itemquery.name, description:itemquery.effect_entries[0].short_effect)
                      else
                        puts "Item does not exist, returning to previous menu."
                      end

                    else
                      puts "What item would you like to replace #{pokemonselect}'s #{input.helditems.name} with?"
                      itemselect = gets.chomp
                      if PokeApi.get(item: itemselect)
                        itemedit = input.itemheld[0]
                        itemquery = PokeApi.get(item: itemselect)
                        itemedit.update(name => itemquery.name, description => itemquery.effect_entries[0].short_effect)
                      else
                        puts "Item does not exist, returning to previous menu."
                      end
                    end

                  elsif pokemonselectaction == "Add/Edit Attacks"
                    if input.attacks == []
                      while input.attacks.count < 4
                        attackselect = prompt.select("Please select #{pokemonselect.chomp}'s attacks?", pokequery.moves.map {|m| m.move.name}, per_page: 30)
                        attackquery = PokeApi.get(move: attackselect)
                        Attack.create(pokemon:input, name:attackquery.name, atk_type:attackquery.type.name, power:attackquery.power, description:attackquery.effect_entries[0].short_effect)
                      end
                    else
                      attackselect = prompt.select("Which of #{input.name.chomp}'s attacks would you like to change?", input.attacks.map {|m| m.name}, per_page: 30)
                      attackedit = input.attacks.find_by(name: attackselect)
                      newattack = prompt.select("Please select #{pokemonselect.chomp}'s new attack?", pokequery.moves.map {|m| m.move.name}, per_page: 30)
                      attackquery = PokeApi.get(move: newattack)
                      attackedit.update(:name => attackquery.name, :atk_type => attackquery.type.name, :power => attackquery.power, :description => attackquery.effect_entries[0].short_effect)
                    end
                  end
              end
            end
          end
        elsif teamoptions == "View Team"
          viewstats = teamselect.pokemons.map do |p| 
            puts " "
            puts "Team: " + "#{p.team.name.chomp}" + ", Species: " + "#{p.species}" + ", Name: " + "#{p.name}"
            puts "Ability: " + "#{p.abilities[0].name}" + " - #{p.abilities[0].description}"
            if p.helditems != []
              puts "Held Item: " + "#{p.helditems[0].name}"
            end
            if p.attacks != []
              puts "Attacks: " + "#{p.attacks[0].name}" + ", " + "#{p.attacks[1].name}" + ", " + "#{p.attacks[2].name}" + ", " + "#{p.attacks[2].name}" end
            end
            puts " "

        elsif teamoptions == "Change Team Name"
          puts "What would you like to change #{teamselect.name}'s name to?"
          teamselect.update(:name => gets)

        elsif teamoptions == "Delete Team" #Deletes team and all assiciated items, attacks and abilities.
          teamselect.pokemons.map {|p| p.attacks.destroy}
          teamselect.pokemons.map {|p| p.helditems.destroy}
          teamselect.pokemons.map {|p| p.abilities.destroy}
          teamselect.pokemons.map {|p| p.destroy}
          teamselect.destroy
        end
      
    end
  end
end
