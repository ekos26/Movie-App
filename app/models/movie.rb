class Movie < ApplicationRecord
  belongs_to :director
  validates :name, presence: true
  validate :movie_cannot_be_in_future

  def movie_cannot_be_in_future
    if self.year >= Time.now.year
      errors.add(:year, "This movie hasn't come out yet.")
    end
  end

end
