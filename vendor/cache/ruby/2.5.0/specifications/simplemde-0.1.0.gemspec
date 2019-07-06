# -*- encoding: utf-8 -*-
# stub: simplemde 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simplemde".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["arsique".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-08-26"
  s.description = "This gem adds SimpleMDE markdown editor css and js files to you asset pipeline".freeze
  s.email = ["sim.gishel.7@gmail.com".freeze]
  s.homepage = "http://github.com/arsique/simplemde".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "SimpleMDE markdown editor for Rails 5".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
