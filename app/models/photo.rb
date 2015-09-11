class Photo < ActiveRecord::Base
  attr_accessor :image,:album_id
  validates :image, presence: true
  belongs_to :album
  acts_as_taggable
  mount_uploader :image, ImageUploader
end
