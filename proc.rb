# Keeping Your Code DRY
# Remember when we told you that everything is an object in Ruby? Well, we sort of fibbed. Blocks are not objects, and this is one of the very few exceptions to the “everything is an object” rule in Ruby.

# Because of this, blocks can’t be saved to variables and don’t have all the powers and abilities of a real object. For that, we’ll need… procs!

# You can think of a proc as a “saved” block: just like you can give a bit of code a name and turn it into a method, you can name a block and turn it into a proc. Procs are great for keeping your code DRY, which stands for Don’t Repeat Yourself. With blocks, you have to write your code out each time you need it; with a proc, you write your code once and can use it many times!



# Proc Syntax
# Procs are easy to define! You just call Proc.new and pass in the block you want to save. Here’s how we’d create a proc called cube that cubes a number (raises it to the third power):

cube = Proc.new { |x| x ** 3 }
# We can then pass the proc to a method that would otherwise take a block, and we don’t have to rewrite the block over and over!

[1, 2, 3].collect!(&cube)
# ==> [1, 8, 27]
[4, 5, 6].map!(&cube)
# ==> [64, 125, 216]
# (The .collect! and .map! methods do the exact same thing.)

# The & is used to convert the cube proc into a block (since .collect! and .map! normally take a block). We’ll do this any time we pass a proc to a method that expects a block.



# Why Procs?
# Why bother saving our blocks as procs? There are two main advantages:

# Procs are full-fledged objects, so they have all the powers and abilities of objects. (Blocks do not.)
# Unlike blocks, procs can be called over and over without rewriting them. This prevents you from having to retype the contents of your block every time you need to execute a particular bit of code.



# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# Complete this as a new Proc
over_4_feet = Proc.new { |height| height >= 4 }

# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet)

puts can_ride_1
puts can_ride_2
puts can_ride_3


can_ride_1 = group_1.select { |height| height >= 4 }
can_ride_2 = group_2.select { |height| height >= 4 }
can_ride_3 = group_3.select { |height| height >= 4 }


# Create a method, greeter, that takes no arguments and yields to a block.

# Create a Proc, phrase, that puts "Hello there!". Pass this to greeter instead of a block. (Don’t forget to pass &phrase instead of just phrase!)



def greeter
  yield
end


phrase = Proc.new { |x| puts "Hello there!" }

greeter(&phrase)




# Call Me Maybe
# Nice work! Calling a proc with a method isn’t too tricky. However, there’s an even easier way.

# Unlike blocks, we can call procs directly by using Ruby’s .call method. Check it out!

# test = Proc.new { # does something }
# test.call
# # does that something!
# Remember: there’s always more than one way to do something in Ruby.


# Go ahead and create a proc called hi that puts "Hello!", then .call it!


hi = Proc.new {puts "Hello!"}

hi.call