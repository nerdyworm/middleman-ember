Gem::Specification.new do |s|
  s.name = "middleman-ember"
  s.version = "0.0.1"
  s.summary = "Compiles handlebars template for ember"
  s.author = "Benjamin Silas Rhodes"
  s.email = "ben@nerdyworm.com"
  s.homepage = ""

  s.files = Dir["README.md", "lib/**/*.rb"]

  s.add_dependency "sprockets", ">= 0"
  s.add_dependency "barber", ">= 0"
end
