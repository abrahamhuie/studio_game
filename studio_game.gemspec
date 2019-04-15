Gem::Specification.new do |s|
  s.name         = "abes_game"
  s.version      = "1.0.0"
  s.author       = "Abraham Huie"
  s.email        = "abrahamhuie@gmail.com"
  s.homepage     = "https://www.github.com/abrahamhuie"
  s.summary      = "Roll the highest score. It's gametime."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end