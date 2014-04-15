# db/migrate/[timestamp]_add_user_to_posts.rb

class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end