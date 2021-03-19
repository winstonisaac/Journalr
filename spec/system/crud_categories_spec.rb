require 'rails_helper'

RSpec.describe 'CRUD categories', type: :feature do
  let!(:user) { create :user }
  let!(:category) { attributes_for :category }

  before do
    sign_in(user)
    visit categories_path
  end

  it 'should be able to create a new category, read it, update it, and delete it' do
    #Category Creation
    click_link "Add Category"
    within "#newCategoryForm" do
      fill_in "category_name", with: category[:name]
      fill_in "category_details", with: category[:details]
      click_button 'Create Category'
    end
    expect(page).to have_content 'Created the'
    expect(page.current_path).to eq categories_path

    #Category Reading
    within "#categoriesProper" do
      expect(page).to have_content category[:name]
      click_link category[:name]
    end
    expect(page).to have_content category[:name]
    expect(page).to have_content category[:details]

    #Category Updating
    page.all('a')[2].click
    within "#newCategoryForm" do
      fill_in "category_name", with: category[:name] + "_"
      fill_in "category_details", with: category[:details] + "_"
      click_button 'Update Category'
    end
    expect(page).to have_content category[:name] + "_"
    expect(page).to have_content category[:details] + "_"

    #Category Deletion
    page.all('a')[2].click
    find("#deleteConfirmAction", visible: false).click
    expect(page).to have_content "Deleted the #{category[:name]}_ category."
  end

  it 'should not create a new category with insufficient details' do
    click_link "Add Category"
    within "#newCategoryForm" do
      click_button 'Create Category'
    end
    expect(page).to have_no_content "Created the"
  end

  it 'should not update a category with insufficient details' do
    click_link "Add Category"
    within "#newCategoryForm" do
      fill_in "category_name", with: category[:name]
      fill_in "category_details", with: category[:details]
      click_button 'Create Category'
    end
    within "#categoriesProper" do
      click_link category[:name]
    end
    page.all('a')[2].click
    within "#newCategoryForm" do
      fill_in "category_name", with: ""
      fill_in "category_details", with: ""
      click_button 'Update Category'
    end
    expect(page).to have_content "Edit Category"

  end
end