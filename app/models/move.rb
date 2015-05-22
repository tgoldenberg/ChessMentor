class Move < ActiveRecord::Base
  validates :game_id, presence: true
  validates :piece, presence: true
  validates :notation, presence: true
  validates_format_of :notation, without: /undefined/
  validates :user_id, presence: true

  belongs_to :game
  belongs_to :user
  has_one :board

end
