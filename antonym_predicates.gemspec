# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{antonym_predicates}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcos Felipe Pimenta Rodrigues"]
  s.date = %q{2011-01-30}
  s.description = %q{Generate antonym predicates methods for each regular predicate of a class. If the method's name is in the dictionary, then the antonym is used. Otherwise, the form is "not_#{method_name}"}
  s.email = %q{mrodrigues.uff@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/antonym_predicates.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/antonym_predicates.rb", "Manifest", "antonym_predicates.gemspec"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Antonym_predicates", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{antonym_predicates}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generate antonym predicates methods for each regular predicate of a class. If the method's name is in the dictionary, then the antonym is used. Otherwise, the form is "not_#{method_name}"}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
