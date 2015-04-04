require 'spec_helper'

describe "Destroying todo lists" do
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }

  it "successfully destroys a todo list when clicking destroy link" do

    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(todo_list.title, todo_list.description)
    expect(TodoList.count).to eq(0)
  end
end
