feature 'See posts' do
  
  scenario 'user can view posts on webpage' do
    sign_up
    sign_in
    visit('/posts/new')
    fill_in :text, with: 'I am now adding a new post!'
    click_button 'Post'
    expect(page).to have_content('I am now adding a new post!')
  end

end