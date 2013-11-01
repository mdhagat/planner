namespace :planner do
  desc "Reset the planner application environment"
  task :reset => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:fixtures:load"].invoke
  end
end
