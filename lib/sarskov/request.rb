# frozen_string_literal: true

module Sarskov
  class Request
    require 'net/http'
    require 'json'

    BASE_URL = 'https://corona.lmao.ninja/'
    COUNTRIES_PATH = BASE_URL + 'countries/'

    class << self
      def check(country_name)
        uri = URI("#{COUNTRIES_PATH}#{country_name}")

        JSON.parse(Net::HTTP.get(uri))
      end
    end
  end
end
