class Link < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :category

  attr_accessor :url, :title
end
