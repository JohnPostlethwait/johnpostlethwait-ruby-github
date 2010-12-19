module GitHub
  class Commit < OpenStruct
    # Finds a specific commit via the username, repository, and SHA.
    def self.find(user, repository, sha)
      commit = GitHub::API.json("/commits/show/#{user}/#{repository}/#{sha}")['commit']

      return self.new(commit)
    end

    # Returns an array of GitHub::Commit objects representing all of the 
    # commits for the specified file path. Optionally you may pass in a branch
    # as the fourth argument.
    #
    # Example Usage: GitHub::Commit.for_file 'johnpostlethwait', 'ruby-github', '/lib/ruby-github.rb', 'master'
    def self.for_file(user, repository, file_path, branch = 'master')
      raw_commits = GitHub::API.json("/commits/list/#{user}/#{repository}/#{branch}#{file_path}")['commits']
      commits = []

      unless raw_commits.nil?
        raw_commits.each do |commit|
          commits << self.new(commit)
        end
      end

      return commits
    end
  end
end
