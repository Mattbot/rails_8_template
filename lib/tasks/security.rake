namespace :security do
  desc "Update bundle-audit database"
  task :update do
    puts "🔍 Running security update..."

    `bundle exec bundle-audit update`

    if $?.success?
      puts "✅ bundle-audit database updated!"
    else
      puts "⚠️ bundle-audit database update failed!"
      exit(1)
    end
  end

  desc "Run bundle-audit security check"
  task :audit do
    puts "🔍 Running security audit..."

    output = `bundle exec bundle-audit check`

    if $?.success?
      puts "✅ No security vulnerabilities found!"
    else
      puts "⚠️  Security vulnerabilities detected!"
      p output
      exit(1)
    end
  end
end
