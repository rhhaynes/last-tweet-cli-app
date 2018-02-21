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
    @twitter_accounts = LastTweet::TwitterAccount.most_popular
    @twitter_accounts.each.with_index(1) do |account,i|
      puts "#{i}: #{account.name} - #{account.handle}".colorize(:blue)
    end
    puts
  end

  def show_menu
    puts "Whose tweet(s) would you like to see?  Enter exit when finished."
    @user_input = 'not_exit'
    until @user_input.downcase == 'exit'
      @user_input = gets.strip
      unless @user_input.downcase == 'exit'
        show_tweets
        puts "Whose tweet(s) would you like to see next?  Enter exit when finished."
      end
    end
  end

  def show_tweets
    twitter_handles = @user_input.gsub(",", " ").split
    twitter_handles.collect do |handle|
      handle = @twitter_accounts[handle.to_i-1].handle if (1..5).include? handle.to_i
      tweet  = LastTweet::Tweet.create_from_handle(handle)
      if tweet.message == nil
        puts "Last tweet by #{tweet.account.handle} could not be found.  If correct, the account may be private or suspended.".colorize(:red)
        tweet.remove
      else
        puts "#{tweet.account.handle} at #{tweet.timestamp}".colorize(:blue)
        tweet.account.bio.empty? ? puts("#{tweet.account.name}".colorize(:blue)) : puts("#{tweet.account.name}: #{tweet.account.bio}".colorize(:blue))
        puts "#{tweet.message}".colorize(:green)
      end
      puts
    end
  end

  def goodbye
    puts "Goodbye!".colorize(:blue)
    puts
  end

end
