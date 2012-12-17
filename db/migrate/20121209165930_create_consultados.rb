class CreateConsultados < ActiveRecord::Migration
  def change
    create_table :consultados do |t|
      t.string :nome
      t.string :cpf
      t.timestamp :data_nasc
      t.string :nome_mae
      t.string :titulo_eleitor
      t.string :sexo
      t.timestamp :data_obito
      t.string :unidade_adm
      t.string :situacao_cadastral
      t.string :endereco
      t.string :observacoes
      t.string :caminho_foto

      t.timestamps
    end
  end
end
