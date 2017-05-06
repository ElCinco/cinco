class List < ApplicationRecord
  has_many :links

  attr_accessor :publish_date
end
