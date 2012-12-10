class CreateDemandas < ActiveRecord::Migration
  def change
    create_table :demandas do |t|
      t.int :id
      t.timestamp :data
      t.string :uf
      t.string :solicitante
      t.string :departamento
      t.string :resposta
      t.int :carga_horaria
      t.string :caminho_foto
      t.string :caminho_pdf
      t.references :consultado
      t.references :contato
      t.references :tipo_demanda

      t.timestamps
    end
    add_index :demandas, :consultado_id
    add_index :demandas, :contato_id
    add_index :demandas, :tipo_demanda_id
  end
end
