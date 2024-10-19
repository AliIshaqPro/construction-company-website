# app/models/gallery.rb
class Gallery < ApplicationRecord
    has_many_attached :images
  end
  