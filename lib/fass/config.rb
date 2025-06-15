# frozen_string_literal: true

module Fass
  class Config
    attr_accessor :base_url, :headers

    def initialize
      @base_url = ""
      @headers = {}
    end
  end
end
