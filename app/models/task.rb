class Task < ApplicationRecord
  validates :name, :deadline, presence:true
  validates_length_of :name, maximum: 24, allow_blank: false
  validates_length_of :details, maximum: 100

  belongs_to :category
end
