require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:deadline) }
  it { should validate_length_of(:name).is_at_most(24) }
  it { should validate_length_of(:details).is_at_most(100) }
end
