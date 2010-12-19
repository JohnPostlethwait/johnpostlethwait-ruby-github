module GitHub
  class User < OpenStruct
    # Fetches information about the specified GitHub username.
    def self.find(username)
      user = GitHub::API.json("/user/show/#{username}")["user"]

      return self.new(user)
    end

    # Returns an array of GitHub::User objects representing the results of the
    # search.
    def self.search(username)
      raw_users = GitHub::API.json("/user/search/#{username}")["users"]
      users = []

      raw_users.each do |user|
        users << self.new(user)
      end

      return users
    end

    # Returns an array of GitHub::Repository objects for this user.
    def repositories
      raw_repositories = GitHub::API.json("/repos/show/#{self.login}")['repositories']
      repositories = []

      raw_repositories.each do |repository|
        repositories << GitHub::Repository.new(repository)
      end

      return repositories
    end
  end
end
