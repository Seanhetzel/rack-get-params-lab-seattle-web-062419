class Cart

  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack.Request.new(env)

    if req.path.match(/cart/)
      @@cart.each do |product|
        resp.write "#{product}\n"
      end
    elsif req.path.match(/add/)
      adding_product = req.params["q"]
      if @@items.include?(adding_product)
        @@cart << adding_product
      else
        resp.write "Coulnd't find #{adding_product}"
      end
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

end
