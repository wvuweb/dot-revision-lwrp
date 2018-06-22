# Base Resource
actions :create

default_action :create if defined?(default_action)

# Name Space
attribute :base_name, :name_attribute => true, :kind_of => String, :required => false, :default => 'default'

# Parameters
attribute :user, kind_of: String, required: true, default: nil
attribute :group, kind_of: String, required: true, default: nil
attribute :release_dir, kind_of: String, required: true, default: nil
