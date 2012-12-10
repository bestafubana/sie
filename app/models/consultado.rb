class Consultado < ActiveRecord::Base
  attr_accessible :caminho_foto, :cpf, :data_nasc, :data_obito, :endereco, :id, :nome, :nome_mae, :observacoes, :sexo, :situacao_cadastral, :titulo_eleitor, :unidade_adm
end
