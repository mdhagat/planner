namespace :planner do
  desc "Reset the planner application environment"
  task :reset_dev => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:fixtures:load"].invoke
  end  
  task :reset_prod => :environment do
    exec "heroku pg:reset postgres --confirm limitless-lake-2862"
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:fixtures:load"].invoke
  end
end
