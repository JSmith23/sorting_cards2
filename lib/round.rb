require './lib/card'
require './lib/deck'
require './lib/guess'
require 'pry'
class Round
  attr_reader :deck,
              :guesses
  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(hash_value)
    arr_val = hash_value.values
    new_str = "#{arr_val[0]} of #{arr_val[1]}"
    guess = Guess.new(new_str, current_card)
    @guesses << guess
    @deck.cards.rotate(1)
    guess
  end

  def number_correct
    correct = 0
    @guesses.each do |guess|
      if guess.feedback == 'Correct!'
        correct += 1
      end
    end
    correct
  end

  def percent_correct
    number_correct.to_f / @guesses.count * 100
  end
end
