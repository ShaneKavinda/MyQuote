class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :quote_text, null:false
      t.datetime :pub_yr
      t.text :owner_comment
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
