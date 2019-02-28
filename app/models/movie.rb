class Movie < ApplicationRecord
  belongs_to :director
  validates :name, presence: true
  validates :name, uniqueness: true
  validate :movie_cannot_be_in_future

  def movie_cannot_be_in_future
    if self.year >= Time.now.year
      errors.add(:year, "is in the future so you cannot add the movie.")
    end
  end

end
