class Dog

	@@dogs = 0
	def initialize(name) 
		puts "my name is #{name}" + ' ' + @@dogs.to_s
		@name = name
		@@dogs += 1	
	end
	def talk
		puts 'Woof'
	end

	def Dog.dog_infos
		puts "number of dogs are #{@@dogs}"
	end
end


class Puppu < Dog
	def whatisname
		puts "name is puppu"

	end
end



mydog = Dog.new("Doggie")
mydog.talk


p = Puppu.new("pappppyy")
p.whatisname

Dog.dog_infos