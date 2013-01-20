class Usuario < ActiveRecord::Base
  attr_accessible :id, :login, :passwd
  
  #validate :login, presence=true, uniqueness=true
  validates_length_of :login, :maximum => 30

  #validate :passwd, presence=true
  validates_length_of :passwd, :minimum => 4
  validates_length_of :passwd, :maximum => 30

  before_save do |usuario|
    usuario.passwd = Digest::SHA1.hexdigest(usuario.passwd)
  end

  def authenticate
    Usuario.where(:login => self.login, :passwd => Digest::SHA1.hexdigest(self.passwd)).first
  end

end
