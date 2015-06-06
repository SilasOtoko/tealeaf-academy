# calculator app #
# 1. string interpolation vs concatenation
# 2. extract repetitive logic to methods
# 3. keep track of variable types (class)
# 4a. Correct way to debug - use pry
# 4b. Variable scope
# 5. Pass by Reference Vs. Pass by Value; if method mutates caller, outer obj was modified


require 'pry'

def say(msg)
  puts "=> #{msg}"
end

say "What is the first number?"
num1 = gets.chomp

say "what's the second number?"
num2 = gets.chomp

say "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

#binding.pry  # Pry will stop your code here, where you can
             # do things like changing the variables
              # Press ctrl + d to continue the execution of code

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else operator == '4'
  result = num1.to_f / num2.to_f
end

puts "Result is #{result}"