require "json"

namespace :version do
  desc "Show current version"
  task :show do
    puts "Current version: #{current_version}"
  end

  desc "Bump patch version (x.y.Z)"
  task :patch do
    bump_version(:patch)
  end

  desc "Bump minor version (x.Y.z)"
  task :minor do
    bump_version(:minor)
  end

  desc "Bump major version (X.y.z)"
  task :major do
    bump_version(:major)
  end

  private

  def current_version
    @current_version ||= File.read(version_file_path).strip
  end

  def version_file_path
    Rails.root.join("VERSION")
  end

  def package_json_path
    Rails.root.join("package.json")
  end

  def bump_version(level)
    version_parts = current_version.split(".").map(&:to_i)
    major, minor, patch = version_parts

    case level
    when :patch
      patch += 1
    when :minor
      minor += 1
      patch = 0
    when :major
      major += 1
      minor = 0
      patch = 0
    end

    new_version = [ major, minor, patch ].join(".")

    # Update VERSION file
    File.write(version_file_path, new_version)
    puts "📦 Updated VERSION file: #{current_version} → #{new_version}"

    # Update package.json
    if File.exist?(package_json_path)
      package_json = JSON.parse(File.read(package_json_path))
      package_json["version"] = new_version
      File.write(package_json_path, JSON.pretty_generate(package_json) + "\n")
      puts "📦 Updated package.json: #{current_version} → #{new_version}"
    end

    # Clear cached version
    @current_version = nil

    puts "✅ Version bumped to #{new_version}"
    puts "💡 Don't forget to commit and tag this version:"
    puts "   git add VERSION package.json"
    puts "   git commit -m \"Bump version to #{new_version}\""
    puts "   git tag -a v#{new_version} -m \"Version #{new_version}\""
  end
end
