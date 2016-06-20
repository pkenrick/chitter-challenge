class Post

  include DataMapper::Resource

  # belongs_to :user
  # has 1, :user, through: Resource
  # has n, :users, through: Resource

  property :id, Serial
  property :text, String
  property :time, Time

end
