class CreateSiritoris < ActiveRecord::Migration[6.0]
  def change
    create_table :siritoris do |t|
      t.string :word
      t.float :score

      t.timestamps
    end
  end
end
