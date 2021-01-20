require "r00lz/version"

module R00lz
  class Error < StandardError; end
  # Your code goes here...

  class App
    def call(env)
      [200, {"content-type" => "text/html"}, ["Hello from R00lz!"]]
    end
  end
end
