name "altcointip"
description "Role to set up altcointip, Reddit altcoin tip bot"

default_attributes(
  "mysql" => {
    "bind_address" => "127.0.0.1",
    "tunable" => {
      "wait_timeout" => "3600"
    }
  },
  "phpmyadmin" => {
    "version" => "4.0.6",
    "checksum" => "b7adf5c7a4366168fa1d921ab9920f33c604a5c3d1039a91785892457f00f47f",
    "fpm" => false
  }
)

run_list(
  "recipe[altcointip::default]",
  "recipe[altcointip::coins]"
)
