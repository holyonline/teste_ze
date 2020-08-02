module Test
  module V1
    class Weather
      include HTTParty

      base_uri CONFIG_API['weather'][$environment]
    
      def search_city(query)
        self.class.get("/", query: query)
      end
    end
  end
end