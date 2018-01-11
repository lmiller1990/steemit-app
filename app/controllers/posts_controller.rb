require 'pp'
require 'radiator'

class PostsController < ApplicationController
  def index
    api = Radiator::Api.new
    @username = params[:username]
    @discussions = api.get_discussions_by_blog({ 
      limit: 10, tag: 'xenetics' 
    })
  end
end
