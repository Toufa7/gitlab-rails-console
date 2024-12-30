# Check pipeline 

project = Project.find_by_id(1337)
pipelines = project.builds.order(id: :desc).limit(10)

pipelines.each do |pipe|
    puts "-------------------------"
    puts "Job: #{pipe.name}"
    puts "Status: #{pipe.status}"
    puts "Id: #{pipe.id}"
    if pipe.artifacts_file.nil?
        puts "Artifacts: #{pipe.artifacts_file}"
        puts "Artifact Link: #{pipe.artifacts_size} / 1000000MB"
    end
    puts "Commit: #{pipe.commit.message}"
    puts "Created At: #{pipe.created_at}"
    puts "Triggered By: #{pipe.user}"
end
