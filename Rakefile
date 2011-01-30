require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('antonym-predicates', '0.1.0') do |p|
  p.description     = "Generate antonym predicates methods for each regular predicate of a class."
  p.summary         = "Generate antonym predicates methods for each regular predicate of a class. If the method's name is in the dictionary, then the antonym is used. Otherwise, the form is \"not_\#{method_name}\""
  p.url             = "https://github.com/mrodrigues/antonym-predicates"
  p.author          = "Marcos Felipe Pimenta Rodrigues"
  p.email           = "mrodrigues.uff@gmail.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies  = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

