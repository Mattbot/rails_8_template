# Application version management
module AppVersion
  VERSION_FILE = Rails.root.join("VERSION")

  def self.current
    @current ||= File.read(VERSION_FILE).strip
  end

  def self.reload!
    @current = nil
    current
  end

  def self.major
    current.split(".")[0].to_i
  end

  def self.minor
    current.split(".")[1].to_i
  end

  def self.patch
    current.split(".")[2].to_i
  end

  def self.to_s
    current
  end

  def self.git_hash
    @git_hash ||= begin
      env_hash = ENV["GIT_HASH"].to_s.strip
      if env_hash.empty?
        hash = `git rev-parse --short HEAD 2>/dev/null`.to_s.strip
        hash.empty? ? "unknown" : hash
      else
        env_hash
      end
    rescue StandardError
      "unknown"
    end
  end
end

# Make version available as a constant
APP_VERSION = AppVersion.current
