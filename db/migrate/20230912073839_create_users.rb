class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.string :status
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
