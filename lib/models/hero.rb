module ODApi
  class Hero
    attr_reader :id, :name, :localized_name, :primary_attr, :attack_type, :roles, :legs

    def initialize(hero_attr)
      @localized_name = hero_attr['localized_name']
      @primary_attr   = hero_attr['primary_attr']
      @attack_type    = hero_attr['attack_type']
      @name           = hero_attr['name']
      @roles          = hero_attr['roles']
      @legs           = hero_attr['legs']
      @id             = hero_attr['id']
    end
  end
end
