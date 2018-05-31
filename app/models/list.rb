class List < ApplicationRecord
  has_many :links
  extend FriendlyId
  friendly_id :publish_date, use: [:slugged, :history]

  # def should_generate_new_friendly_id?
  #  new_record? || slug.blank?
  # end

  def self.created_for_today
    list = List.last

    if list && list.publish_date == Date.today
      return list
    end

    false
  end


  def previous_list
    self.class.where("publish_date < ?", publish_date).order(publish_date: :desc).first
  end

  def next_list
    self.class.where("publish_date > ?", publish_date).order(publish_date: :asc).first
  end

  acts_as_voteable

end
