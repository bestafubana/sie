class Contato < ActiveRecord::Base
  attr_accessible :departamento, :email, :empresa, :id, :nome, :telefone
  
  validates :nome, :telefone, :email, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :uniqueness => { :case_sensitive => false } 
  validates :telefone, :numericality => true
  
end
