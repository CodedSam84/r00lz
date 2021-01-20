require_relative 'lib/r00lz/version'

Gem::Specification.new do |spec|
  spec.name          = "r00lz"
  spec.version       = R00lz::VERSION
  spec.authors       = ["samuel atobatele"]
  spec.email         = ["swumatob@yahoo.co.uk"]

  spec.summary       = %q{My Web Framework}
  spec.description   = %q{A web Framework, but with extra awesome.}
  spec.homepage      = "http://samatobatele.com/r00lz"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://samatobatele.com/r00lz"
  spec.metadata["changelog_uri"] = "http://samatobatele.com/r00lz"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "rack", "~> 2.0.7"
end
