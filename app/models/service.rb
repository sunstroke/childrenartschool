class Service < ActiveRecord::Base
    audited
  belongs_to :user

  attr_accessible :provider, :uid, :uname, :uemail
end
