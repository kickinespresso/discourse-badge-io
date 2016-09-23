require 'csv'

#rake remove_user_badges badges2.csv Editor
desc "Remove user badges  by list csv file"
task :remove_user_badges => [:environment] do

  ARGV.each { |a| task a.to_sym do ; end }

  filename = ARGV[1]

  puts "Starting User Badges Import to #{filename}"

  badge_removing =  ARGV[2]

  csv_text = File.read(filename)
  csv = CSV.parse(csv_text, :headers => true)

  csv.each do |row|

    user = User.where(email: row[0]).first
    badges = user.badges.map {|badge| badge.name }

    if badges.include? badge_removing
      badge_to_remove = Badge.where(name: badge_removing).first
      user_badge = UserBadge.where(user: user, badge: badge_to_remove ).first
      user_badge.destroy!

      #badge = Badge.where(name: new_badge).first
      #UserBadge.create!(user: user, badge: badge, granted_by: admin, granted_at: DateTime.now)
    end

  end

  puts 'Removal complete'

end
