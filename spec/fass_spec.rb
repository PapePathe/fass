# frozen_string_literal: true

RSpec.describe Fass do
  it "has a version number" do
    expect(Fass::VERSION).not_to be_nil
  end

  it "has an api client" do
    expect(Fass::Api).to eq(Fass::Client)
  end
end
