require 'date'
require './item'

class Game < Item
  attr_reader :multiplier, :last_play_date

  def initialize(multiplier, last_play_date)
    super()
    @multiplier = multiplier
    @last_play_date = last_play_date
  end

  def can_be_archived?
    date_now = Time.new.year
    last_play_date = Date.parse @last_play_date
    last_play_date = last_play_date.year
    diff = date_now.to_i  - @last_play_date.to_i
    super && diff < 2   
  end
end
