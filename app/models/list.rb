class List < ApplicationRecord
  has_many :links

  attr_accessible :publish_date
end
