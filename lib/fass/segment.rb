# frozen_string_literal: true

module Fass
  class Segment
    attr_reader :name, :args

    def initialize(name, args = [])
      @name = name.to_s
      @args = args.map(&:to_s)
    end

    def to_path
      [@name, *@args]
    end
  end
end
