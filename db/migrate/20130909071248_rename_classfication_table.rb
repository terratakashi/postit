class RenameClassficationTable < ActiveRecord::Migration
  def up
  	rename_table :classifications, :post_categories
  end

  def down
    rename_table :post_categories, :classifications
  end
end
