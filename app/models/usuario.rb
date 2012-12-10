class Usuario < ActiveRecord::Base
  attr_accessible :id, :login, :passwd
end
