module GitHub
  class Repository < OpenStruct
    # Searches public GitHub repositories using the passed in string as the
    # seach parameter.
    # 
    # Usage: GitHub::Repository.search 'tinder'
    def self.search(query)
      matches = GitHub::API.json("/repos/search/#{query}")['repositories']
      repositories = []

      matches.each do |repo|
        repositories << self.new(repo)
      end

      return repositories
    end

    # Finds a specific public repository for a specific username. You may 
    # optionally pass in an username and a token if you would like to
    # make calls to the API that are reserved to private/authenticated usage.
    # 
    # Usage:  GitHub::Repository.find 'JohnPostlethwait', 'ruby-github'
    def self.find(user, repository_name, args = {})
      repository = GitHub::API.json("/repos/show/#{user}/#{repository_name}", args)['repository']
      repository = repository.merge({ :api_options => args })

      return self.new(repository)
    end

    # Returns an array of GitHub::User objects representing each collaborator
    # on this repository.
    def collaborators
      raw_collaborators = GitHub::API.json("/repos/show/#{self.owner}/#{self.name}/collaborators")['collaborators']
      collaborators = []

      raw_collaborators.each do |collaborator|
        collaborators << GitHub::User.find(collaborator)
      end

      return collaborators
    end

    # Returns an array of GitHub::User objects representing the contributors
    # on this repository.
    def contributors
      raw_contributors = GitHub::API.json("/repos/show/#{self.owner}/#{self.name}/contributors")['contributors']
      contributors = []

      raw_contributors.each do |contributor|
        contributors << GitHub::User.find(contributor['login'])
      end

      return contributors
    end

    # Returns an array of GitHub::User objects representing the watchers on
    # this repository.
    def watchers
      raw_watchers = GitHub::API.json("/repos/show/#{self.owner}/#{self.name}/watchers")['watchers']
      watchers = []

      raw_watchers.each do |watcher|
        watchers << GitHub::User.find(watcher)
      end

      return watchers
    end

    # Returns a hash of the languages used on this repository. The return is a
    # key of the language name and a value of the total number of bytes it is
    # used from, as calculated by the GitHub API.
    def languages
      return GitHub::API.json("/repos/show/#{self.owner}/#{self.name}/languages")['languages']
    end

    # Returns a hash of tag names and their corresponding SHA.
    def tags
      return GitHub::API.json("/repos/show/#{self.owner}/#{self.name}/tag")['tags']
    end

    # Returns an array of commits for the repository. By default it will assume
    # the 'master' branch, but this can be overridden (passed in as an 
    # argument.)
    def commits(branch = 'master')
      raw_commits = GitHub::API.json("/commits/list/#{self.owner}/#{self.name}/#{branch}", self.api_options)["commits"]
      commits = []

      raw_commits.each do |c|
        commits << GitHub::Commit.new(c)
      end

      return commits
    end
  end
end
