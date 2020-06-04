module ODApi
  class Match
    attr_reader :match_id, :start_time, :duration, :radiant_win, :leagueid, :league_name,
                :radiant, :player_slot, :account_id, :kills, :deaths, :assists

    def initialize(match_attr)
      @radiant_win = match_attr['radiant_win']
      @league_name = match_attr['league_name']
      @player_slot = match_attr['player_slot']
      @account_id  = match_attr['account_id']
      @start_time  = match_attr['start_time']
      @match_id    = match_attr['match_id']
      @duration    = match_attr['duration']
      @leagueid    = match_attr['leagueid']
      @radiant     = match_attr['radiant']
      @assists     = match_attr['assists']
      @deaths      = match_attr['deaths']
      @kills       = match_attr['kills']
    end
  end
end
