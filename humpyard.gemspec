# Generated by rake
# DO NOT EDIT THIS FILE DIRECTLY
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{humpyard}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven G. Broenstrup"]
  s.date = %q{2010-03-20}
  s.description = %q{Humpyard is a Rails CMS}
  s.email = %q{info@humpyard.org}
  s.files = ["lib/extensions", "lib/extensions/action_controller", "lib/extensions/action_controller/base.rb", "lib/humpyard", "lib/humpyard/config.rb", "lib/humpyard/engine.rb", "lib/humpyard.rb", "lib/tasks", "lib/tasks/humpyard.rake", "app/controllers/humpyard/pages_controller.rb", "app/models/humpyard/element.rb", "app/models/humpyard/page.rb", "app/views/humpyard/pages", "app/views/humpyard/pages/index.html.haml", "app/views/humpyard/pages/show.html.haml", "config/routes.rb", "config/locales/en.yml", "db/migrate/20100311130037_pages.rb", "VERSION", "README.rdoc", "Gemfile"]
  s.homepage = %q{http://humpyard.org/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Humpyard is a Rails CMS}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0.beta"])
      s.add_runtime_dependency(%q<haml>, [">= 2.2.20"])
      s.add_runtime_dependency(%q<acts_as_tree>, [">= 0.1.1"])
      s.add_runtime_dependency(%q<globalize2>, [">= 0.2.0"])
    else
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.0.0.beta"])
      s.add_dependency(%q<haml>, [">= 2.2.20"])
      s.add_dependency(%q<acts_as_tree>, [">= 0.1.1"])
      s.add_dependency(%q<globalize2>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.0.0.beta"])
    s.add_dependency(%q<haml>, [">= 2.2.20"])
    s.add_dependency(%q<acts_as_tree>, [">= 0.1.1"])
    s.add_dependency(%q<globalize2>, [">= 0.2.0"])
  end
end
