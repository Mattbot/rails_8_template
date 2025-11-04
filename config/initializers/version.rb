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
end

# Make version available as a constant
APP_VERSION = AppVersion.current
