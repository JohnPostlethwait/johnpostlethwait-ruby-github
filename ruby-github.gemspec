Gem::Specification.new do |spec|
  spec.name             = "johnpostlethwait-ruby-github"
  spec.version          = "0.2.3"
  spec.date             = "2010-12-18"
  spec.summary          = "Simple Ruby library to access the GitHub v2 API."
  spec.email            = "john.postlethwait@gmail.com"
  spec.homepage         = "http://github.com/JohnPostlethwait/johnpostlethwait-ruby-github"
  spec.description      = "Ruby-GitHub is a small library that provides simple access to GitHub's evolving API."
  spec.authors          = ["Michael Bleigh", 'John Postlethwait']
  spec.license          = ['MIT']

  spec.files            = ['README.rdoc', 'Rakefile', 'init.rb', "lib/johnpostlethwait-ruby-github.rb", 'lib/models/commit.rb', 'lib/models/organization.rb', 'lib/models/repository.rb', 'lib/models/user.rb']

  spec.has_rdoc         = true
  spec.extra_rdoc_files = ["README.rdoc"]
  spec.rdoc_options     = ["--main", "README.rdoc"]
  
  spec.add_dependency "json",      [">= 1.4.6"]
  spec.add_dependency "typhoeus",  [">= 0.2.0"]
end