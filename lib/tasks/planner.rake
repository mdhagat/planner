namespace :planner do
  desc "Reset the planner application environment"
    task :reset_data => :environment do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:fixtures:load"].invoke
  end  
  task :reset_dev => :environment do
    Rake::Task["db:drop"].invoke
    exec "rake planner:reset_data"
  end  
  task :reset_prod => :environment do
    exec "heroku pg:reset postgres --confirm limitless-lake-2862"
    exec "heroku run:detached rake planner:reset_data"
  end
end
