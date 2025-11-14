require 'rails_helper'

RSpec.describe "Home page", type: :system do
  before do
    driven_by(:headless_chrome)
  end

  it "displays the application information" do
    visit root_path

    expect(page).to have_content(Rails.application.class.module_parent.name)
    expect(page).to have_content("Modern Rails 8 Application Template")
    expect(page).to have_content("Application Info")
    expect(page).to have_content("Getting Started")
  end

  it "shows version information" do
    visit root_path

    expect(page).to have_content("Version:")
    expect(page).to have_content(APP_VERSION)
  end

  it "displays quick action links" do
    visit root_path

    expect(page).to have_link("Version API", href: version_path)
    expect(page).to have_link("Template Docs")
    expect(page).to have_link("Rails Guides")
  end
end
