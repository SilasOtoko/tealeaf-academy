# 1. all players pick either Paper, Rock or Scissors
# 2. compare: paper > rock, rock > scissors, scissors > paper, or tie if same
# 3. Play again?

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
computer_score = 0
player_score = 0

puts "Welcome to Rock, Paper, Scissors!"

def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper covers Rock"
  when 'r'
    puts "Rock smashes Scissors"
  when 's'
    puts "Scissors cuts Paper"
  end
end

loop do
  # player makes a pick
  begin
    puts "---------"
    puts "Pick one: (p, r, s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "it's a tie!"
  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')
    display_winning_message(player_choice)
    player_score += 1
    puts "You've won!"
  else
    display_winning_message(player_choice)
    computer_score += 1
    puts "Computer has won!"
  end
  puts "Wins: #{player_score} Losses: #{computer_score}"
  puts "---------"
  puts "Play again? (y/n)"

  break if gets.chomp.downcase != 'y'

end

puts "Good bye!"