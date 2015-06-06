require 'pry'
# start game
# Deal Cards
# Show Cards
# Player turn
# Hit
# Dealer turn
# Compare Hands

# make deck #
suit = ['Spade', 'Diamond', 'Heart', 'Club']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = suit.product(cards)
deck.shuffle!

player_hand = []
dealer_hand = []

# Methods #
def calculate_total(cards)
  arr = cards.map { |e| e[1] } # Isolates the second value of each array
                                # i.e. ["Spade", "K"] it will isolate "K"
  total = 0
  arr.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |e| e == 'A' }.count.times do
    total -= 10 if total > 21
  end
  total
end

play_again = 0
winner = false

# start game #
while play_again != 'n'
  while winner != true
    puts "Welcome to Blackjack!"

    player_hand << deck.pop 
    dealer_hand << deck.pop
    player_hand << deck.pop
    dealer_hand << deck.pop

    player_total = calculate_total(player_hand)
    dealer_total = calculate_total(dealer_hand)

    puts "Player: #{player_hand} Total: #{player_total}"
    puts "Dealer: #{dealer_hand} Total: #{dealer_total}"
    puts ""

    while player_total < 21
      puts "Do you want to hit or stay? (hit/stay)"
      hit_or_stay = gets.chomp.downcase
      if !["hit", "stay"].include? hit_or_stay
        puts "Please enter either hit or stay"
      elsif hit_or_stay == 'hit'
        player_hand << deck.pop
        player_total = calculate_total(player_hand)
        puts "Player's total: #{player_total}"
        puts ""
      else
        break
      end
    end

    if player_total == 21
      puts "Congrats Player! You have blackjack! You win!"
      winner = true
    elsif player_total > 21
      puts "Bust! Dealer wins."
      winner = true
    end

    if dealer_total == 21 && winner == false
      puts "Sorry, dealer has blackjack. You lose."
      winner = true
    end

    while dealer_total < 17 && winner == false
      dealer_hand << deck.pop
      puts "Dealing new card to dealer"
      dealer_total = calculate_total(dealer_hand)
      puts "Dealer's total: #{dealer_total}"
      puts ""

      if dealer_total == 21
        puts "Sorry, dealer has blackjack. You lose."
        winner = true
      elsif dealer_total > 21
        puts "Dealer busts! You win!"
        winner = true
      end
    end

    if player_total < 21 && dealer_total < 21
      if player_total == dealer_total
        puts "It's a tie!"
        winner = true
      elsif player_total < dealer_total
        puts "Player score: #{player_total}, Dealer score: #{dealer_total}"
        puts "Dealer wins."
        winner = true
      elsif player_total > dealer_total
        puts "Player score: #{player_total}, Dealer score: #{dealer_total}"
        puts "Player wins!"
        winner = true
      end
    end
  end

  puts ""
  puts "Play again? (y/n)"
  play_again = gets.chomp.downcase
  if !['y', 'n'].include? play_again
    puts "Please pick either y or n"
  end
  player_hand = []
  dealer_hand = []
  player_total = 0
  dealer_total = 0
  winner = false
  puts "----------------------------------"
end