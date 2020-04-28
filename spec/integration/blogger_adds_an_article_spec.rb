require 'rails_helper.rb'

feature"Blogger adds an article" do
    scenario "Blogger successfully creates account" do
        visit new_user_path
        fill_in "Name", with: "davidhot"
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
        expect(page).to have_content("davidhot")
       end 
    
    scenario "Blogger successfully logs in" do
     visit new_user_path
        fill_in "Name", with: "DavidHot"
        fill_in "Email", with: "DavidHot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        visit login_path
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        click_button "Login"
        expect(page).to have_content("Hello, Blog App User");
    end   
    
    scenario "Blogger successfully logs out" do
     visit new_user_path
        fill_in "Name", with: "DavidHot"
        fill_in "Email", with: "DavidHot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        visit login_path
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        click_button "Login"
        click_link "Log Out"
        expect(page).to have_content("Hello, Blog App User");
    end
    
    scenario "Blogger successfully navigates to blog page" do
     visit new_user_path
        fill_in "Name", with: "DavidHot"
        fill_in "Email", with: "DavidHot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        visit login_path
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        click_button "Login"
        click_link "My Blog"
        expect(page).to have_content("Listing articles")
    end
    
     scenario "Blogger successfully creates a new article" do
        visit new_user_path
        fill_in "Name", with: "davidhot"
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
    
     scenario "Blogger successfully deletes article" do
        visit new_user_path
        fill_in "Name", with: "davidhot"
        fill_in "Email", with: "davidhot@test.com"
        fill_in "Password", with: "Password123!"
        fill_in "Password confirmation", with: "Password123!"
        click_button "Create User"
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        click_link "Article List"
        click_link "Destroy"
    end
    
end