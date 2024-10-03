class Todos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :done
    end
  end
end
