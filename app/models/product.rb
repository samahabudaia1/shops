class Product < ApplicationRecord
		
  validates :name, presence: true
  validates :description, presence: true
validates :colour, presence: true
validates :image_url, presence: true
  has_many :comments
  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first.rating
  end

  def lowest_rating_comment
    comments.rating_asc.first.rating
  end

  def average_rating
    comments.average(:rating).to_f
  end
  
end