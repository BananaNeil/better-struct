Gem::Specification.new do |s|
  s.name        = 'better-struct'
  s.version     = '1.0.3'
  s.date        = '2017-08-12'
  s.description = "OpenStruct with parameter enforcements"
  s.summary     = "Better than OpenStruct"
  s.authors     = ["@BananaNeil", "@TastyCode"]
  s.email       = 'engineering@countable.us'
  s.files       = ["lib/better_struct.rb"]
  s.homepage    = 'http://rubygems.org/gems/better-struct.rb'
  s.license     = 'MIT'

  s.add_dependency "activemodel", '>= 2.1'
end

