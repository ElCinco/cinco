class Category < ApplicationRecord
  has_many :links

  attr_accessor :label, :color
end
