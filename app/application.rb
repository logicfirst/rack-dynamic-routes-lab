class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    else resp.write "Route not found"
        resp.status = 404
    end
    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end

# Your application should only accept the /items/&lt;ITEM NAME> route. Everything else should 404
# If a user requests /items/&lt;Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message
