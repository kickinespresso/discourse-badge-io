### discourse-badge-io


This discourse plugin allows you to export, import (Add) and remove badges from users using a CSV List. Sample CSV Lists are provided. 

## Author - @kickinespresso [www.kickinespresso.com](http://www.kickinespresso.com)


## Usage


### Exporting (Listing User Badges)

Run the rake task as the following `rake export_user_badges <export_file_name>`

	rake export_user_badges user_bagdes.csv

The resulting CSV file gives you a column of users by their emails and a list of the badges associated with that user.

![Export User Badge Example](https://raw.githubusercontent.com/kickinespresso/discourse/master/export.png)


### Importing (Adding Badges to Users)

The CSV file should follow the same format as the exported CSV. Add the new Badge to the list of badges for the user(s) you intead to add the badge to. In the screenshot below, note the new badge in RED. **Please note that the new badge maintains a COMMA and SPACE after the previous badge keeping the format consistent.** The badge name MUST be exact and is Case Senstive. 

![Import User Badge Example](https://raw.githubusercontent.com/kickinespresso/discourse/master/import.png)

When your import file is setup, tun the rake task as the following `rake import_user_badges <path/import_file_name>`


	rake import_user_badges user_bagdes.csv

This will add a any user badge to a user that user does not already have. It **WILL NOT** remove any badges.

### Removing Badges (Deleting Badges from Users)


To remove a user badge, provide a CSV with one column of the emails you wish to remove user badges from. 

![Remove User Badge Example](https://raw.githubusercontent.com/kickinespresso/discourse/master/import.png)


When your import file is setup, tun the rake task as the following `rake remove_user_badges <path/import_file_name> <badge_name>` including the path to the list of user emails and the name of the badge to be removed.

	rake remove_user_badges user_bagdes.csv Editor


## Installation

Follow our [Install a Plugin](https://meta.discourse.org/t/install-a-plugin/19157) howto, using
`git clone https://github.com/kickinespresso/discourse-badge-io.git` as the plugin command.



## Other Installation

There are two sets of installation instructions:

1. Non-Docker Installation - If you have experience with programming.  This will set up this plugin as a git submodule in your Discourse directory.
2. Local Development - If you want develop locally and have experience with programming.  This will set up this plugin as a symlinked file in Discourse's plugin directory.

If you already have a live Discourse forum up, please go to the Quick Start heading above.


### 1. Non-docker installation


* Run `bundle exec rake plugin:install repo=http://github.com/kickinespresso/discourse-badge-io` in your discourse directory
* In development mode, run `bundle exec rake assets:clean`
* In production, recompile your assets: `bundle exec rake assets:precompile`
* Restart Discourse


### 2. Local Development Installation


* Clone the [Discourse Badge IO Repo](http://github.com/kickinespresso/discourse-badge-io) in a new local folder.
* Separately clone [Discourse Forum](https://github.com/discourse/discourse) in another local folder and [install Discourse](https://meta.discourse.org/t/beginners-guide-to-install-discourse-on-ubuntu-for-development/14727).
* In your terminal, go into Discourse folder navigate into the plugins folder.  Example ```cd ~/code/discourse/plugins```
* Create a symlink in this folder by typing the following into your terminal
:
```
ln -s ~/whereever_your_cloned_ad_plugin_path_is .
For example: ln -s ~/discourse-plugin-test .
```
* You can now make changes in your locally held Discourse Badge Io folder and see the effect of your changes when your run ```rails s``` in your locally held Discourse Forum files.


## Issues

If you have issues or suggestions for the plugin, please bring them up on [Discourse Meta](https://meta.discourse.org).

## License

MIT
