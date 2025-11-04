# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Description

This a full default install of Rails 8.

## Additional Features

The following addition features have been add to the Rails 8 full base install:

## Gems
  slim 
  slim_lint


## Configuration

### Dev Containers

This Rails application is intented to be used with Dev Containers.

[Getting Started with Dev Containers](https://guides.rubyonrails.org/getting_started_with_devcontainer.html)

### Direnv
Several ENV variable neccessary to run this project in Docker are loaded via 
Direnv. Direnv allows you to dynamically load ENV variables into your shell environment
relative to your current path. If you change to a directory with a ```.envrc```,
direnv will load those variables into your shell and remove them when you change
directories out of that directories path. 

**MacOS Install:**
```bash 
brew install direnv
``` 

**Ubuntu Install:**
```bash 
sudo apt install direnv
```

**Windows WSL2 Linux Install:**
From Linux Distro (ex. Ubuntu-20.04):
```bash
sudo apt install direnv
```

From PowerShell:
```powershell
wsl sudo apt install direnv
```

Copy the ```.envrc.example``` file:
```bash 
cp .envrc.example .envrc
```

You may have to add the direnv hook to your shell confirguration file. 

Add the direnv hook to bash:
```bash 
direnv hook bash >> `echo $HOME`/.bashrc
```

Enter the proper values into your local ```.envrc``` file.  Git will ignore this
file and not check the values into the repo.

Activate the ```.envrc``` file by typing:
```bash
direnv allow
```