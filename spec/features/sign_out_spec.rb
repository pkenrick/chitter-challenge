feature 'Sign out' do
  
  scenario 'user can sign out of account' do
    sign_up
    visit('/users/sign_in')
    fill_in :email, with: 'paul@email.com'
    fill_in :password, with: 'paul'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('You have been signed out.')
  end

end