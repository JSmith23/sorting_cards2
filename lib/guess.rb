require './lib/card'

class Guess
  attr_reader :response,
              :card
  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response == "#{@card.instance_variable_get('@value')}" + ' of ' + "#{@card.instance_variable_get('@suit')}"
  end

  def feedback
    if correct? == true
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
