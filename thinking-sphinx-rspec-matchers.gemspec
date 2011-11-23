# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "thinking-sphinx-rspec-matchers"
  s.version     = "0.0.3"
  s.authors     = ["Alejandro Andres"]
  s.email       = ["fuzzy.alej@gmail.com"]
  s.homepage    = "http://alejandroandres.com/"
  s.summary     = %q{Rspec matchers for Thinking Sphinx}
  s.description = %q{Rspec matchers for Thinking Sphinx}

  s.rubyforge_project = "thinking-sphinx-rspec-matchers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "thinking-sphinx"
end
