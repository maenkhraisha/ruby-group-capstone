require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  def can_be_archived?()
    super && Date.today - Date.parse(@last_played_at) > 730
  end
end
