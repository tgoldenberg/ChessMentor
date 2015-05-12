class AddDetailsToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :uid, :string
    add_column :mentors, :avatar_file_name, :string
    add_column :mentors, :avatar_content_type, :string
    add_column :mentors, :avatar_file_size, :integer
    add_column :mentors, :avatar_updated_at, :datetime
  end
end
