require 'json'
require 'rubygems'
require 'sinatra'
require 'net/http'
require 'uri'
require 'twitter'
require 'koala'
require 'foursquare2'
require 'instagram'

configure do
  Twitter.configure do |config|
    config.consumer_key = 'PTBR9uMBWM0uvGT2AlnUYg'
    config.consumer_secret = 'MUpDJi0hKf2rzRuygB3UyX0Hsa3mXOPKT3KI7xaMEBA'
    config.oauth_token = '9634382-LdymD37331KJvfBuSCnZQISmsQWUx9UhJs4M4Va66c'
    config.oauth_token_secret = 'W26rcMSDPCVXdhqytu6GA9yhnF83lXMR1UtEz7skpjM'
  end

  Instagram.configure do |config|
    config.client_id = '4fef368d8a3d4286b2f81f8494069d7c'
    config.client_secret = 'ce624143d41d4ddd9af04a6a504bbc9d'
  end
end

class Application < Sinatra::Base
  get '/' do
    'CoffeeMaker is a lightweight service which returns sample data in JSON from Twitter, Facebook, Foursquare and Instagram'
  end

  get '/twitter.json' do
    content_type :json

    Twitter.search(params[:q]).results.map(&:to_hash).to_json
  end

  get '/facebook.json' do
    content_type :json

    graph = Koala::Facebook::API.new

    if params[:q]
      graph.search(params[:q], :type => (params[:type] || 'page')).to_json
    elsif params[:id]
      graph.get_object(params[:id]).to_json
    end
  end

  get '/foursquare.json' do
    content_type :json

    foursquare = Foursquare2::Client.new(:client_id => 'M5YZDFNSYT5J1ZOI5QCPZWNIPU4L15O5YNRX2CF2MNZEKTTU', :client_secret => '52ZRKKZKJ2EJM1BQECTJZLNDPOCFYEE55TYI0FA3ZFZXAP0J')

    foursquare.search_venues(params[:q]).to_json
  end

  get '/instagram.json' do
    content_type :json

    if params[:lat] && params[:lng]
      Instagram.media_search(params[:lat], params[:lng]).to_json
    elsif params[:q]
      Instagram.tag_recent_media(params[:q]).to_json
    else
      Instagram.media_popular.to_json
    end
  end
end
