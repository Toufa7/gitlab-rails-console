root_group = Group.find_by_id(ID)
subgroup = Group.find_by_path_or_name(GroupName)
def fetchProjectsRecursive(root_group)
  projectsIds = root_group.projects.pluck(:id)
  puts "Projects in group '#{root_group.full_path}': #{projectsIds}" unless projectsIds.empty?

  root_group.children.each do |subgroup|
    fetchProjectsRecursive(subgroup)
  end
end

def fetchProjectsBranches(projectsIds, branchName)
  projectsIds.each do |prj_id|
    project = Project.find_by_id(prj_id)
    puts "[INFO]: ProjectURL : #{Project.find_by_id(prj_id).web_url}]"

    repo = project.repository

    if repo.branch_exists?(branchName)
      tree = repo.tree(branchName, '/')
      files = tree.blobs.map(&:name)

      if files.size < 2
        puts "[ERR]: Project '#{prj_id}' - Branch '#{branchName}' has less than 2 files: #{files.size}."
        puts files.empty? ? "Empty branch!" : files
      else
        puts "[WAR]: Project '#{prj_id}' - Branch '#{branchName}' has #{files.size} files."
      end
    else
      puts "[DEB]: Project '#{prj_id}' - Branch '#{branchName}' does not exist."
    end
  end
end

fetchProjectsRecursive(root_group)
fetchProjectsBranches(projectsIds, 'master')
