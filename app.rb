require 'rubygems'
require 'sinatra'
require 'json'
require 'net/http'


url_list = [
  "http://www.crowdcompass.com",
  "http://www.crowdcompass.com/features",
  "http://www.crowdcompass.com/about.shtml",
  "http://www.crowdcompass.com/resources",
  "http://www.crowdcompass.com/clients.shtml",
  "http://www.crowdcompass.com/contact.shtml",
  "http://www.lsjkfdljsf33.org"
]

def url_check(my_url)
  begin
    res = Net::HTTP.get_response(URI.parse(my_url.to_s))
    res.code
  rescue Exception
    999
  end
end

url_list.each do |url|
  puts "#{url}, #{url_check(url)}"
end
# get the index page
get "/" do
  erb :index
end

get "/url_status" do
  # content_type :json
  results = []
  url_list.each do |url|
    results << {:url => url, :code => url_check(url)}
  end
  results.to_json
end
# # create a new something
# put '/something' do
#   render :form
# end

# # update a something
# post '/somethingelse' do
# end

# # delete a something
# delete '/somethingelse' do
# end