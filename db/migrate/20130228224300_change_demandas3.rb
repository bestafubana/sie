class ChangeDemandas3 < ActiveRecord::Migration
  def change
    change_table :demandas do |t|
      t.integer :tipo_demanda
      t.remove :tipo_demanda_id
    end
    drop_table :tipo_demandas
  end
  
end
