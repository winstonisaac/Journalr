class Category < ApplicationRecord
  validates :name, presence:true
  validates_length_of :name, maximum: 18, allow_blank: false

  has_many :tasks, :dependent => :delete_all
  belongs_to :user
end
