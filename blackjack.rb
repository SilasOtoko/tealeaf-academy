require 'pry'
# requirements #

# Make a deck of cards
# Assign values to each card

# 1. Deal two cards to both player and dealer
# 2. Calculate the total for player and total for dealer
# 3. Prompt player to hit or stay then it is dealers turn and back and forth
# 3b. If player's total is less than 21, he can choose to hit or stay again.
# 4. If player hits and goes over 21, dealer wins
# 5. If dealer hits and goes over 21, player wins
# 6. If player gets 21, player wins
# 7. If dealer gets 21, dealer wins
# 8. If player stays, dealer keeps going until he has at least 17
# 9. If both players stay, calculate total and declare winner

play_again = 0
player_hand = []
dealer_hand = []
suits = ['spade', 'diamond', 'club', 'heart']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = []
suits.each do |suit|
  cards.each do |card|
    deck << [suit, card]
  end
end
deck.shuffle!



# methods #

def hit
  #get random card from deck and remove that card from the hash
  #add the card to either the player's hand or the dealer's hand
end

def stay

end

def calculate_total(cards)
  arr = cards.map { |e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select { |e| e == "A" }.count.times do
      total -= 10 if total > 21
  end
  total # automatically returned since it is last statement
end


# Start Game #
puts "Let's play Blackjack!"

while play_again != 'n'
  #deal player and dealer 2 cards
  player_hand << deck.pop
  dealer_hand << deck.pop
  player_hand << deck.pop
  dealer_hand << deck.pop

  dealer_total = calculate_total(dealer_hand)
  player_total = calculate_total(player_hand)

  #show cards
  puts "Dealer has: #{dealer_hand[0]} and #{dealer_hand[1]}, for a total of #{dealer_total}"
  puts "Player has: #{player_hand[0]} and #{player_hand[1]}, for a total of #{player_total}"
  puts ""

  if player_total == 21
    puts "Congratulations, you hit blackjack! You win!"
  end

  while player_total < 21
    puts "Do you want to hit or stay? (hit/stay)"
    hit_or_stay = gets.chomp.downcase

    if !['hit', 'stay'].include?(hit_or_stay)
      puts "Error: you must choose hit or stay"
    end
    if hit_or_stay == 'stay'
      puts "You chose to stay"
      break
    end

    #hit
    new_card = deck.pop
    puts "Dealing card to player: #{new_card}"
    player_hand << new_card
    player_total = calculate_total(player_hand)
    puts "Your total is now: #{player_total}"

    if player_total == 21
      puts "Congratulations, you hit blackjack! You Win!"
      exit
    elsif player_total > 21
      puts "Sorry, looks like you busted!"
      exit
    end
  end

  # Dealer's turn
  if dealer_total == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  end

  while dealer_total < 17
    #hit
    new_card = deck.pop
    puts "Dealing new card for dealer: #{new_card}"
    dealer_hand << new_card
    dealer_total = calculate_total(dealer_hand)
    puts "Dealer's total: #{dealer_total}"

    if dealer_total == 21
      puts "Sorry, dealer hit blackjack. You lose."
      exit
    elsif dealer_total > 21
      puts "Congratulations, dealer busted. You win!"
      exit
    end
  end

  # Compare hands

  puts "Dealer's cards: "
  dealer_hand.each do |card|
    puts "=> #{card}"
  end

  puts "Your cards: "
  player_hand.each do |card|
    puts "=> #{card}"
  end
  puts ""

  if dealer_total > player_total
    puts "Sorry, dealer wins."
  elsif dealer_total < player_total
    puts "Congratulations, you win!"
  else
    puts "It's a tie!"
  end
end
