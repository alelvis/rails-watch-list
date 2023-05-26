class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true
  validates :name, presence: true

  def avg_rating
    return 0 if reviews.empty?

    reviews.map(&:rating).sum.to_f/reviews.size
  end
end
