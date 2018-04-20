require "spec_helper"

describe Omniauth::Fedid do
  subject do
    OmniAuth::Strategies::Fedid.new({})
  end

  it "has a version number" do
    expect(Omniauth::Fedid::VERSION).not_to be nil
  end

  context "client options" do
    it 'should have correct name' do
      expect(subject.options.name).to eq("fedid_oauth")
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/as/token.oauth2')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/as/authorization.oauth2')
    end
  end
end
