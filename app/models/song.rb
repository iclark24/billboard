class Song < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :artist
end
