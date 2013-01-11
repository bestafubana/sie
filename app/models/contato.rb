class Contato < ActiveRecord::Base
  attr_accessible :departamento, :email, :empresa, :id, :nome, :telefone
  
  validates :nome, :telefone, :email, :presence => { :message => "é um campo obrigatório"}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , :message => "está com formato inválido"}, :uniqueness => { :case_sensitive => false } 
  validates :telefone, :numericality => { :message => "é um campo numérico"}
  
end
