feature 'Sign_in' do

  scenario 'user can sign in to their account' do
    sign_up
    visit('/users/sign_in')
    fill_in :email, with: 'paul@email.com'
    fill_in :password, with: 'paul'
    click_button 'Sign in'
    expect(page).to have_content('Welcome, Paul!')
  end

  scenario 'user can not sign in if email address not registered' do
    sign_up
    visit('/users/sign_in')
    fill_in :email, with: 'john@email.com'
    fill_in :password, with: 'paul'
    click_button 'Sign in'
    expect(page).to have_content('Sorry, we were not able to log you in.  Please check your email and try again.')
  end

end