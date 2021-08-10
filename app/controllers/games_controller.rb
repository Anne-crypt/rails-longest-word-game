require 'json'
require 'open-uri'


class GamesController < ApplicationController

  def new
    @letters = []
    10.times { @letters << (("A".."Z").to_a.shuffle.first) }
  end

  def score
    @answer = params[:answer]
    if @answer ==
      @answer = 'Great !'
    elsif @answer.is_english? == false
      @answer = 'The word is valid according to the grid, but is not a valid English word'
    else
      @answer = "The word can’t be built out of the original grid"
    end
  end

  def is_english?(answer)
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    if user[:found]
    end
  end
end
