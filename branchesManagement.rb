project = Project.find_by_id(1337)
branches = project.repository.branches
projet.web_url

# Checking branches

branches.each do |branch|
    puts "-------------------------"
    puts "Branch: #{branch.name}"
    puts "Commit: #{branch.dereferenced_target.message}}"
    puts "ID: #{branch.dereferenced_target.id}}"
end

# Create a new branch

project.repository.create_branch("new_branch", "source_branch")

# Rename a branch

old_branch = project.repository.find_branch("old_branch")
project.repository.create_branch("new_branch", old_branch.target) # Target is the commit id
project.repository.delete_branch("old_branch")

# Protect a branch

project.repository.protect_branch("branch_name")

# Delete a branch

project.repository.delete_branch("branch_name")

# Show commits

commits = project.repository.commits("master", limit: 5)
commits.each do |commit|
    puts "-------------------------"
    puts "Commit: #{commit.id}"
    puts "Message: #{commit.message}"
end
