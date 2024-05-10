# rubocop:disable all
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines('data/toc.txt')
end

helpers do
  def in_paragraphs(chp)
    chp.split("\n\n").map.with_index { |par, idx| "<p id=#{idx}>#{par}</p>" }.join
  end

  def highlight_result(paragraph, searched)
    paragraph.gsub(searched,"<strong>#{searched}</strong>")
  end
end

not_found do
  redirect "/"
end

get "/" do
  @title = 'The Adventures of Sherlock Holmes'

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chp_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chp_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |name, idx|
    number = idx + 1
    paragraphs_arr = File.read("data/chp#{number}.txt").split("\n\n")
    yield name, number, paragraphs_arr
  end
end

def chapter_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |name, number, paragraphs_arr|
    matches = []
    paragraphs_arr.each_with_index do |paragraph, idx|
      matches << {content: paragraph, location: idx} if paragraph.include?(query)
    end
    results << {name:name, number:number, page:matches} unless matches.empty?
  end

  results
end

get "/search" do
  @results = chapter_matching(params[:query])
  erb :search
end
