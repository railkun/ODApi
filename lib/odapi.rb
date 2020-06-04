require 'httparty'
require 'pry'

require_relative 'exceptions/undefined_hero_id_error'
require_relative 'models/hero'
require_relative 'models/match'
require_relative 'open_dota_client'

module ODApi
  OPEN_DOTA_CLIENT = OpenDotaClient.new

  def self.heroes
    heroes = OPEN_DOTA_CLIENT.heroes
    heroes.map { |hero_attr| Hero.new(hero_attr) }
  end

  def self.matches(hero: hero_id)
    matches = OPEN_DOTA_CLIENT.matches(hero: hero)

    raise UndefinedHeroIdError, "Undefined hero with id:#{hero}" if matches.empty?

    matches.map { |match_attr| Match.new(match_attr) }
  end
end
