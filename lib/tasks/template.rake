namespace :template do
  desc "Show template information and next steps"
  task :info do
    puts <<~INFO
      🚀 Rails 8 Template

      This is a Rails application generated from the Rails 8 Template repository.
      
      📚 Documentation:
         • Template usage: TEMPLATE_USAGE.md
         • Linux setup: LINUX_SETUP.md
         • Main README: README.md
      
      🛠️  Common tasks:
         • Start development: ./bin/dev
         • Run tests: bundle exec rspec
         • Check security: rake security:check
         • Bump version: rake version:patch
      
      🔧 Customization:
         • Update README.md with your project description
         • Modify app/controllers/home_controller.rb for your homepage
         • Add your gems to Gemfile
         • Configure database in config/database.yml if switching from SQLite
      
      🎯 Next steps:
         1. Customize your application for your specific needs
         2. Set up your remote repository
         3. Configure any additional services (database, Redis, etc.)
         4. Deploy with Kamal or your preferred deployment method
      
      For more information, visit: https://github.com/Mattbot/rails_8_template
    INFO
  end

  desc "Clean up template-specific files for production use"
  task :cleanup do
    files_to_remove = [
      "TEMPLATE_USAGE.md",
      "bin/template-setup"
    ]
    
    puts "🧹 Cleaning up template files..."
    
    files_to_remove.each do |file|
      file_path = Rails.root.join(file)
      if File.exist?(file_path)
        File.delete(file_path)
        puts "✅ Removed #{file}"
      end
    end
    
    puts "🎉 Template cleanup complete!"
    puts "Your application is ready for production use."
  end

  desc "Check if running as template or generated app"
  task :status do
    template_files = [
      "TEMPLATE_USAGE.md",
      "bin/template-setup"
    ]
    
    is_template = template_files.any? { |file| File.exist?(Rails.root.join(file)) }
    
    if is_template
      puts "📋 Status: Template repository"
      puts "Run './bin/template-setup PROJECT_NAME' to generate a new app"
    else
      puts "🚀 Status: Generated application" 
      puts "Template setup has been completed"
    end
  end
end