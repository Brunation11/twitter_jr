class StaticPagesController < ApplicationController
  def landing_page
  end

  def feed
    redirect_to tweets_path
  end
end