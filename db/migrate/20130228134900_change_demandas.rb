class ChangeDemandas < ActiveRecord::Migration
  def change
    change_table :demandas do |t|
      t.remove :resposta
      t.timestamp :resposta
    end
  end
end
