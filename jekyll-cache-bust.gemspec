# frozen_string_literal: true

require_relative "lib/jekyll-cache-bust/version"

Gem::Specification.new do |s|
  s.name        = "jekyll-cache-bust"
  s.summary     = "Force updating cached files and resources in a Jekyll site."
  s.description = "Force updating cached files and resources in a Jekyll site by adding a hash."
  s.version     = Jekyll::CacheBust::VERSION
  s.authors     = ["George Corrêa de Araújo"]
  s.homepage    = "https://george-gca.github.io/jekyll-cache-bust/"
  s.licenses    = ["MIT"]

  # https://guides.rubygems.org/specification-reference/#metadata
  s.metadata      = {
    "source_code_uri" => "https://github.com/george-gca/jekyll-cache-bust",
    "bug_tracker_uri" => "https://github.com/george-gca/jekyll-cache-bust/issues",
    "changelog_uri"   => "https://github.com/george-gca/jekyll-cache-bust/releases",
    "homepage_uri"    => s.homepage,
  }

  all_files     = `git ls-files -z`.split("\x0")
  s.files       = all_files.grep(%r!^(lib)/!)

  s.required_ruby_version = ">= 2.3.0"

  s.add_dependency "jekyll", ">= 3.6", "< 5.0"
end
