require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def sort
    n = cards.length

    loop do
      swapped = false
      (n - 1).times do |i|
        if @cards[i].card_id > @cards[i + 1].card_id
          @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
          swapped = true
        end
      end
      break if not swapped
    end
    @cards
  end
end
