class FinalCorrections < ActiveRecord::Migration[7.0]
  def change
    change_column (:philosophers, :phil_deathyr, :date)
    change_column (:quotes, :pub_yr, :date)
    change_column_null :philosophers, :phil_bio, true
  end
end
