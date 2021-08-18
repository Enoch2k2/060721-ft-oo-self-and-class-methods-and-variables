class Cli
  attr_accessor :current_owner

  def start
    puts "Welcome to Flatiron Pet Shop!"
    sleep(1)
    create_owner
    main_menu_options
  end

  def main_menu_options
    puts "Type '1' to create a pet"
    puts "Type '2' to adopt a pet"
    puts "Type '3' to list pets"
    puts "Type '4' to list adopted pets"
    puts "Type 'exit' to exit program"
    main_menu
  end

  def main_menu
    input = question?("Please enter (1 - 4) or 'exit: ")
    case input
      when "1"
        create_pet
        main_menu_options
      when "2"
        adopt_pet
        main_menu_options
      when "3"
        list_pets(Pet.all)
        main_menu_options
      when "4"
        list_pets(self.current_owner.pets)
        main_menu_options
      when "exit"
        goodbye
      else
        invalid_choice
        main_menu_options
      end
  end

  def create_owner
    system("clear")
    name = question?("What is your name? ")
    self.current_owner = Owner.find_or_create_by_name(name)
  end

  def create_pet
    system("clear")
    name = question?("What is the name of the Pet? ")
    Pet.find_or_create_by_name(name)
  end

  def adopt_pet
    non_adopted_pets = Pet.all.select{ |pet| !self.current_owner.pets.include?(pet) }
    list_pets(non_adopted_pets)
    index = question?("Which pet would you like to adopt? ").to_i - 1

    if index.between?(0, Pet.all.length - 1)
      pet = non_adopted_pets[index]
      self.current_owner.add_pet(pet)
    end
  end

  def list_pets(pets)
    system('clear')
    puts "---------------------"
    pets.each.with_index(1) do |pet, index|
      puts "#{index}. #{pet.name}"
    end
    puts "---------------------"
    puts ""
  end

  def question?(string)
    print string
    gets.strip
  end

  def invalid_choice
    puts "Invalid Choice, Please Try Again!"
  end

  def goodbye
    system "clear"
    puts "exiting program..."
    sleep(2)
    system("clear")
    exit
  end
end