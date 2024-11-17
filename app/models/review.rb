class Review < ApplicationRecord
    has_one_attached :image
  
    validates :name, :content, presence: true
  end
  