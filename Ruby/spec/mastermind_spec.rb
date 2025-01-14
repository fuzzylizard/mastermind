require 'rspec'
require './src/mastermind'

RSpec.describe Mastermind do
  let(:game) { Mastermind.new }

  it 'generate a secret' do
    secret = game.secret

    expect(secret.length).to eq(4)
    expect(Mastermind::COLOURS).to include(secret[0])
    expect(Mastermind::COLOURS).to include(secret[1])
    expect(Mastermind::COLOURS).to include(secret[2])
    expect(Mastermind::COLOURS).to include(secret[3])
  end

  it 'should return 4 return an empty array when no guesses match' do
    expect(game.guess([])).to eq([])
  end

  it 'should return 1 black when there is one exact match' do
    game.secret = [:red]

    expect(game.guess([:red])).to eq([:black])
  end

  it 'should return 2 blacks for 2 exact matches' do
    game.secret = [:red, :blue, :orange]

    expect(game.guess([:red, :yellow, :orange])).to eq([:black, :black])
  end

  it 'should return 4 blacks for 4 exact matches' do
    game.secret = [:red, :blue, :orange, :purple]

    expect(game.guess([:red, :blue, :orange, :purple])).to eq([:black, :black, :black, :black])
  end

  it 'should return 1 white for a non-exact match' do
    game.secret = [:red, :blue, :orange, :purple]

    expect(game.guess([:blue, :green, :green, :green])).to eq([:white])
  end

  it 'should return 1 black and 1 white' do
    game.secret = [:red, :blue, :orange, :purple]

    expect(game.guess([:red, :green, :blue, :green])).to eq([:black, :white])
  end
end
