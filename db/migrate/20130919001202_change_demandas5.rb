class ChangeDemandas5 < ActiveRecord::Migration
  def up
    change_table :demandas do |t|
      t.change :nome_consultado, :text
    end
  end

  def down
  end
end
