module Inatra
  class << self
    def routes(&block)
      @routes ||= {}
      instance_eval(&block)
    end

    def method_missing(method_name, arg, &block)
      add_verb(method_name, arg, &block)
    end

    def add_verb(verb, path, &block)
      @routes[verb.to_s] ||= {}
      @routes[verb.to_s][path] = block.call
    end

    def not_found
      [404, {}, ['Not Found']]
    end

    def call(env)
      verb = env['REQUEST_METHOD'].downcase
      path = env['PATH_INFO']
      @routes[verb][path] || not_found
    end
  end
end
