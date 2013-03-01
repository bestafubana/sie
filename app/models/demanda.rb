class Demanda < ActiveRecord::Base
  has_one :tipo_demanda
  attr_accessible :caminho_foto, 
                  :caminho_pdf, 
                  :carga_horaria, 
                  :data, 
                  :departamento, 
                  :id, 
                  :resposta, 
                  :solicitante, 
                  :uf,
                  :cpf_consultado, 
                  :data_nasc_consultado,
                  :data_obito_consultado,
                  :endereco_consultado,
                  :nome_consultado,
                  :nome_mae_consultado,
                  :observacoes_consultado,
                  :sexo_consultado,
                  :situacao_cadastral_consultado,
                  :titulo_eleitor_consultado,
                  :unidade_adm_consultado,
                  :tipo_demanda
end
