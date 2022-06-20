# The Ruby Lambda
Like procs, lambdas are objects. The similarities don’t stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.

# Check out the code in the editor. See the lambda bit? Typing

lambda { puts "Hello!" }
Is just about the same as

Proc.new { puts "Hello!" }
# In the example to the right, when we pass the lambda to lambda_demo, the method calls the lambda and executes its code.

def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })


# Lambda Syntax
# Lambdas are defined using the following syntax:

lambda { |param| block }

both are the same

Proc.new { |param| block }

# We have an array of strings in the editor, but we want an array of symbols.
# On line 4, create a new variable called symbolize. In symbolize, store a lambda that takes one parameter and calls .to_sym on that parameter.
# We then use symbolize with the .collect method to convert the items in strings to symbols!

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
# Write your code below this line!

symbolize = lambda {|param| param.to_sym }

# Write your code above this line!
symbols = strings.collect(&symbolize)
print symbols

# Lambdas vs. Procs
# If you’re thinking that procs and lambdas look super similar, that’s because they are! There are only two main differences.

# First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

# Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

# To see how this works, take a look at the code in the editor. Our first method calls a proc; the second calls a lambda.

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda

# Output:
# Batman will win!
# Iron Man will win!


# Create a lambda, symbol_filter, that takes one parameter and checks to see if that parameter .is_a? Symbol.
# Create a new variable called symbols, and store the result of calling my_array.select and passing it your lambda.
# puts symbols at the end of the file in order to see the final contents of the array.

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

# Add your code below!
symbol_filter = lambda {|x| x.is_a? Symbol}
symbols = my_array.select(&symbol_filter)

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

puts symbols



# The odds_n_ends array is full of all sorts of objects, but we only want the integers (numbers without decimal bits).
# Create a new variable, ints, and store the result of calling odds_n_ends.select method with a block that checks if the element .is_a? Integer.
# puts ints at the end of the file in order to see the final contents of the array.

odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]


is_symbol = Proc.new {|x| x.is_a? Integer }

puts ints = odds_n_ends.select(&is_symbol)





# Create a lambda called first_half that checks if a hash value is less than (that is, earlier in the alphabet than) “M”. (No need to do anything with the crew hash yet.) Make sure to use a capital “M,” since we’ll be checking capitalized names! Because it will be checking a hash, your lambda should include |key, value| instead of just |value|.





crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
# Add your code below!

first_half = lambda do |k,v|
  v < "M"
end
puts crew.select(&first_half)

