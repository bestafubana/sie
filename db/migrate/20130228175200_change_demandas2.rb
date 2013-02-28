class ChangeDemandas2 < ActiveRecord::Migration
  def change
    change_table :demandas do |t|
      t.string :nome_consultado
      t.string :cpf_consultado
      t.timestamp :data_nasc_consultado
      t.string :nome_mae_consultado
      t.string :titulo_eleitor_consultado
      t.string :sexo_consultado
      t.timestamp :data_obito_consultado
      t.string :unidade_adm_consultado
      t.string :situacao_cadastral_consultado
      t.string :endereco_consultado
      t.string :observacoes_consultado
      t.remove :consultado_id
      t.remove :contato_id
    end
    drop_table :consultados
  end
  
end
