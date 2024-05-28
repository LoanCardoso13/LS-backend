require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

def in_paragraphs(raw_text)
  raw_text.split("\n\n").map.with_index { |par, idx| "<p id='#{idx + 1}'>#{par}</p>" }.join
end

def find_term(searched_word)
  result = {}
  @chp_titles.each_with_index do |title, chp_idx|
    result[title] = {}
    File.read("data/chp#{chp_idx + 1}.txt").split("\n\n").each_with_index do |par_content, par_idx|
      if par_content.include? searched_word
        par_content.gsub!(searched_word, "<b>#{searched_word}</b>")
        result[title][par_idx + 1] = par_content
      end
    end
  end
  result
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
  @searched_word = params[:query]
  if @searched_word
    @results = find_term @searched_word
  end
  erb :search
end
