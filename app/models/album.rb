class Album < ActiveRecord::Base
  belongs_to :user
  # attr_accessor :image
  has_many :photos , dependent: :destroy
  accepts_nested_attributes_for :photos
end
