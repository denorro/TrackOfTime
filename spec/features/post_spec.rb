require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: 'denorrostallworth@gmail.com', password: 'abcd1234', password_confirmation: 'abcd1234', firstName: 'Denorro', lastName: 'Stallworth')
      login_as(user, scope: :user)
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from form page' do
      fill_in 'post[date]', with: DateTime.now
      fill_in 'post[rationale]', with: 'Rationale Test'
      click_button 'Submit'
      expect(page).to have_content('Rationale Test')
    end

    it 'will have an User associated' do
      fill_in 'post[date]', with: DateTime.now
      fill_in 'post[rationale]', with: 'hey now brown cow'
      click_button 'Submit'
      expect(User.last.posts.last.rationale).to eq('hey now brown cow')
    end
  end
end