class TipoDemanda < ActiveRecord::Base
  belongs_to :demanda
  attr_accessible :id, :tipo
end
