
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "last_tweet/version"

Gem::Specification.new do |spec|
  spec.name          = "last_tweet"
  spec.version       = LastTweet::VERSION
  spec.authors       = ["'Randall Harris Haynes'"]
  spec.email         = ["'harrishaynes@gmail.com'"]

  spec.summary       = "Returns the most recent tweet from all specified Twitter handles."
  spec.homepage      = "https://github.com/rhhaynes/last-tweet-cli-app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["last_tweet"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "nokogiri"
end
