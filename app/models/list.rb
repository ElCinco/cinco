class List < ApplicationRecord
  has_many :links

  def self.created_for_today
    list = List.last

    return list && list.publish_date == Date.today
  end
end
