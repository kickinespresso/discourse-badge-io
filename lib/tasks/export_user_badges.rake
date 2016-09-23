
require 'csv'


#rake export_user_badges badges2.csv
desc "Export User Badges from csv file"
task :export_user_badges => [:environment] do

  ARGV.each { |a| task a.to_sym do ; end }

  filename = ARGV[1]
  users = User.all

  puts "Starting User Badges Export to #{filename}"

  CSV.open(filename, "w") do |csv|
    csv << ["email", "badges"]
    users.each do |user|
      badges = user.badges.map {|badge| badge.name }
      #puts user.email + " " + badges.to_s
      csv << [user.email, badges.to_s.gsub('"','') ]
    end
  end

  puts 'Export complete'

end
