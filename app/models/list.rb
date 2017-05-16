class List < ApplicationRecord
  has_many :links

  def self.created_for_today
    list = List.last

    if list && list.publish_date == Date.today
      return list
    end

    false
  end
end
