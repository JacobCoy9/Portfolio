require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
    @title = "Jacob Missall's Portfolio"
    @description = "This site showcases all of the awesome things that Jacob Missall has done."
    @home = "active"
    erb :home
end

get "/about" do
    @title = "About Me"
    @description = "This page provides a short bio for Jacob Missall."
    @about = "active"
    erb :about
end

get "/works" do
    @title = "My Clips"
    @description = "This page provides links to Jacob Missall's published clips."
    @works = "active"
    erb :work
end

get "/tweets" do
    require 'twitter'
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "L6CuwfoYuIPmVYnWwraHFURKv"
            config.consumer_secret     = "Wx38ibl4Gt12fNYNc9gQqP9utrYzEvJ24nXi7StP8xpci1F8XC"
            config.access_token        = "2882668377-aOQpHCsm11sRNT7jlcSB4flCoHxHxZxUK07DTPo"
            config.access_token_secret = "4VFplJyXgrcRWrZ05b0ILQ5H8drErsQerbQexoU0NYYZ5"
        end
    
        client.search("to:@merceryou", result_type: "recent").take(3).collect do |tweet|
            #"#{tweet.user.screen_name}: #{tweet.text}"
            tweet
        end
    
    @title = "My ______ Tweets"
    @description = "Here are all the tweets I've made about ______."
    @tweets = "active"
    erb :tweets
end