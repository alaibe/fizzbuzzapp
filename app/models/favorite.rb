class Favorite < ActiveRecord::Base

  belongs_to :user

  validates :offset, numericality: { only_integer: true, greater_than: 0 }

end