class AddBodyToComments < ActiveRecord::Migration
  def up
    add_column :comments, :body, :text
  end

  def down
    remove_column :comments, :body
  end
end
