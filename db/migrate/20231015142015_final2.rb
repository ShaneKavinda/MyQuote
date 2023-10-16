class Final2 < ActiveRecord::Migration[7.0]
  def change
    change_column :philosophers, :phil_deathyr, :date
    change_column :quotes, :pub_yr, :date
    change_column :philosophers, :phil_dob, :date
  end
end
