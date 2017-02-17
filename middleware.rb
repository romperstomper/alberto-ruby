require 'sinatra'
require 'rubygems'
require 'rack'
require 'warden'
require 'json'

FAILURE_APP = lambda do |e|
  [401, { 'content_type' => 'plain/text' }, ['you failed']]
end
class User
  attr_accessor :username, :password
  def initialize(username, password)
    @username = usernamer
    @password = password
  end
end

module App
  class Main < Sinatra::Base
    get '/' do
      { data: 'hello' }.to_json
    end

    get '/secure/?' do
      env['warden'].authenticate!
      { data: 'secure content' }.to_json
    end
  end
end
builder = Rack::Builder.new do
  Warden::Strategies.add(:st1) do
    def valid?
      true
    end
    def authenticate!
      u = nil
      puts 'using strategy :st1'
      auth = Rack::Auth::Basic::Request.new(env)
      username, password = auth.credentials
      if username == 'gary'
        u = User.new(username, password)
      end
      u.nil? ? fail('not logged in') : success!(u)
    end
  end

  Warden::Strategies.add(:st2) do
    def valid?
      true
    end
    def authenticate!
      u = nil
      auth = Rack::Auth::Basic:Request.new(env)
      username, password = auth.credentials
      if username == 'user1'
        u = User.new(username, password)
      end
      u.nil? ? fail('not logged in') : success!(u)
    end
  end
  use Rack::MethodOverride
  use Warden::Manager do |config|
    config.scope_defaults :default,
      strategies: [:st1, :st2]
    config.failure_app = FAILURE_APP
  end


  map '/' do
    run App::Main
  end
end

Rack::Handler::WEBrick.run builder



