class Photo < ActiveLdap::Base
  ldap_mapping dn_attribute: "cn",
               prefix: "ou=photos"
end
