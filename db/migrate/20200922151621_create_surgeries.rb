class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :weekday
      t.integer :o_r

      t.timestamps
    end
  end
end
