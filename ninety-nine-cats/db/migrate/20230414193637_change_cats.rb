class ChangeCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :name, :text, null:false
    add_column :cats, :color, :text, null:false
    add_column :cats, :birth_date, :date, null: false
    add_column :cats, :sex, :string, null: false, limit: 2
    add_column :cats, :description, :text
  end
end
