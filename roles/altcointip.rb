name 'altcointip'
description 'Role to set up altcointip, Reddit altcoin tip bot'

default_attributes(
  :mysql => {
    :bind_address => '127.0.0.1',
    :tunable => {
      :wait_timeout => 3600
    }
  },
  :phpmyadmin => {
    :fpm => false
  },
  :altcointip => {
    # Use this section to control cryptocoin installation
    # as well as add cryptocoins not defined in the cookbook
    :cryptocoins => {
      :bitcoin => {
        :enabled => true
      },
      :litecoin => {
        :enabled => true
      },
      :namecoin => {
        :enabled => true
      },
      :ppcoin => {
        :enabled => true
      },
      :primecoin => {
        :enabled => true
      }
    },
    # Use this section to control cron jobs
    :cron => {
      :stats => {
        :enabled => false
      },
      :backup_config => {
        :enabled => true
      },
      :backup_db => {
        :enabled => true
      },
      :backup_wallets => {
        :enabled => true
      }
    }
  }
)

run_list(
  'recipe[altcointip::default]',
  'recipe[altcointip::phpmyadmin]'
)
