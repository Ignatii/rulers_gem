require "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      return [404, {'Content-Type' => 'text/html'}, []]  if env['PATH_INFO'] == '/favicon.ico'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'},[text]]
    rescue
      [500, {'Content-Type' => 'text/html'},['It hurt right in the heart!']]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
     @env
    end 
  end
end
