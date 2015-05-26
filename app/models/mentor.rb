class Mentor < User
  validates :official_ranking, presence: true
  validates :official_ranking, numericality: true
  validates :city, presence: true
  validates :country, presence: true
end
