desc "This task is called by the Heroku scheduler add-on"
task :keep_site_alive => :environment do
    puts "keeping site alive..."
    Comic.keep_site_alive
    puts "done."
end