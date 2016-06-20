require 'bcrypt'

class User

  include DataMapper::Resource

  # has n, :posts, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, String, length: 60

  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email:, password:)
    potential_user = User.first(email: email)
    potential_user && BCrypt::Password.new(potential_user.password_digest) ? potential_user : nil
  end

end

