class Client < ApplicationRecord
    has_one_attached :image
    has_many :feedbacks
  end
  