class Task < ApplicationRecord
  validates :name, :deadline, presence:true
  validates_length_of :name, maximum: 24, allow_blank: false

  belongs_to :category
end
