class LdapUser < ActiveLdap::Base
  ldap_mapping :dn_attribute => 'inriaLogin',
               :prefix => 'ou=people', 
               :classes => ['top', 'inriaPerson'],
               :scope => :sub
end
