class TodaysTweets::CLI

  def call
    welcome
    show_popular
    show_menu
    goodbye
  end

  def welcome
    puts
    puts "Please specify one or more Twitter handles to see their most recent tweet."
    puts "Sample format 1: @twitter_handle"
    puts "Sample format 2: @twitter_handle1, @twitter_handle2, etc."
    puts
  end

  def show_popular
    puts "If interested the 5 most popular accounts are listed below."
    twitter_accounts = TodaysTweets::TwitterAccount.most_popular
    twitter_accounts.each.with_index(1) do |account,i|
      puts "#{i}: #{account.name} - #{account.handle}"
    end
    puts
  end

  def show_menu
    twitter_handles = nil
    unless ['EXIT','Exit','exit'].include?(twitter_handles)
      puts "Whose tweets would you like to see?  Enter exit when finished."
      twitter_handles = gets.strip
      show_tweets(twitter_handles)
      # possible errors: invalid handles, private accounts, no tweets, etc.
    end
  end

  def show_tweets(twitter_handles)
    twitter_handles.collect do |handle|
      tweet = TodaysTweets::Tweet.create_from_handle(handle)
      puts
      puts "#{tweet.account.name} (#{tweet.account.handle}) at #{tweet.timestamp}"
      puts "#{tweet.account.bio}" unless tweet.bio == nil
      puts "#{tweet.message}"
    end
  end

  def goodbye
    puts
    puts "Goodbye!"
  end

end
