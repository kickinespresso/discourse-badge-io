require 'csv'

#rake import_user_badges badges2.csv chris@kickinespresso.com
desc "Import user badges from csv file"
task :import_user_badges => [:environment] do

  ARGV.each { |a| task a.to_sym do ; end }

  filename = ARGV[1]

  puts "Starting User Badges Import to #{filename}"

  admin =  User.where(email: ARGV[2]).first

  csv_text = File.read(filename)
  csv = CSV.parse(csv_text, :headers => true)

  csv.each do |row|

    user = User.where(email: row[0]).first
    badges = user.badges.map {|badge| badge.name }

    new_badges = row[1].gsub("[",'').gsub("]",'').split(", ")
      new_badges.each do |new_badge|
        if badges.exclude? new_badge
          badge = Badge.where(name: new_badge).first
          UserBadge.create!(user: user, badge: badge, granted_by: admin, granted_at: DateTime.now)
        end
      end
  end

  puts 'Import complete'

end
