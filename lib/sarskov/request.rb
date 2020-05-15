# frozen_string_literal: true

module Sarskov
  class Request
    require 'net/http'
    require 'json'

    BASE_URL = 'https://corona.lmao.ninja/v2/'
    COUNTRIES_PATH = BASE_URL + 'countries/'
    STATES_PATH =  BASE_URL + 'states/'
    JHUCSSE_URL = BASE_URL + '/v2/jhucsse'

    SERVER_DOWN = 'Server overwhelmed. Please try again in a moment.'

    EU_ISOS = %w[AT BE BG CY CZ DE DK EE ES FI FR GR HR HU IE IT LT \
                 LU LV MT NL PL PT RO SE SI SK].freeze
    EUROPE_ISOS = EU_ISOS + %w[GB IS NO CH MC AD SM VA BA RS ME MK AL\
                               BY UA RU MD]
    AFRICA_ISOS = %w[DZ AO BJ BW BF BI CM CV CF TD KM CD CG CI DJ EG \
                     GQ ER SZ ET GA GM GH GN GW KE LS LR LY MG MW ML MR MU MA MZ NA NE \
                     NG RW ST SN SC SL SO ZA SS SD TZ TG TN UG ZM ZW EH].freeze
    SOUTH_AMERICA_ISOS = ['AR' 'BO', 'BV', 'BR', 'CL', 'CO', 'EC', \
                          'FK', 'GF', 'GY', 'PY', 'PE', 'GS', 'SR', 'UY', 'VE'].freeze
    ASIA_ISOS = %w[AE AF AM AZ BD BH BN BT CC CN CX GE HK ID IL IN \
                   IQ IR JO JP KG KH KP KR KW KZ LA LB LK MM MN MO MY NP OM PH PK \
                   PS QA SA SG SY TH TJ TL TM TR TW UZ VN YE].freeze

    class << self
      ### FETCH METHODS ###

      def check(country_name)
        # TODO: Match ISOs to full country names
        country_name = 'nl' if country_name == 'netherlands'
        # binding.irb
        #https://corona.lmao.ninja/v2/countries/ghana
        #https://corona.lmao.ninja/v2/countries/ghana

        uri = URI("#{COUNTRIES_PATH}#{country_name}")
        #uri = COUNTRIES_PATH + "/#{country_name}"

        JSON.parse(Net::HTTP.get(uri))
      end

      def state(state_name)
        uri = URI(STATES_PATH)
        states_array = JSON.parse(Net::HTTP.get(uri))

        states_array.select { |sn| sn['state'] == capitalize_words(state_name) }.first
      end

      def province; end

      ## WORLD ##

      def world
        uri = URI(BASE_URL + 'all/')

        JSON.parse(Net::HTTP.get(uri))
      end

      ## CONTINENTS ##

      def africa
        aggregator(AFRICA_ISOS)
      end

      def europe
        aggregator(EUROPE_ISOS)
      end

      def eu
        aggregator(EU_ISOS)
      end

      def sa
        aggregator(SOUTH_AMERICA_ISOS)
      end

      def asia
        aggregator(ASIA_ISOS)
      end

      ### COMPARE METHODS ###

      # Returns data sorted by 'cases'
      def compare_countries(*list)
        list.map do |country|
          uri = URI(COUNTRIES_PATH + country.to_s)

          JSON.parse(Net::HTTP.get(uri))
        end.sort_by { |country| -country['cases'] }
      end

      # Returns an array of hashes containing list of states passed as parameter
      def compare_states(*states)
        JSON.parse(Net::HTTP.get(URI(STATES_PATH))).map do |state|
          state if states.include?(state['state'].downcase)
        end.compact
      end

      ### HISTORY ###

      private

      def aggregator(isos)
        uri = URI(COUNTRIES_PATH)
        countries_array = JSON.parse(Net::HTTP.get(uri))

        country_array = countries_array.select do |hash|
          isos.include?(hash['countryInfo']['iso2'])
        end

        data = country_array.inject do |base, other|
          base.merge(other) do |key, left, right|
            left  ||= 0
            right ||= 0

            left + right unless %w[country countryInfo].include?(key)
          end
        end.compact
      end

      def capitalize_words(string)
        string.split.map(&:capitalize).join(' ')
      end
    end
  end
end
