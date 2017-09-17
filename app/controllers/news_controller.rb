class NewsController < ApplicationController
  def index
  	@results = Google::Search::News.new(query: "President Obama")
  end
end
