require 'rails_helper'

RSpec.describe 'CRUD tasks', type: :feature do
  let!(:user) { create :user }
  let!(:category) {create :category, user: user}
  let!(:task) { attributes_for :task }  

  before do
    sign_in(user)
    visit tasks_path
  end

  it 'should be able to create a new task, read it, update it, and delete it' do
    #Task Creation
    click_link("New Task", match: :first)
    within "form" do
      fill_in "task_name", with: task[:name]
      fill_in "task_details", with: task[:details]
      fill_in "task_deadline", with: task[:deadline]
      click_button 'Create Task'
    end
    expect(page).to have_content 'Created the'
    expect(page.current_path).to eq category_path(category)

    #Task Reading
    visit tasks_path
    within "#tasksProper" do
      expect(page).to have_content task[:name]
      click_link task[:name]
    end
    expect(page).to have_content task[:name]
    expect(page).to have_content task[:details]
    expect(page).to have_content task[:deadline]

    #Task Updating
    page.all('a')[2].click
    within "form" do
      fill_in "task_name", with: task[:name] + "_"
      fill_in "task_details", with: task[:details] + "_"
      click_button 'Update Task'
    end
    expect(page).to have_content task[:name] + "_"
    expect(page).to have_content task[:details] + "_"

    #Task Deletion
    visit tasks_path
    within "#tasksProper" do
      click_link task[:name]
    end
    page.all('a')[2].click
    find("#deleteConfirmAction", visible: false).click
    expect(page).to have_content "Deleted the #{task[:name]}_ task."
  end

  it 'should be able to toggle a task to finished/unfinished state' do
    click_link("New Task", match: :first)
    within "form" do
      fill_in "task_name", with: task[:name]
      fill_in "task_details", with: task[:details]
      fill_in "task_deadline", with: task[:deadline]
      click_button 'Create Task'
    end
    within "#categoriesShowProper" do
      click_link task[:name]
    end
    page.all('a')[2].click
    within "form" do
      find(:css, "#task_is_finished").set(true)
      click_button 'Update Task'
    end
    expect(page).to have_content "Finished"
    within "#categoriesShowProper" do
      click_link task[:name]
    end
    page.all('a')[2].click
    within "form" do
      find(:css, "#task_is_finished").set(false)
      click_button 'Update Task'
    end
    expect(page).to have_content "Unfinished"
  end

  it 'should not create a new task with insufficient details' do
    click_link("New Task", match: :first)
    within "#newCategoryForm" do
      click_button 'Create Task'
    end
  end

  it 'should not update a task with insufficient details' do
    click_link("New Task", match: :first)
    within "form" do
      fill_in "task_name", with: task[:name]
      fill_in "task_details", with: task[:details]
      fill_in "task_deadline", with: task[:deadline]
      click_button 'Create Task'
    end
    within "#categoriesShowProper" do
      click_link task[:name]
    end
    page.all('a')[2].click
    within "form" do
      fill_in "task_name", with: ""
      fill_in "task_details", with: ""
      fill_in "task_deadline", with: ""
      click_button 'Update Task'
    end
    expect(page).to have_content "Edit Task"
  end
end