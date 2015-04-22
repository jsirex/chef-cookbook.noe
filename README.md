# Noe template for Chef Cookbooks

This project provides a [Noe](https://github.com/blambeau/noe) template for creating a
[chef cookbook](http://chef.io).

# Template overview

This template generates very basic cookbook with typical skeleton files.
Pay attention that is not depend and not use *ChefDK*.

## Standard files and folders

Generated cookbook ships with:

* **attributes/default.rb**
* **files/default/**
* **recipes/default.rb**
* **templates/default/**
* **metadata.rb**
* **LICENSE**

## Documentation

There are no **README.md** file in template. This cookbook uses [knife-cookbook-doc](https://github.com/realityforge/knife-cookbook-doc) plugin for README generation.

Generated cookbook ships with:

* **doc** - directory where you can store all documentation, pictures, etc
* **doc/overview.md** - replaces first description section of your generated README.md

This plugins also supports in-line documentation, which will be stored in readme, but its format currently is really bad for rubocop. I hope, it will be fixed soon.
Now I'm skipping any in-line documentation in knife-cookbook-doc format.

## Chef Spec

Generated cookbook ships with:

* **spec/spec_helper.rb** - default configuration for ChefSpec and coverage
* **spec/default_spec.rb** - sample spec test

It also recognises **spec/support/** directory where you can store additional libraries, methods, etc

## Integration Tests with Test-Kitchen

Generated cookbook ships with:

* **test/fixtures/cookbooks/** - folder where you can store you test-cookbooks
* **test/integration/default/serverspec/default_spec.rb** - sample serverspec spec test for your test-kitchen
* **.kitchen.yml** - default settings using Vagrant with VirtualBox
* **.kitchen.docker.yml** - additional sample configuration which can be copied to **.kitchen.local.yml**

### Using test-cookbooks

Please note that you must add your test cookbook to **Berksfile** so kitchen will be able to load it:

    # Berksfile
    ....

    group :integration do
      cookbook 'my-cookbook-test', path: 'test/fixtures/cookbooks/my-cookbook-test'
    end

## Ignore files

Generated cookbook ships with:

* **.gitignore**
* **chefignore**

## Rubocop config

Generated cookbook ships with:

* **.rubocop.yml**

If you don't use it - your code will look like a crap.

## Berksfile

Of course, you must have this file. Thats all.

## Gemfile

Gemfile helps you to manage all gems your are using, including chef tools. I'm still not using *ChefDK* because I think it is not flixeble enough for me.
I want to develop cookbook standalone as single piece of software.

## Rakefile

This is very basic file with some generic functionality. You have two major groups of tasks:

* **quick** - runs *rubocop*, *foodcritic*, *chefspec*
* **complete** - runs *quick*, *kitchen integration tests*

TODO: Need a nice way to perform another standard processes like: *release*, *upload*, *publish*, *doc generate*, etc...


# FAQ

## Why I should use this template?

You shouldn't! Go on:

* Fork and create your best template
* Change template name and version
* Copy new template into *~/.noe* folder
* Use it

But this one is a good start for you.

## Another way to generate cookbooks?

There are many tools already exists which can generate cookbook:

* Berkshelf
* Chef DK
* Knife cookbook
* etc

But all of them have weakness:

* It is hard to customize original template
* It is hard to update existing cookbook. Especially, when you have an organization with bunch of cookbooks sharing the same template
* It is hard (or not possible at all) to parametrize this generation.

Chef community has been started to develop something for Chef DK. But why to not use already existing solutions?

# Install

* You'll need Noe to use this template, see: https://github.com/blambeau/noe
* You'll also need bundler, see http://bundler.io
* Copy the whole folder in your noe skeleton folder (defaults to ~/.noe)

In other words

    [sudo] gem install noe bundler
    git clone https://github.com/jsirex/chef-cookbook.noe.git ~/.noe/chef-cookbook

## Creating new cookbook

    # Prepare generation
    noe prepare --template=chef-cookbook my-cookbook
    cd my-cookbook

    # Edit specific information about your cookbook
    edit my-cookbook.noespec

    # Let Noe generate your project
    noe go

    # Install your ruby dependencies
    bundle install

    # Install required cookbooks
    berks install

    # Try it via tests
    rake

    # If you are ready for kitchen tests
    rake kitchen:all

## Short layout

Instead of generating full noespec for project you can use short one:

    noe prepare --template=chef-cookbook --layout=short my-cookbook

## Updating cookbook

You can also easily update your cookbook from template by regenerating files.

### Force override all

    noe go --force # force override all files from template

### Regenerate only few files

    rm few files
    noe go --add-only # add from template only files that don't exist in directory

### Preferred way: safe-override

    noe go --safe-override # trust your template creator which files safe to override automatically

**Pay attention**: by default the following files will be overrided with safe-override:

* **spec/spec_helper.rb**
* **.gitignore**
* **.kitchen.docker.yml**
* **.rubocop.yml**
* **Gemfile**
* **Rakefile**
* **chefignore**

They marked as *safe-override* because they are rarely requires modifying. You can change this behavior in your cookbook noespec.

### Regenerating noespec itself

If template has big changes in specification (noespec file) you can easily regenerate spec:

    # from cookbook directory
    noe prepare --template=chef-cookbook --layout=short --force

Backup/commit your file before applying this command and you can compare differences.

## Noe

Read more about at [noe home page](http://revision-zero.org/noe)
