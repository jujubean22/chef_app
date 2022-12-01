module Recipe
  class Client
    def self.random
      response = Request.call(http_method: 'get', endpoint: '/random.php')
    end

  end
  
end
