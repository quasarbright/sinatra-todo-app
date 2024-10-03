class TodoUser < ActiveRecord::Migration[7.2]
  def change
    change_table :todos do |t|
      t.string :username
    end
  end
end
