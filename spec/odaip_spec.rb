require '../lib/odapi'
require 'webmock/rspec'
require 'pry'

RSpec.describe ODApiLib::ODApi do
  describe '.heroes' do
    before do
      stub_request(:get, 'https://api.opendota.com/api/heroes')
        .to_return(body: [hero_attr].to_json)
    end

    subject { described_class.heroes }

    let(:hero_attr) do
      {
        'id' => 1,
        'name' => 'npc_dota_hero_antimage',
        'localized_name' => 'Anti-Mage',
        'primary_attr' => 'agi',
        'attack_type' => 'Melee',
        'roles' => %w[Carry Escape Nuker],
        'legs' => 2
      }
    end

    context 'expect no empty massif' do
      it { expect(subject.first).eql?(Hero.new(hero_attr)) }
    end
  end

  describe '.matches' do
    before do
      stub_request(:get, "https://api.opendota.com/api/heroes/#{params[:hero]}/matches")
        .to_return(body: match_attr)
    end

    subject { described_class.matches(params) }

    context 'if correct hero id' do
      let(:match_attr) do
        [{
          'match_id' => 5452093536,
          'start_time' => 1591201406,
          'duration' => 2313,
          'radiant_win' => false,
          'leagueid' => 12098,
          'league_name' => 'Vulkan Fight Series',
          'radiant' => false,
          'player_slot' => 1,
          'account_id' => 95430068,
          'kills' => 4,
          'deaths' => 6,
          'assists' => 5
        }].to_json
      end

      let(:params) { { hero: 1 } }

      it { expect(subject.first).eql?(Match.new(match_attr)) }
    end

    context 'if wrong hero id' do
      let(:match_attr) { [].to_json }
      let(:params) { { hero: 999 } }

      it { expect { subject }.to raise_error(ODApiLib::ODApi::UNDEFINED_HERO_ID_ERROR) }
    end
  end
end
