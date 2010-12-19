Gem::Specification.new do |s|
  s.name              = "ruby-github"
  s.version           = "0.2.0"
  s.date              = "2010-12-18"
  s.summary           = "Simple Ruby library to access the GitHub API."
  s.email             = "john.postlethwait@gmail.com"
  s.homepage          = "http://github.com/JohnPostlethwait/ruby-github"
  s.description       = "Ruby-GitHub is a small library that provides simple access to GitHub's evolving API."
  s.has_rdoc          = true
  s.authors           = ["Michael Bleigh", 'John Postlethwait']
  s.files             = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "ruby-github.gemspec", "lib/ruby-github.rb"]
  s.rdoc_options      = ["--main", "README.rdoc"]
  s.extra_rdoc_files  = ["History.txt", "Manifest.txt", "README.rdoc"]

  s.add_dependency "hashie",    [">= 0.4.0"]
  s.add_dependency "json",      [">= 1.4.6"]
  s.add_dependency "typhoeus",  [">= 0.2.0"]
end