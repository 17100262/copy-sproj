class AddCityIdToUniversity < ActiveRecord::Migration[5.0]
  def change
    add_column :universities, :CityId, :integer
    add_foreign_key :city, :CityId
    add_foreign_key :discipline_univeristy, :university_id
  	add_foreign_key :discipline_univeristy, :discipline_id
  	add_foreign_key :university, :CityId
  	rename_column :universities, :CityId, :city_id
  	change_column_null :universities, :city_id, false
  	remove_foreign_key :universities, column: :CityId
  	add_foreign_key :universities, :city_id
  	remove_foreign_key :city, column: :CityId
  	remove_foreign_key :university, column: :CityId
  	add_foreign_key :university, :city_id
  	remove_foreign_key :universities, column: :CityId
  	add_foreign_key :universities, :city_id
  	remove_index :subdisciplines, :column => :discipline_id
  	remove_column :subdisciplines, :column => :discipline_id
  	add_column :subdisciplines, :description, :text
  # add_column :discipline_universities, :subdiscipline_id, :integer, :null => :false
  	add_column :discipline_universities, :degree_id, :integer, :null => :false
  	remove_column :discipline_universities, :subdiscipline_id
  	remove_column :discipline_universities, :degree_id
  	add_column :degreeprograms, :discipline_id, :integer
  	add_foreign_key :subdisciplines, :discipline_id
  	add_foreign_key :degreeprograms, :discipline_id
  	add_foreign_key :degreeprograms, :subdiscipline_id
  	add_foreign_key :discipline, :id
  	rename_column :degreeprograms, :type, :degree_type
  	add_foreign_key :university_degrees, :degree_id
  	remove_foreign_key :university_degrees, column: :id
  	add_foreign_key :university_degrees, :degree_id, :university_degree_id
  end
end
