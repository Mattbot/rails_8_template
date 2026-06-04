require "rails_helper"

RSpec.describe JwtService do
  let(:secret) { "test-secret" }

  around do |example|
    original_secret = ENV["JWT_SECRET"]
    ENV["JWT_SECRET"] = secret
    example.run
  ensure
    ENV["JWT_SECRET"] = original_secret
  end

  describe ".encode" do
    it "encodes payload with default iat and exp claims" do
      token = described_class.encode({ "sub" => "123" })
      payload = described_class.decode(token)

      expect(payload["sub"]).to eq("123")
      expect(payload).to include("iat", "exp")
      expect(payload["exp"]).to be > payload["iat"]
    end

    it "supports custom expiration values" do
      token = described_class.encode({ "sub" => "123" }, expires_in: 10)
      payload = described_class.decode(token)

      expect(payload["exp"] - payload["iat"]).to eq(10)
    end
  end

  describe ".decode" do
    it "raises MissingTokenError when token is blank" do
      expect { described_class.decode(nil) }
        .to raise_error(JwtService::MissingTokenError)
    end

    it "raises InvalidSignatureError for wrong secrets" do
      token = described_class.encode({ "sub" => "123" }, secret: "different-secret")

      expect { described_class.decode(token) }
        .to raise_error(JwtService::InvalidSignatureError)
    end

    it "raises InvalidTokenError for malformed tokens" do
      expect { described_class.decode("not-a-token") }
        .to raise_error(JwtService::InvalidTokenError)
    end

    it "raises TokenExpiredError for expired tokens" do
      token = described_class.encode({ "sub" => "123", "exp" => 1 })

      expect { described_class.decode(token) }
        .to raise_error(JwtService::TokenExpiredError)
    end

    it "raises MissingSecretError when JWT_SECRET is not set" do
      ENV["JWT_SECRET"] = nil

      expect { described_class.encode({ "sub" => "123" }) }
        .to raise_error(JwtService::MissingSecretError)
    end
  end
end
