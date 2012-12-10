class Demanda < ActiveRecord::Base
  belongs_to :consultado
  belongs_to :contato
  attr_accessible :caminho_foto, :caminho_pdf, :carga_horaria, :data, :departamento, :id, :resposta, :solicitante, :uf
end
