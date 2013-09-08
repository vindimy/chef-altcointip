name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[zsh]",
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[git]",
  "recipe[build-essential]",
  "recipe[ruby]",
  "recipe[python]"
)

override_attributes(
  :authorization => {
    :sudo => {
      :users => ["ubuntu"],
      :passwordless => true
    }
  },
  :languages => {
    :ruby => {
      :default_version => "1.9.1"
    }
  }
)

