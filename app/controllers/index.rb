get '/' do
  erb :index
end

post '/' do
  @user = TwitterUser.find_or_create_by_username(params[:user])

  if @user.tweets.empty? && @user.tweets_stale?
    @user.fetch_tweets!
  end
  sleep(5)
  @tweets = @user.tweets.limit(10)
  erb :_tweets, layout: false
end

get '/new_tweet' do
  erb :new_tweet
end

post '/new_tweet' do
  tweet_content = params[:tweet_content]
  tweet = Twitter.update(tweet_content)
  tweet.class == Twitter::Tweet ? "Success!" : "Something went wrong..."
end
