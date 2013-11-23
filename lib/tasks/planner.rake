namespace :planner do
  desc "Reset the planner application environment"
  task :reset_db => :environment do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:fixtures:load"].invoke
  end  
  task :reset_dev => :environment do
    Rake::Task["db:drop"].invoke
    exec "rake planner:reset_db"
  end  
  task :reset_prod => :environment do
    Bundler.with_clean_env { sh 'heroku pg:reset postgres --confirm limitless-lake-2862' }  
    Bundler.with_clean_env { sh 'heroku run:detached rake planner:reset_db' }  
  end
end
