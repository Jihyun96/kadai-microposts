class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :bookmarks
  has_many :bookmark_user, through: :bookmarks, source: :user
end
