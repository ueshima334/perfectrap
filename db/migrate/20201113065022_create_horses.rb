class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|

      t.timestamps
      t.string :name,null: false
      t.integer :horsegender_id,null: false
      t.integer :age_id,null: false
    end
  end
end
