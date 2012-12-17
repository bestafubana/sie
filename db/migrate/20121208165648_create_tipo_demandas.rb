class CreateTipoDemandas < ActiveRecord::Migration
  def change
    create_table :tipo_demandas do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
