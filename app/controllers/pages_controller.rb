class PagesController < ApplicationController

  def home
    @users = User.all
    @crawls = Crawl.recently_added(3)
  end
end
