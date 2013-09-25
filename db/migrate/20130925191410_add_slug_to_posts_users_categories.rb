class AddSlugToPostsUsersCategories < ActiveRecord::Migration
  def up
    add_column :users, :slug, :string
    add_column :posts, :slug, :string
    add_column :categories, :slug, :string
  end

  def down
    remove_column :users, :slug
    remove_column :posts, :slug
    remove_column :categories, :slug
  end
end
