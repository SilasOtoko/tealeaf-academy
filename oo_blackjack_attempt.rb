require 'pry'

class Card
  attr_accessor :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def pretty_output
    "The #{face_value} of #{suit}"
  end

  def to_s
    pretty_output
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
    shuffle_deck!
  end

  def shuffle_deck!
    @cards.shuffle!
  end

  def size
    cards.size
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "------ #{name}'s Hand ------"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map { |card| card.face_value }

    total = 0
    face_values.each do |value|
      if value == "A"
        total += 11
      else total += (value.to_i == 0 ? 10 : value.to_i)
      end
    end

    face_values.select { |value| value == "A" }.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def bust?
    total > 21
  end
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end

  def show_player_hand
    show_hand
  end
end

class Dealer
  include Hand

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def show_dealer_hand
    puts "------ Dealer's Hand ------"
    puts "=> First card is hidden"
    puts "=> Second card is #{cards[1]}"
  end
end

class Blackjack
  attr_accessor :deck, :player, :dealer 

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
    @ask_name = true
  end

  def set_player_name
    puts "What's your name?"
    player.name = gets.chomp
  end

  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end 

  def show_cards
    player.show_player_hand
    dealer.show_dealer_hand
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, dealer hit blackjack. #{player_name} loses"
      else
        puts "You hit blackjack! #{player.name} wins!"
      end
    elsif player_or_dealer.bust?
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer busted. #{player.name} wins!"
      else
        puts "Player has busted. Dealer wins."
      end
      play_again?
    end
  end

  def player_turn
    puts "#{player.name}'s turn"

    blackjack_or_bust?(player)

    while !player.bust?
      puts "What would #{player.name} like to do? (hit/stay)"
      response = gets.chomp.downcase
      if !['hit', 'stay'].include?(response)
        puts "Please enter either hit or stay"
      next
      end

      if response == 'stay'
        puts "#{player.name} chose to stay"
        break
      end

      #hit
      new_card = deck.deal_one
      puts "Dealing card to #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total is now: #{player.total}"

      blackjack_or_bust?(player)
    end
    puts "#{player.name} stays at #{player.total}"
  end

  def dealer_turn
    puts "Dealer's turn"

    blackjack_or_bust?(dealer)
    while dealer.total < DEALER_HIT_MIN
      new_card = deck.deal_one
      puts "Dealing a card to the dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now: #{dealer.total}"

      blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}"
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulations, #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry, #{player.name} loses."
    else
      puts "It's a tie!"
    end
    play_again?
  end

  def play_again?
    puts ""
    puts "Would you like to play again? (yes/no)"
    playing_again = gets.chomp.downcase
    if playing_again == 'yes'
      puts "Starting new game..."
      puts""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      @ask_name = false
      start
    else
      puts "Goodbye #{player.name}!"
      exit
    end
  end

  def start
    if @ask_name == true
      set_player_name
    end
    deal_cards
    show_cards
    player_turn
    dealer_turn
    who_won?
  end
end

game = Blackjack.new
game.start

