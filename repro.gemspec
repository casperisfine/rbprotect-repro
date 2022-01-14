# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "rbprotect-repro"
  spec.version       = "0.0.1"
  spec.authors       = ["Jean Boussier"]
  spec.email         = ["jean.boussier@gmail.com"]

  spec.summary       = %q{Repro}
  spec.description   = %q{Repro}
  spec.homepage      = "https://github.com/Shopify/dedup"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    Dir['{lib,ext}/**/*'].reject { |f| f =~ /\.(bundle|so|dll)/} +
      %w(LICENSE.txt README.md)
  end

  spec.extensions = ['ext/repro/extconf.rb']

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
