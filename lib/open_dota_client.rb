module ODApi
  class OpenDotaClient
    include HTTParty
    base_uri 'https://api.opendota.com/api'

    def heroes
      JSON.parse(self.class.get('/heroes').body)
    end

    def matches(hero: hero_id)
      JSON.parse(self.class.get("/heroes/#{hero}/matches").body)
    end
  end
end
