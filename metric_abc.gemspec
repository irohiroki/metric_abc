# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "metric_abc"
  spec.date          = %q{2010-08-24}
  spec.version       = File.read("VERSION").chomp
  spec.authors       = ["Hubert Lepicki"]
  spec.email         = ["hubert.lepick@amberbit.com"]
  spec.description   = %q{Calculates ABC metric for Ruby 1.9. Just like Flog but much more dull.}
  spec.summary       = %q{Quick and *DIRTY* ABC metric for Ruby 1.9 code}
  spec.homepage      = "http://github.com/hubertlepicki/metric_abc"
  spec.license       = "Asking."

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
