require 'faraday'
 
# client = Faraday.new(url: 'http://localhost:3000') do |config|
#   config.adapter  Faraday.default_adapter
# end
 #Create User
# response = client.post do |req|
#   req.url '/api/v1/users'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "user": {"name": "test user"} }'
# end
#Create Delete, Update Post
client = Faraday.new(url: 'http://localhost:3000') do |config|
    config.adapter  Faraday.default_adapter
    config.token_auth('48ee40e6dbd1e7a2698e7b055ff4dcd7')
  end
#Create
#   response = client.post do |req|
#     req.url '/api/v1/posts'
#     req.headers['Content-Type'] = 'application/json'
#     req.body = '{ "post": {"title": "Title", "body": "Text"} }'
#   end
#Delete
# response = client.delete do |req|
#     req.url '/api/v1/posts/12'
#     req.headers['Content-Type'] = 'application/json'
#   end
#Update
#  response = client.patch do |req|
#      req.url '/api/v1/posts/13'
#      req.headers['Content-Type'] = 'application/json'
#      req.body = '{ "post": {"title": "Update", "body": "Text"} }'
#    end
require 'oj'
 
# client here...
 
puts Oj.load(response.body)
puts response.status