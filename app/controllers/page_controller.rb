require 'rss'
require 'open-uri'
require 'feedzirra'
class PageController < ApplicationController

def index
end

def show
	@feeds = read_feed_zirra params[:feed_id]
end


private
	def read_feed_zirra(feed_id)
		@feeds_hash = {"1"=>"http://news.ycombinator.com/bigrss", "2"=>"http://news.google.com/news?q=apple&output=rss&num=50",
						"3"=>"http://www.wired.com/autopia/feed/", "4"=>"http://news.yahoo.com/rss/"}
		feed = Feedzirra::Feed.fetch_and_parse(@feeds_hash[feed_id])
		feed.entries
	end
end

