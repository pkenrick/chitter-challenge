  
def sign_up(name: 'Paul', email: 'paul@email.com', password: 'paul', password_confirmation: 'paul', username: 'paul77')
  visit('/users/sign_up')
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :username, with: username
  click_button 'Submit'
end

def sign_in
  visit('/users/sign_in')
  fill_in :email, with: 'paul@email.com'
  fill_in :password, with: 'paul'
  click_button 'Sign in'
end