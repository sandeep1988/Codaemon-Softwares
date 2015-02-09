class CreateTesturls < ActiveRecord::Migration
  def change
    create_table :testurls do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
