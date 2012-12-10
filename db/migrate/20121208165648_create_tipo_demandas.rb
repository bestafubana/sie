class CreateTipoDemandas < ActiveRecord::Migration
  def change
    create_table :tipo_demandas do |t|
      t.int :id
      t.string :tipo

      t.timestamps
    end
  end
end
