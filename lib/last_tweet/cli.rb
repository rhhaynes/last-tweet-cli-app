class LastTweet::CLI

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
    twitter_accounts = LastTweet::TwitterAccount.most_popular
    twitter_accounts.each.with_index(1) do |account,i|
      puts "#{i}: #{account.name} - #{account.handle}"
    end
    puts
  end

  def show_menu
    puts "Whose tweets would you like to see?  Enter exit when finished."
    twitter_handles = 'not_exit'
    until twitter_handles.downcase == 'exit'
      twitter_handles = gets.strip
      unless twitter_handles.downcase == 'exit'
        show_tweets(twitter_handles)
        puts
        puts "Would you like to see any additional tweets?  Enter exit when finished."
      end
      # possible errors: invalid handles, private accounts, no tweets, etc.
    end
  end

  def show_tweets(twitter_handles)
    twitter_handles = twitter_handles.gsub(",", " ").split
    twitter_handles.collect do |handle|
      tweet = LastTweet::Tweet.create_from_handle(handle)
      puts
      puts "#{tweet.account.handle} at #{tweet.timestamp}"
      tweet.account.bio.empty? ? puts("#{tweet.account.name}") : puts("#{tweet.account.name}: #{tweet.account.bio}")
      puts "#{tweet.message}"
    end
  end

  def goodbye
    puts
    puts "Goodbye!"
    puts
  end

end
