class List < ApplicationRecord
  has_many :links
  validate_on_create :link_count_within_bounds

  def self.created_for_today
    list = List.last

    if list && list.publish_date == Date.today
      return list
    end

    false
  end

  private

  def link_count_within_bounds
    return if links.blank?
    errors.add("Too many links") if links.size > 5
  end
end
