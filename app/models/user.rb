class User < ActiveRecord::Base

  has_many :favorites

  validates :name, presence: true

  def create_favorite(attributes)
    favorites.create(attributes)
  end

end