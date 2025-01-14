class Mastermind

  COLOURS = [:red, :blue, :green, :orange, :purple, :yellow]

  def initialize
    @secret = []
  end

  def secret
    @secret = COLOURS.sample(4)
  end

  def secret=(secret)
    @secret = secret
  end

  def guess(guess)
    result = []
    guess.each_with_index do |colour, index|
      if @secret[index] == colour
        result << :black
      elsif @secret.include?(colour)
        result << :white
      end
    end

    result
  end
end
