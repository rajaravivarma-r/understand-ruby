RESPONSE_BODY = "Hello Rack!".freeze
RESPONSE_HEADER = {"Content-Type" => "text/html"}
class HelloRack

  def call(env)
    [200, RESPONSE_HEADER, [RESPONSE_BODY]]
  end

end

run HelloRack.new
