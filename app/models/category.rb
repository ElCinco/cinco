class Category < ApplicationRecord
  has_many :links

  attr_accessible :label, :color
end
