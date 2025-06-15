# frozen_string_literal: true

require "debug"
require "fass/config"
require "fass/segment"
require "faraday"
require "forwardable"

module Fass
  class Client
    extend Forwardable

    HTTP_METHODS = %i[get post put delete].freeze

    def_delegators @config, :base_url, :base_url=
    attr_reader :config
    attr_accessor :base_url, :headers

    def initialize(segments = [], base_url: "", headers: "")
      @segments = segments
      @base_url = base_url
      @headers = headers
    end

    def method_missing(method, *args)
      new_segments = @segments + [Segment.new(method, args)]
      Client.new(new_segments, base_url: base_url, headers: headers)
    end

    def get
      http_client.get(path)
    end

    def post(payload: nil)
      http_client.post(path, payload.to_json)
    end

    def delete
      "DELETE /#{path}"
    end

    def put(payload: nil)
      http_client.put(path, payload.to_json)
    end

    def respond_to_missing?(_method, _include_private = false)
      true
    end

    def path
      @path ||= @segments.flat_map(&:to_path).join("/")
    end

    private

    def http_client
      @http_client ||= Faraday.new url: base_url
    end

    def request(http_method, payload = nil)
      if payload
        "#{http_method.to_s.upcase} /#{path} with #{payload.to_json}"
      else
        "#{http_method.to_s.upcase} /#{path}"
      end
    end
  end
end
