module GitHub
  class Organization < OpenStruct
    # Returns a GitHub::Organization object representing the organization with
    # this name.
    def self.find(organization_name, options = {})
      organization = GitHub::API.json("/organizations/#{organization_name}")['organization']
      organization = organization.merge(options)

      return self.new(organization)
    end

    # Returns an array of GitHub::Repository objects representing the public 
    # repositories for this organization.
    def public_repositories
      raw_repos = GitHub::API.json("/organizations/#{self.login}/public_repositories")['repositories']
      repos = []

      raw_repos.each do |repo|
        repos << GitHub::Repository.new(repo)
      end

      return repos
    end

    # Returns an array of GitHub::User objects representing the public 
    # users for this organization.
    def public_users
      raw_users = GitHub::API.json("/organizations/#{self.login}/public_members")['users']
      users = []

      raw_users.each do |user|
        users << GitHub::User.new(user)
      end

      return users
    end
  end
end
