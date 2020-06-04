# ODApi

This is lib to work with the Opendota API

## Usage

  ```
  # Get an array of hero objects
  ODApi.heroes
  ```

  ```
  # Get an array of objects with the history of matches of one of the heroes
  ODApi.matches(hero: hero_id)
  ```
## Tesing

  ```
  cd/spec
  bundle exec rspec odaip_spec.rb
  ```
## Rubocop

  ```
  bundle exec rubocop
  ```
