require 'rails_helper'

RSpec.feature "Tweets", type: :feature do
  let(:user) { create(:user) }

  scenario 'user not sign in' do
    visit '/'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "signed in user create a new tweet" do  
    sign_in user

    visit root_path

    fill_in 'tweet[content]', with: Faker::Lorem.sentence(word_count: 10)

    expect { click_on '推文' }.to change { Tweet.count }.by(1)
    expect(current_path).to eq(root_path)
  end

  scenario "signed in user can see recommend user" do 
    sign_in user 

    visit root_path

    expect(page).to have_selector('.recommend_user', count: 0)

    create(:user)

    visit root_path

    expect(page).to have_selector('.recommend_user', count: 1)
  end
end
