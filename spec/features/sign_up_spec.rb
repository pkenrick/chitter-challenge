feature 'Sign up' do
  
  scenario 'user can sign up to Chitter' do
    expect {sign_up}.to change(User, :count)
    expect(page).to have_content('Thanks, Paul.  Your account has been registered!')
    expect(User.first.name).to eq('Paul')
  end

  scenario 'user can\'t sign up if password confirmation doesn\'t match' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content('There was a problem.  Please ensure you confirm your password correctly.')
  end

end