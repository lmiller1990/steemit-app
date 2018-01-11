require 'radiator'
require 'pp'
require 'time'

class PostsController < ApplicationController
  helper_method :seconds_to_units

  def index
    follower_api = Radiator::FollowApi.new
    api = Radiator::Api.new

    @total_seconds = 168 * 60 * 60

    @username = params[:username]
    @followers = params[:followers].split(',')

    # follower_api.get_followers(@username, 0, 'blog', 100) do |followers|
    #   @followers = followers.map(&:follower)
    # end

    @follower_posts = []
    @followers.each do |follower|
      @follower_posts << { 
        name: follower,
        posts: api.get_discussions_by_blog({ limit: 10, tag: follower })
      }
    end

    @discussions = api.get_discussions_by_blog({ 
      limit: 10, tag: 'xenetics' 
    })
  end

  def seconds_to_units(seconds)
    '%d days, %d hours, %d minutes, %d seconds' %
      # the .reverse lets us put the larger units first for readability
      [24,60,60].reverse.inject([seconds]) {|result, unitsize|
      result[0,0] = result.shift.divmod(unitsize)
      result
    }
  end
end
