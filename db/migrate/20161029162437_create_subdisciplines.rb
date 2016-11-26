class CreateSubdisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :subdisciplines do |t|
      t.string :name
      t.references :discipline, foreign_key: true
      t.timestamps
    end
  end
end
