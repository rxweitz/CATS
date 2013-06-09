class User < ActiveRecord::Base

  # I'm not sure why this is necessary, but without this the ID ends up as a decimal
  # value instead of an integer.
  def to_param
    contactid.to_i
  end

  # These are required because the CATS naming scheme is different from the standard
  # Rails naming scheme.
  set_table_name 'cats_contact'
  set_primary_key 'contactid'
  set_sequence_name 'cats_contactid'

  #attr_accessible :active, :addcontactid, :adddttm, :address1, :address2, :address3, :approvercontactid, :approverdollars, :cellphone, :city, :contactcode, :contactid, :country, :department, :email, :faxphone, :firstname, :lastname, :locationdetailid, :locked, :managecontactid, :managedttm, :middlename, :mobilityversion, :orderdefaultid, :pagerphone, :password, :passwordchange, :phone, :postalcode, :securityprofileid, :stateprovince, :supervisorcontactid, :title, :url
  attr_accessible :active, :addcontactid, :adddttm, :address1, :address2, :address3, :approvercontactid, :cellphone, :city, :contactcode, :contactid, :country, :department, :email, :faxphone, :firstname, :lastname, :locationdetailid, :locked, :managecontactid, :managedttm, :middlename, :mobilityversion, :orderdefaultid, :pagerphone, :password, :passwordchange, :phone, :postalcode, :securityprofileid, :stateprovince, :supervisorcontactid, :title, :url
end
