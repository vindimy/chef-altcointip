# ALTcointip Chef cookbook and role

## Introduction

This repository contains the Chef cookbook and role for **[ALTcointip](https://github.com/vindimy/altcointip)**, the Reddit altcoin tip bot. The Chef role `altcointip` leverages Chef cookbook `altcointip` to set up a functional ALTcointip installation, including basic configuration. However, the cookbook does *not* set up Bitcoin, Litecoin, or other altcoin daemons required for tipping functionality.

## Cookbook

The `altcointip` cookbook does the following:

* Install Python and `praw` python library
* Install MySQL server and client and set up ALTcointip user, database, and tables
* Install Apache httpd, php, and phpMyAdmin (available at `http://<host>/pma`)
* Clone `ALTcointip`, `pifkoin`, and `pyvircurex` repositories from Github to `/opt/altcointip` and create required symlinks
* Set up basic config at `/opt/altcointip/altcointip/src/config.yml`

The cookbook does *not*:

* Install and configure Bitcoin, Litecoin, or any other altcoin
* Manage the `config.yml` file, beyond initial install

For a list of configurable attributes the cookbook provides, see its [README](cookbooks/altcointip/README.md).

## Role

The `altcointip` role sets some necessary attributes, such as MySQL bind address and phpMyAdmin version number, then includes the `altcointip` cookbook that does all the work. The role should be used to set `altcointip` cookbook's attributes as necessary. The role should be assigned to host's runlist.
