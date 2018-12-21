class CreateNotecollections < ActiveRecord::Migration[5.1]
  def change
    create_table :notecollections do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
