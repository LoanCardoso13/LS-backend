require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

# GET index
# GET chapters/:chp_id
# GET search
def in_paragraphs(raw_text)
  raw_text.split("\n\n").map.with_index { |par, idx| "<p id='#{idx + 1}'>#{par}</p>" }.join
end

def find_term(searched_word)
  @chp_titles.each_with_index do |title, chp_idx|
    File.readlines("data/chp#{chp_idx + 1}.txt").each_with_index do |paragraph_content, par_idx|
      
    end
  end
end

before do
  @chp_titles = File.read('data/toc.txt').split("\n")
end

get "/" do
  erb :index
end

get "/chapters/:chp_id" do
  @chp_ref = params[:chp_id].to_i
  @content = in_paragraphs File.read("data/chp#{@chp_ref}.txt")
  erb :chapter
end

get "/search" do
  @results = []
  @searched_word = params[:query]
  if @searched_word
    @chp_titles.each_with_index do |title, idx|
      @results << title if File.read("data/chp#{idx + 1}.txt").include? @searched_word
    end
  end
  erb :search
end
