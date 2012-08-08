lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'twilioauth'
  s.version     = '0.0.3'
  s.date        = '2012-08-08'
  s.summary     = "2 factor auth for twilio"
  s.description = "2 factor auth for twilio"
  s.authors     = ["Kelly Mahan"]
  s.email       = 'kmahan@kmahan.com'
  s.files       = ["lib/twilioauth.rb"]
  s.homepage    = 'http://rubygems.org/gems/twilioauth'
  
  s.files = `git ls-files`.split("\n")
  #s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  
  s.requirements << "twilio-ruby"
  
  s.add_dependency "twilio-ruby"
  
  
end