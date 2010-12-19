require 'rubygems'
require 'json'
require 'typhoeus'
require 'ostruct'

%w(commit repository user).each do |file|
  require File.expand_path("../models/#{file}.rb", __FILE__)
end

module GitHub
  class API
    BASE_URL = "https://github.com/api/v2/json"

    # Returns a JSON parsed response from the GitHub v2 API.
    def self.json(uri)
      response = Typhoeus::Request.get("#{BASE_URL}#{uri}")

      return JSON.parse(response.body)
    end
  end
end