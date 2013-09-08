# ALTcointip Chef cookbook and role

## Introduction

This repository contains the Chef cookbook and role for ALTcointip, a Reddit altcoin tip bot (https://github.com/vindimy/altcointip). The Chef role `altcointip` leverages Chef cookbook `altcointip` in order to set up a functional ALTcointip install, including basic configuration.

## Cookbook

The `altcointip` cookbook does the following:

* Install Python and `praw` python library
* Install MySQL server and client and set up ALTcointip user, database, and tables
* Install Apache httpd, php, and phpMyAdmin (available at `http://<host>/pma`)
* Clone `ALTcointip`, `pifkoin`, and `pyvircurex` repositories from Github to `/opt/altcointip` and create required symlinks
* Set up basic config at `/opt/altcointip/altcointip/src/config.yml`

For a list of configurable attributes the cookbook provides, see its README.

## Role

The `altcointip` role sets some necessary attributes, such as MySQL bind address and phpMyAdmin version number, then includes the `altcointip` cookbook that does all the work. The role should be used to set `altcointip` cookbook's attributes as necessary. The role should be assigned to host's runlist.
