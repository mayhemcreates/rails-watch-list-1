class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :restrict_with_exception
  validates :name, presence: true, uniqueness: true
end
