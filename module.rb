class Thing 
	attr_reader :name, :age
	attr_writer :grade, :sex
	attr_accessor :color, :identity
end

t = Thing.new
# Error here
# t.name = "A name"
# t.age = "15"

# Error here
t.grade =  "A"
t.sex =  "male"

# Error here
# puts t.grade

t.color = "Black"
t.identity= "UK"

puts t.inspect


# Modules
# Modules are like classes but they do not allow instances (objects) to be created from them and they do not permit inheritance. Modules are often used to store ‘libraries’ of methods and constants that you may want to use in a variety of unrelated classes. In other words, modules allow you to share code without using inheritance.
# Let’s suppose you have this code in a file called mymodule.rb:
module MyModule
	GOODMOOD = "happy"
	BADMOOD = "grumpy"
	def greet
		return "I'm #{GOODMOOD}. How are you?"
	end
	def MyModule.greet
		return "I'm #{BADMOOD}. How are you?"
	end 
end
# Here GOODMOOD and BADMOOD are constants. They are accessed from outside the module using the :: operator:
  puts(MyModule::GOODMOOD)
# This displays:
# happy
# MyModule.greet is a module method and can be accessed using the syntax shown below:
  puts( MyModule.greet )
# This displays:
#      I'm grumpy. How are you?
# The other greet method (the one not preceded by MyModule.) is an instance method. Modules cannot have instances so in order to access this method I must include (or ‘mix in’) this module in another class. Here I include the module and call the greet method:
include MyModule
  puts( greet )
# This displays:
#      I'm happy. How are you?
# When including modules into separate source code files you may first need to ‘require’ (that is, to load) the module code file before including the module, like this:
  # require( "./ mymodule.rb")
  include MyModule