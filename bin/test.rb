puts "Hello there, Welcome to Logger! We help log interactions between users and their plants."
main_menu = ["Plants", "Users", "Interactions", "Exit"]
    main_choice = nil 
        while main_choice != "Exit"
            main_choice = prompt.select("This is the main menu.", main_menu)
            if main_choice == "Plants"
                plants_menu = ["New Plant", "My Plants", "Change Owner", "Delete Plant",  "Exit"]
                plant_choice = nil 
                while plant_choice != "Exit"
                    plant_choice = prompt.select("What's next?", plant_menu)
                    if plant_choice == "New Plant"
                    elsif plant_choice == "My Plants" 
                    elsif plant_choice == "Change Owner" 
                    elsif plant_choice == "Delete Plant" 
                    else end 
                    end
            elsif main_choice == "Users"
                user_menu = ["New Profile", "My Plants", "Change Location", "Delete Profile",  "Exit"]
                user_choice = nil 
                while user_choice != "Exit"
                    user_choice = prompt.select("What's next?", user_menu)
                    if user_choice == "New Profile"
                    elsif user_choice == "My Plants" 
                    elsif user_choice == "Change Location" 
                    elsif user_choice == "Delete Profile" 
                    else end 
                    end
            elsif main_choice == "Interactions"
                inter_menu = ["New Interaction", "Saved Interactions", "My Forecasts", "Exit"]
                inter_choice = nil 
                while inter_choice != "Exit"
                    inter_choice = prompt.select("What's next?", inter_menu)
                    if inter_choice == "New Interaction"
                    elsif inter_choice == "Saved Interactions" 
                    elsif inter_choice == "My Forecasts" 
                    else end 
                    end
            else end
        end