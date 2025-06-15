# frozen_string_literal: true

require "spec_helper"
require "fass/segment"

RSpec.describe Fass::Segment do
  describe "#initialize" do
    it "converts name to string" do
      segment = described_class.new(:users)
      expect(segment.name).to eq("users")
    end

    it "stores string arguments as strings" do
      segment = described_class.new(:users, %w[1 abc])
      expect(segment.args).to eq(%w[1 abc])
    end

    it "converts numeric arguments to strings" do
      segment = described_class.new(:users, [1, 2024])
      expect(segment.args).to eq(%w[1 2024])
    end
  end

  describe "#to_path" do
    it "returns an array with name and arguments" do
      segment = described_class.new(:posts, [42, "comments"])
      expect(segment.to_path).to eq(%w[posts 42 comments])
    end

    it "returns just the name if no arguments" do
      segment = described_class.new(:status)
      expect(segment.to_path).to eq(["status"])
    end
  end
end
