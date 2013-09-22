class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :post
      t.references :category

      t.timestamps
    end
  end
end
