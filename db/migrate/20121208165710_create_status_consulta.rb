class CreateStatusConsulta < ActiveRecord::Migration
  def change
    create_table :status_consulta do |t|
      t.string :nome

      t.timestamps
    end
  end
end
