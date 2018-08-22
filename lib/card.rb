class Card
  attr_reader :value,
              :suit,
              :card_id 
  def initialize(value,suit)
    @value = value
    @suit = suit
    @card_id = card_value_id + card_suit_id
  end

  def card_value_id
    card_id = {'2' => 2, '3' => 7, '4' => 13, '5' => 18, '6' => 23, '7' => 28, '8' => 32, '9' => 37, '10' => 42, 'Jack' => 47, 'Queen' => 52, 'King' => 57, 'Ace' => 63}
    card_id[@value]
  end

  def card_suit_id
    suit_id = {'Clubs' => 1, 'Diamonds' => 2, 'Hearts' => 3, 'Spades' => 4}
    suit_id[@suit]
  end
end
