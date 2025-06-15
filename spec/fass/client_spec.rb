# frozen_string_literal: true

require "spec_helper"
require "fass/client"

RSpec.describe Fass::Client do
  let(:api) { Fass::Api.new(base_url: "https://github.com/", headers: {}) }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }

  describe "GET requests" do
    it "generates a simple GET path" do
      stub_request(:get, "https://github.com/status")
        .to_return(status: 200, body: {}.to_json, headers: {})
      response = api.status.get
      expect(response.body).to eq({}.to_json)
      expect(response.status).to eq(200)
    end

    it "generates a nested GET path with arguments" do
      stub_request(:get, "https://github.com/users/1/mentions/2/2024")
        .to_return(status: 200, body: {}.to_json, headers: {})
      response = api.users(1).mentions(2, 2024).get
      expect(response.body).to eq({}.to_json)
      expect(response.status).to eq(200)
    end

    describe "chaining dynamic methods" do
      it "chains multiple dynamic calls with args" do
        stub_request(:get, "https://github.com/a/1/b/2/c/3")
          .to_return(status: 200, body: {}.to_json, headers: {})
        response = api.a(1).b(2).c(3).get
        expect(response.body).to eq({}.to_json)
        expect(response.status).to eq(200)
      end

      it "chains methods with no args" do
        stub_request(:get, "https://github.com/foo/bar/baz")
          .to_return(status: 200, body: {}.to_json, headers: {})

        response = api.foo.bar.baz.get
        expect(response.body).to eq({}.to_json)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "POST requests" do
    it "handles POST path with arguments" do
      payload = { liker: :pathe }
      stub_request(:post, "https://github.com/posts/1/likes")
        .with(body: payload.to_json)
        .to_return(status: 200, body: {}.to_json, headers: {})
      response = api.posts(1).likes.post(payload: payload)
      expect(response.body).to eq({}.to_json)
      expect(response.status).to eq(200)
    end
  end

  describe "PUT and DELETE requests" do
    it "generates PUT path with arguments" do
      payload = { liker: :pathe }
      stub_request(:put, "https://github.com/settings")
        .with(body: payload.to_json)
        .to_return(status: 200, body: {}.to_json, headers: {})
      response = api.settings.put(payload: payload)
      expect(response.body).to eq({}.to_json)
      expect(response.status).to eq(200)
    end

    it "generates DELETE path with arguments" do
      expect(api.items(42).delete).to eq("DELETE /items/42")
    end
  end

  describe "method_missing behavior" do
    it "responds to any method" do
      expect(api.respond_to?(:anything)).to be true
      expect(api.respond_to?(:get)).to be true
    end
  end
end
