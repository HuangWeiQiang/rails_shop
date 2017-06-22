class Category < ApplicationRecord
  has_many :items
  def parent_name
  end
end
