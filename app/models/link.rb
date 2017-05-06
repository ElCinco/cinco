class Link < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :category

  def self.created_for_today_by_user(user)
    if List.created_for_today
      return Link.find_by(user: user, list: List.last)
    end
  end
end
