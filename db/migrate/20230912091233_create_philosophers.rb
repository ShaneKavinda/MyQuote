class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :phil_fname, null:false
      t.string :phil_lname, null:false
      t.datetime :phil_dob, null:false
      t.datetime :phil_deathyr
      t.text :phil_bio, null:false

      t.timestamps
    end
  end
end
