# httpd information

default[:altcointip][:www_root_dir] = "/opt/altcointip/www"


# phpMyAdmin information

default[:altcointip][:phpmyadmin] = {
  :version => "4.0.6",
  :checksum => "b7adf5c7a4366168fa1d921ab9920f33c604a5c3d1039a91785892457f00f47f",
  :fpm => false
}

