Gem::Specification.new do |s|
  s.name              = "ruby-github"
  s.version           = "0.1.0"
  s.date              = "2010-12-18"
  s.summary           = "Simple Ruby library to access the GitHub API."
  s.email             = "john.postlethwait@gmail.com"
  s.homepage          = "http://github.com/JohnPostlethwait/ruby-github"
  s.description       = "Ruby-GitHub is a small library that provides simple access to GitHub's evolving API."
  s.has_rdoc          = true
  s.authors           = ["Michael Bleigh", 'John Postlethwait']
  s.files             = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "ruby-github.gemspec", "lib/ruby-github.rb"]
  s.rdoc_options      = ["--main", "README.txt"]
  s.extra_rdoc_files  = ["History.txt", "Manifest.txt", "README.txt"]

  s.add_dependency("mash", [">= 0.1.1"])
  s.add_dependency("json", [">= 1.4.6"])
end