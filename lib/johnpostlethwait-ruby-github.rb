require 'rubygems'
require 'json'
require 'typhoeus'
require 'ostruct'

%w(commit repository user organization).each do |file|
  require File.expand_path(File.join('..', 'models', "#{file}.rb"), __FILE__)
end

module GitHub
  class API
    BASE_URL = "https://github.com/api/v2/json"

    class AuthenticationError < StandardError; end

    # Returns a JSON parsed response from the GitHub v2 API. You may optionally
    # pass a :token and a :username as the last parameter to make authenticated
    # requests.
    def self.json(uri, options = {})
      if options[:username] && options[:token]
        response = Typhoeus::Request.get("#{BASE_URL}#{uri}?login=#{options[:username]}&token=#{options[:token]}")
      else
        response = Typhoeus::Request.get("#{BASE_URL}#{uri}")
      end

      return JSON.parse(response.body)
    end
  end
end