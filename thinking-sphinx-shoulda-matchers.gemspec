# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "thinking-sphinx-shoulda-matchers/version"

Gem::Specification.new do |s|
  s.name        = "thinking-sphinx-shoulda-matchers"
  s.version     = Thinking::Sphinx::Shoulda::Matchers::VERSION
  s.authors     = ["Alejandro Andres"]
  s.email       = ["fuzzy.alej@gmail.com"]
  s.homepage    = "http://alejandroandres.com/"
  s.summary     = %q{Shoulda matchers for Thinking Sphinx}
  s.description = %q{Shoulda matchers for Thinking Sphinx}

  s.rubyforge_project = "thinking-sphinx-shoulda-matchers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "shoulda"
  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "shoulda"
end
