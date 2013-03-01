class Consultado < ActiveRecord::Base
  attr_accessible :caminho_foto,
                  :cpf, 
                  :data_nasc,
                  :data_obito,
                  :endereco,
                  :id,
                  :nome,
                  :nome_mae,
                  :observacoes,
                  :sexo,
                  :situacao_cadastral,
                  :titulo_eleitor,
                  :unidade_adm


  has_attachment :content_type=>:image, :storage=> :file_system, :max_size=>1000.kilobytes, :rezise_to=>’120x150’, :thumbnails=>{:thumb=>’60x75’}
  validates_as_attachment
end
