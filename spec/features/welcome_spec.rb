require 'spec_helper'
#  _______  _______  _______  __   __  _     _  __   __  _______  ______
# |       ||   _   ||       ||  | |  || | _ | ||  | |  ||   _   ||      |
# |       ||  |_|  ||    _  ||  |_|  || || || ||  |_|  ||  |_|  ||___   |
# |       ||       ||   |_| ||       ||       ||       ||       |  __|  |
# |      _||       ||    ___||_     _||       ||       ||       | |_____|
# |     |_ |   _   ||   |      |   |  |   _   ||   _   ||   _   |   __
# |_______||__| |__||___|      |___|  |__| |__||__| |__||__| |__|  |__|
# http://jnicklas.github.io/capybara/
# (\~---.
#  /   (\-`-/)
# (      ' ' )          # https://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf
#  \ (  \_Y_/\          # https://gist.github.com/zhengjia/428105
#   ""\ \___//
#      `w   "
describe "The Quiz" do

  it "has a link to take us to the Sorting Quiz" do
    visit '/'
    click_link "sorting quiz"
    expect(page).to have_content "Sorting Quiz"
    expect(current_path).to eq('/quiz')
  end

  it "has a text input where we can enter a string of numbers" do
    visit '/quiz'
    within("#quiz") { fill_in 'numbers', with: "-1, 4, 2, 8, 1, 20" }
    expect(page).to have_content "-1, 4, 2, 8, 1, 20"
  end

  describe "when i click the 'sort' button" do
    before(:each) do
      visit '/quiz'
      within("#quiz") { fill_in 'numbers', with: "-1, 4, 2, 8, 1, 20" }
      click_button "sort"
    end

    it "removes the input" do
      expect(page.has_no_field? 'numbers').to be true
      expect(page.has_no_button? 'sort').to be true
    end

    it "displays the numbers in ascending order" do
      expect(page).to have_content "-1, 1, 2, 4, 8, 20"
    end

  end

end