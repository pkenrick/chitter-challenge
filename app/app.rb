ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative './models/post'
require_relative './models/user'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get('/posts') do
    @posts = Post.all.sort_by{|post| post.time}.reverse
    erb(:'posts/posts')
  end

  get('/posts/new') do
    erb(:'posts/new')
  end

  post('/posts/new') do
    Post.create(text: params[:text], time: Time.new)
    redirect('/posts')
  end

  get('/users/sign_up') do
    erb(:'users/sign_up')
  end

  post('/users/sign_up') do
    @user = User.new(name: params[:name], 
              email: params[:email], 
              password: params[:password], 
              password_confirmation: params[:password_confirmation],
              username: params[:username])
    if @user.save
      flash.keep[:message] = "Thanks, #{params[:name]}.  Your account has been registered!"
      redirect('/posts')
    else
      flash[:message] = "There was a problem.  Please ensure you confirm your password correctly."
      redirect('/users/sign_up')
    end
  end

  get('/users/sign_in') do
    erb(:'/users/sign_in')
  end

  post('/users/sign_in') do
    if @current_user = User.authenticate(email: params[:email], password: params[:password]) 
      session[:current_user] = @current_user
      redirect('/posts')
    else
      flash.keep[:message] = "Sorry, we were not able to log you in.  Please check your email and try again."
      redirect('/users/sign_in')
    end
  end

  post('/users/sign_out') do
    session[:current_user] = nil
    flash.keep[:message] = "You have been signed out."
  end


  run! if app_file == $0

end