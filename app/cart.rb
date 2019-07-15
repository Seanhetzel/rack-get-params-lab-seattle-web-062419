class Cart

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack.Request.new(env)

    if req.path.match(/cart/)
      @@cart.each do |product|
        resp.write "#{product}\n"


end
