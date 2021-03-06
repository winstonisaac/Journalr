class Category < ApplicationRecord
  validates :name, presence:true
  validates_length_of :name, maximum: 24, allow_blank: false

  has_many :tasks
  belongs_to :user
end
