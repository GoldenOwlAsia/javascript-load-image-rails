require "thor"
require "json"
require "httpclient"

class SourceFile < Thor
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  def fetch
    filtered_tags = fetch_tags
    tag = select("Which tag do you want to fetch?", filtered_tags)
    self.destination_root = "app/assets"
    remote = "https://github.com/blueimp/JavaScript-Load-Image"
    get "#{remote}/raw/#{tag}/js/load-image.all.min.js", "javascripts/load-image.all.min.js"
    get "#{remote}/raw/#{tag}/js/load-image.js", "javascripts/load-image.js"
    get "#{remote}/raw/#{tag}/js/load-image-scale.js", "javascripts/load-image-scale.js"
    get "#{remote}/raw/#{tag}/js/load-image-meta.js", "javascripts/load-image-meta.js"
    get "#{remote}/raw/#{tag}/js/load-image-fetch.js", "javascripts/load-image-fetch.js"
    get "#{remote}/raw/#{tag}/js/load-image-exif.js", "javascripts/load-image-exif.js"
    get "#{remote}/raw/#{tag}/js/load-image-exif-map.js", "javascripts/load-image-exif-map.js"
    get "#{remote}/raw/#{tag}/js/load-image-orientation.js", "javascripts/load-image-orientation.js"
  end

  private

  def fetch_tags
    http = HTTPClient.new
    response = JSON.parse(http.get("https://api.github.com/repos/blueimp/JavaScript-Load-Image/tags").body)
    response.map{|tag| tag["name"]}.sort
  end

  def select msg, elements
    elements.each_with_index do |element, index|
      say(block_given? ? yield(element, index + 1) : ("#{index + 1}. #{element.to_s}"))
    end
    result = ask(msg).to_i
    elements[result - 1]
  end
end
