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

  def self.to_underscore(s)
    s.gsub(
      /([A-Z]+)([A-Z][a-z])/,
      '\1_\2').gsub(
      /([a-z\d])([A-Z])/,
      '\1_\2').downcase
  end
end

class Object
  def self.const_missing(c)
    require R00lz.to_underscore(c.to_s)
    Object.const_get(c)
  end
end
