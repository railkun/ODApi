require 'httparty'
require 'pry'

require_relative 'exceptions/undefined_hero_id_error'
require_relative 'models/hero'
require_relative 'models/match'
require_relative 'open_dota_client'

module ODApiLib
  class ODApi
    OPEN_DOTA_CLIENT = OpenDotaClient.new
    UNDEFINED_HERO_ID_ERROR = UndefinedHeroIdError

    def self.heroes
      heroes = OPEN_DOTA_CLIENT.heroes
      heroes.map { |hero_attr| Hero.new(hero_attr) }
    end

    def self.matches(hero: hero_id)
      matches = OPEN_DOTA_CLIENT.matches(hero: hero)

      raise UNDEFINED_HERO_ID_ERROR, "Undefined hero with id:#{hero}" if matches.empty?

      matches.map { |match_attr| Match.new(match_attr) }
    end
  end
end
