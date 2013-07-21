class CreatePflegeanbieters < ActiveRecord::Migration
  def change
    create_table :pflegeanbieters do |t|
      t.string :name
      t.integer :bewertung

      t.timestamps
    end
  end
end
