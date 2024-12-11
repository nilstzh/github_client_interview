# frozen_string_literal: true

require 'httparty'

module Github
  class Client
    # this class is responsible for making requests to the Github API
    # It accepts a personal access token and stores it as an instance variable.
    # It has a method called `get` that accepts a URL and returns the response
    # from the Github API

    def initialize(token, repo_url)
      # implement this method
      @token = token
      @repo_url = repo_url
    end

    def get(url, query = {})
      # this method generates the required headers that use the bearer token
      # and makes a GET request to the Github API using the provided URL.
      # It returns the response from the Github API
      # It appends the path in the url argument to the repo_url instance variable
      # to form the full URL
      HTTParty.get("#{@repo_url}#{url}", query:, headers:)
    end

    private

    def headers
      # this method returns the headers required to make requests to the Github API using a personal access token
      {
        'Authorization' => "Bearer #{@token}",
        'User-Agent' => 'Github Client'
      }
    end
  end
end
