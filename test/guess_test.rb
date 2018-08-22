require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'


class GuessTest < MiniTest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_it_has_attributes
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal '10 of Hearts', guess.response
    assert_equal card, guess.card
  end

  def test_correct_response_equal_to_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_if_feedback_returns_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal 'Correct!', guess.feedback
  end

  def test_test_if_feedback_returns_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal 'Incorrect.', guess.feedback
  end

  def test_correct_not_equal_to_card
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)
    assert_equal false, guess.correct?
  end
end
