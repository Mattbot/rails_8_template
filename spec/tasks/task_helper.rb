require 'rake'

class TaskHelper
  class << self
    def run(task_name:, args: nil)
      Rails.application.load_tasks if Rake::Task.tasks.empty?
      stdout = StringIO.new
      $stdout = stdout
      Rake::Task[task_name].invoke(*args)
      $stdout = STDOUT
      Rake.application[task_name].reenable
      stdout.string
    end
  end
end
