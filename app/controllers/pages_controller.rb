class PagesController < ApplicationController

  def home
    @users = User.all
    @crawls = Crawl.where(public: true)
  end
end
