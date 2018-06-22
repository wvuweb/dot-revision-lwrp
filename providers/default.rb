action :create do

  results_file = ::File.join(new_resource.release_dir,".revision")
  command = "cd " + new_resource.release_dir + " && git rev-parse --verify HEAD"

  Chef::Log.info("Running bash command `#{command}`")
  bash command do
    user new_resource.user
    group new_resource.group
    code <<-EOH
    #{command} &> #{results_file}
    EOH
  end

  Chef::Log.info(".revision file should now exist at: #{new_resource.release_dir}")
end

def load_current_resource
  @current_resource = Chef::Resource::DotRevisionLwrp.new(@new_resource.name)

  @current_resource.user(@new_resource.user)
  @current_resource.group(@new_resource.group)
  @current_resource.release_dir(@new_resource.release_dir)
end
