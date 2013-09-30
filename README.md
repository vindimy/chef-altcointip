# ALTcointip Chef cookbook and role

## Introduction

This repository contains the Chef cookbook and role for **[ALTcointip](https://github.com/vindimy/altcointip)**, the Reddit altcoin tip bot. The Chef role `altcointip` leverages Chef cookbook `altcointip` to set up a functional ALTcointip installation, including basic configuration, database, and cryptocoins.

## Cookbook

The `altcointip::default` recipe does the following:

* Install Python and required libraries
* Clone `ALTcointip`, `pifkoin`, and `pyvircurex` repositories from Github to `/opt/altcointip` and create required symlinks
* Set up basic config at `/opt/altcointip/altcointip/src/config.yml`
* Install and configure Bitcoin, Litecoin, or any other altcoin as defined by Chef attributes

The `altcointip::database` recipe does the following:

* Install MySQL server and client and set up ALTcointip user, database, and tables

The `altcointip::phpmyadmin` recipe does the following:

* Install Apache httpd, php, and phpMyAdmin (available at `http://<host>/pma`)

The `altcointip` cookbook does *not*:

* Manage the `config.yml` file, beyond initial install

For a list of configurable attributes the cookbook provides, see its [README](cookbooks/altcointip/README.md).

## Role

The `altcointip` role sets some necessary attributes, such as MySQL bind address and phpMyAdmin version number, then includes the `altcointip::default` and `altcointip::phpmyadmin` recipes that do all the work. The role should be modified by *you* to set `altcointip` cookbook's attributes as necessary. The role should be assigned to host's runlist.
