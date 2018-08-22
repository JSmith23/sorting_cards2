require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/guess'

class RoundTest < MiniTest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_attributes
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_returns_an_empty_array
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_record_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    first_card = round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, first_card
    assert_equal round.guesses.last, first_card
  end

  def test_number_of_guesses_after_record_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    first_card = round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.guesses.count
  end

  def test_the_number_of_correct_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.number_correct
  end

  def test_if_feedback_returns_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 'Correct!', round.guesses.first.feedback
  end

  def test_if_feedback_returns_incorrect
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 'Incorrect.', round.guesses.last.feedback
  end

  def test_the_number_of_correct_guesses_after_wrong_entry
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, round.number_correct
  end

  def test_percent_correct
    card_1 = Card.new("3","Hearts")
      card_2 = Card.new("4", "Clubs")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess({value: "3", suit: "Hearts"})
      round.record_guess({value: "Jack", suit: "Diamonds"})
      assert_equal 50, round.percent_correct
  end
end
