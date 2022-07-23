class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_presence_of :movie_id, :list_id
  validates :movie_id, uniqueness: { scope: :list_id,
    message: "this combination has been taken"}
  validates :comment, length: { minimum: 6 }
end
