require 'rails_helper'

RSpec.feature "User successful login", type: :feature, js:true do
  before :each do
    User.create!(first_name:'Justin', last_name:'Le', email:'justin@justin.com', password:'123456', password_confirmation:'123456')
  end

  scenario "User can log in successfully" do
    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'justin@justin.com'
    fill_in 'Password', with: '123456'
    click_button 'Login'
    expect(page.has_content?('Logout')).to be(true)
    save_screenshot
  end


end
