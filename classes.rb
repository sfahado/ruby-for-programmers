#  A class is just a way of organizing and producing objects with similar attributes and methods.


class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description


# You can think of initialize as the function that “boots up” each object the class creates.


# Scope it Out
# Another important aspect of Ruby classes is scope




#  When dealing with classes, you can have variables that are available everywhere (global variables), ones that are only available inside certain methods (local variables), others that are members of a certain class (class variables), and variables that are only available to particular instances of a class (instance variables).


# Let’s do three things:

# Create a class variable, @@people_count, on line 3, and set it equal to 0.
# Increment @@people_count on line 8.
# Return @@people_count on line 13 so that our puts on line 20 will print out the number of people created so far.


class Person
  # Set your class variable to 0 on line 3
  
  @@people_count = 0
  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count +=1
  end
  
  def self.number_of_instances
    # Return your class variable on line 13
    @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"



# Inheritance is a tricky concept, so let’s go through it step by step.

# Inheritance is the process by which one class takes on the attributes and methods of another, and it’s used to express an is-a relationship. For example, a cartoon fox is a cartoon mammal, so a CartoonFox class could inherit from a CartoonMammal class.

# However, a Wizard is not an Elf, so it shouldn’t inherit from the Elf class (even if they have a lot of magical attributes and methods in common). Instead, both Wizard and Elf could ultimately inherit from the same MagicalBeing class.


# Check out the code in the editor. We’ve defined a class, ApplicationError, as well as a SuperBadError class that inherits from ApplicationError. Note that we don’t define the display_error method in the body of SuperBadError, but it will still have access to that method via inheritance. Click Run to see for yourself!

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error



# Let’s try a more entertaining (if less realistic) example. Create a new class, Dragon, that inherits from Creature. Give your derived class a fight method that overrides Creature‘s; instead of returning “Punch to the chops!”, it should return “Breathes fire!”.



class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature

  def fight
    return "Breathes fire!"
  end
end


class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature

  def fight
    puts "Instead of breathing fire..."
    super
  end
end


class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end


# Output:
# superclass mismatch for class Dragon