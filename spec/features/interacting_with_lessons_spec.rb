require 'rails_helper'

describe "user interacts with lessons" do
  it "adds a new lesson" do
    visit('/')
    create_a_new_lesson
    expects_a_page_to_have_content('Test Lesson Title')

    click_link 'Test Lesson Title'
    click_link 'Code Now'
    expects_a_page_to_have_content('Lessons')
  end

  it "edits a lesson" do
    visit('/')
    create_a_new_lesson
    click_link 'Test Lesson Title'
    expects_a_page_to_have_content('Test Lesson Content')

    click_link 'Edit'
    fill_in_forms('New Lesson Title', 'New Lesson Content')
    click_on 'Update Lesson'
    expects_a_page_to_have_content('New Lesson Title')
    expects_a_page_to_have_content('New Lesson Content')
  end

  it "destroys a lesson" do
    visit('/')
    create_a_new_lesson
    click_link 'Test Lesson Title'
    click_link "Delete"
    expect(page).to_not have_content('Test Lesson Title')
  end
end

  def create_a_new_lesson
    click_link("Create a New Lesson")
    expects_a_page_to_have_content("Title")
    fill_in_forms('Test Lesson Title', 'Test Lesson Content')
    click_on "Create Lesson"
  end


  def fill_in_forms(title, content)
    fill_in('Title', :with => title)
    fill_in('Content', :with => content)
  end

  def expects_a_page_to_have_content(content)
    expect(page).to have_content(content)
  end
