urls = [
  "https://glabInstance:glabPort/XXXX,
  "https://glabInstance:glabPort/XXXX,
  "https://glabInstance:glabPort/XXXX,
  "https://glabInstance:glabPort/XXXX
]


user = User.find_by(username: "toufa7")

urls.each do |link|
    project = Project.find_by_full_path(link)
    if project
        project.add_member(user, Gitlab::Access::DEVELOPER, expires_at: 2.weeks.from_now.to_date)
    else
        puts "Project not found for URL: #{link}"
  end
end