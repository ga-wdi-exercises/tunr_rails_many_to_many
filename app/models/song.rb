class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :favorites
  has_many :users, through: :favorites
end
