class ChangeDemandas4 < ActiveRecord::Migration
  def change
    change_table :demandas do |t|
      t.string :foto
    end
  end
  
end