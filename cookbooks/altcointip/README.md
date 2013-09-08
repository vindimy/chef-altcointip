altcointip Cookbook
===================
This cookbook installs and configures Reddit ALTcointip bot. This cookbook does *not* install any required altcoin daemons (such as Bitcoin, Litecoin, etc).

Requirements
------------

#### Cookbooks

  * apache2 (https://github.com/opscode-cookbooks/apache2)
  * database (https://github.com/opscode-cookbooks/database)
  * git (https://github.com/opscode-cookbooks/git)
  * mysql (https://github.com/opscode-cookbooks/mysql)
  * php (https://github.com/opscode-cookbooks/php)
  * phpmyadmin (https://github.com/priestjim/chef-phpmyadmin)
  * python (https://github.com/opscode-cookbooks/python)

Attributes
----------

#### altcointip::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['user']</tt></td>
    <td>String</td>
    <td>Linux user with ownership of ALTcointip directory</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['group']</tt></td>
    <td>String</td>
    <td>Linux group with ownership of ALTcointip directory</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['install_dir']</tt></td>
    <td>String</td>
    <td>Target directory to install ALTcointip into</td>
    <td><tt>/opt</tt></td>
  </tr>
  <tr>
    <td><tt>['mysql_db_name']</tt></td>
    <td>String</td>
    <td>Name of the MySQL database to be created for ALTcointip</td>
    <td><tt>altcointip</tt></td>
  </tr>
  <tr>
    <td><tt>['mysql_username']</tt></td>
    <td>String</td>
    <td>Name of the MySQL user to be created for ALTcointip</td>
    <td><tt>altcointip</tt></td>
  </tr>
  <tr>
    <td><tt>['mysql_password']</tt></td>
    <td>String</td>
    <td>MySQL user's password to be created for ALTcointip</td>
    <td><tt>altcointip123</tt></td>
  </tr>
  <tr>
    <td><tt>['reddit_username']</tt></td>
    <td>String</td>
    <td>Reddit username to be used for Reddit access</td>
    <td><tt>myaltcointip</tt></td>
  </tr>
  <tr>
    <td><tt>['reddit_password']</tt></td>
    <td>String</td>
    <td>Reddit password to be used for Reddit access</td>
    <td><tt>myaltcointip123</tt></td>
  </tr>
  <tr>
    <td><tt>['www_root_dir']</tt></td>
    <td>String</td>
    <td>Root directory to point Apache httpd to. Symlink to phpMyAdmin will be created in it.</td>
    <td><tt>/var/www/altcointip</tt></td>
  </tr>
</table>

Usage
-----
#### altcointip::default

Just include `role[altcointip]` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "role[altcointip]"
  ]
}
```

To reinstall ALTcointip bot or restart a failed installation, delete the `#{node[:altcointip][:install_dir]}/altcointip` directory and run `chef-client`.

License and Authors
-------------------
Authors:

* vindimy (https://github.com/vindimy)
