require 'sprockets'
require 'sprockets/engines'
require 'barber'

module MiddlemanEmber
  class HandlebarsTemplate < Tilt::Template
    self.default_mime_type = 'application/javascript'

    @@options = {
      template_path: "templates"
    }

    def self.options=(options)
      @@options.merge!(options)
    end

    def prepare ; end

    def evaluate(scope, locals, &block)
      target   = template_target(scope)
      template = precompile_ember_handlebars(data)
      "#{target} = #{template}\n"
    end

    private

    def template_target(scope)
      "Ember.TEMPLATES[#{template_name(scope.logical_path).inspect}]"
    end

    def precompile_ember_handlebars(string)
      Barber::Ember::FilePrecompiler.call(string)
    end

    def template_name(path)
      template_path = @@options[:template_path]
      path.sub!(/#{Regexp.quote(template_path)}\/?/, '')
      path
    end
  end
end

::Sprockets.register_engine '.hbs', MiddlemanEmber::HandlebarsTemplate
::Sprockets.register_engine '.handlebars', MiddlemanEmber::HandlebarsTemplate
