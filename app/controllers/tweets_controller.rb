class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect :index
    else
      render :new
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect :index
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end