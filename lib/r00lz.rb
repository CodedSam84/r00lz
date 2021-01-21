require "r00lz/version"

module R00lz
  class Error < StandardError; end
  # Your code goes here...

  class App
    def call(env)
      k1, act = cont_and_act(env)
      text = k1.new(env).send(act)
      [200, {"content-type" => "text/html"}, [text]]
    end

    def cont_and_act(env)
      _, con, act, after = env["PATH_INFO"].split('/')
      con = con.capitalize + "Controller"
     [Object.const_get(con), act]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
