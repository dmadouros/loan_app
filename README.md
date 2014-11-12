# Getting Started

## Ruby Version
2.1.3

## RVM Gemset
loan

## Database creation

### Create Development and Test Databases and App User
```
$ psql
> create database loaner_development;
> create database loaner_test;
> create user loaner_user with password '';
> grant all privileges on database loaner_development to loaner_user;
> grant all privileges on database loaner_test to loaner_user;
> alter role loaner_user with createdb;
> alter database loaner_development owner to loaner_user;
> alter database loaner_test owner to loaner_user;
> \q
```

### Database Initialization
```
$ rake db:drop db:create db:migrate db:seed
```


