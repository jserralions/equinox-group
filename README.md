# Equinox- Group

Sample APP made on Netguru Workshop with Ruby on Rails, data is based on allrecipes.com.
We use revolution algorithm to collect precious recipes and store them.

### We used:
* Ruby on Rails [4.2.1]
* Ruby [2.1.6]
* Pundit [Role managment gem]
* Devise [Users managment]
* CarrierWave [support Images upload]
* cocoon (has_many_through associations)
* Nokogiri [Collecting data with recipes]
* Elasticsearch [Powerfull searching system]
* SimpleForm

### Also:
* Database - PostgreSQL
* HAML
* Capybara [Integration TEST]
* FactoryGirl (data for testing)
* RSpec for unit Testing
* Bootstrap - layout

### Basic Functionality

1. User
    * log in with Google account
    * Add his own recipes
    * Edit and delete his recipes
2. Search
3. Aggregate many recipes from other sites
   * with our algorith
4. Future
 * User will be able to make his own weekly menu and prepare a shop basket

### Google authentication configuration
In order for authentication to work properly, you need to have access to the Google API. Please add your Google ID and
Secret to the: 

```sh
$ /config/sec_config.yml
```
(a sample is provided)

The Google access information should be of this format:
```ruby
defaults: &defaults
  google_id: $GOOGLE_ID
  google_secret: $SECRET
````

### RSpec Capybara-Webkit Setting

To configure Capybara WebKit use link : https://github.com/thoughtbot/capybara-webkit

##### On Linux Machine:

In order to run app with capybara-webkit gem you need to follow these steps:

Run this command:
```sh
sudo apt-get install qt5-default libqt5webkit5-dev
```
And then:
```sh
sudo apt-get install g++
```


