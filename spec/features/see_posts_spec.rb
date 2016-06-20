feature 'See posts' do
  
  scenario 'user can view posts on webpage' do
    Post.create(text: 'This is my first post on Chitter.', time: Time.new)
    visit('/posts')
    expect(page).to have_content('This is my first post on Chitter.')
  end

end