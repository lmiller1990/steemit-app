require 'radiator'

class StaticPagesController < ApplicationController
  def home
    @user = 'xenetics'
    api = Radiator::FollowApi.new
    api.get_followers(@user, 0, 'blog', 100) do |followers|
      @followers = followers.map(&:follower)
    end
  end
end
