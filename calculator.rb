require 'pry'

request = 0;

while request != 'stop'
  puts "=> Enter the first number"
  num1 = gets.chomp

  puts "=> Enter the second number"
  num2 = gets.chomp

  puts "=> Choose: 1)Add 2)Subtract 3)Multiply 4)Divide"
  operator = gets.chomp

  if operator == '1'
    result = num1.to_i + num2.to_i
  elsif operator == '2'
    result = num1.to_i - num2.to_i
  elsif operator == '3'
    result = num1.to_i * num2.to_i
  elsif operator == '4'
    result = num1.to_f / num2.to_f
  else
    puts "please enter a valid choice"
  end

  puts "The result is #{result}"
  puts "Would you like go again? If not, type 'stop',
        otherwise press enter"
  request = gets.chomp.downcase
end