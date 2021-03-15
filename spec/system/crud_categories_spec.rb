require 'rails_helper'

RSpec.describe 'CRU[D] categories', type: :feature do
  let!(:user) { create :user }
  let!(:category) { attributes_for :category }
  let(:category_existing) {create :category}

  before do
    sign_in(user)
    visit categories_path
  end

  it 'should be able to create a new category, read it, and update it' do
    click_link "Add Category"
    within "#newCategoryForm" do
      fill_in "category_name", with: category[:name]
      fill_in "category_details", with: category[:details]
      click_button 'Create Category'
    end
    expect(page).to have_content 'Created the'
    expect(page.current_path).to eq categories_path
    within "#categoriesProper" do
      expect(page).to have_content category[:name]
      click_link category[:name]
    end
    expect(page).to have_content category[:name]
    expect(page).to have_content category[:details]
    page.all('a')[1].click
    within "#newCategoryForm" do
      fill_in "category_name", with: category[:name] + "_"
      fill_in "category_details", with: category[:details] + "_"
      click_button 'Update Category'
    end
    expect(page).to have_content category[:name] + "_"
    expect(page).to have_content category[:details] + "_"
  end
end