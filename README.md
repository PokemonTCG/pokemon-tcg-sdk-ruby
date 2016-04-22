# Pokémon TCG SDK

[![Gem Version](https://badge.fury.io/rb/pokemon_tcg_sdk.svg)](https://badge.fury.io/rb/pokemon_tcg_sdk)
[![Build Status](https://travis-ci.org/PokemonTCG/pokemon-tcg-sdk-ruby.svg?branch=master)](https://travis-ci.org/PokemonTCG/pokemon-tcg-sdk-ruby)
[![Dependency Status](https://gemnasium.com/badges/github.com/PokemonTCG/pokemon-tcg-sdk-ruby.svg)](https://gemnasium.com/github.com/PokemonTCG/pokemon-tcg-sdk-ruby)
[![Code Climate](https://codeclimate.com/github/PokemonTCG/pokemon-tcg-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/PokemonTCG/pokemon-tcg-sdk-ruby)
[![Test Coverage](https://codeclimate.com/github/PokemonTCG/pokemon-tcg-sdk-ruby/badges/coverage.svg)](https://codeclimate.com/github/PokemonTCG/pokemon-tcg-sdk-ruby/coverage)

This is the Pokémon TCG SDK Ruby implementation. It is a wrapper around the Pokémon TCG API of [pokemontcg.io](http://pokemontcg.io/).

## Installation

Add this line to your application's Gemfile:

    gem 'pokemon_tcg_sdk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon_tcg_sdk

## Usage

To change the API version (currently defaults to version 1)

    Pokemon.configure do |config|
      config.api_version = 2
    end

### Classes

    Card
    Set
    Type
    Supertype
    Subtype
    Ability
    Attack
    TypeValue

### Properties Per Class

#### Card

    id
    name
    image_url
    subtype
    supertype
    ability
    hp
    number
    artist
    rarity
    series
    set
    set_code
    retreat_cost
    text
    types
    attacks
    weaknesses
    resistances

#### Set

    code
    name
    series
    total_cards
    standard_legal
    release_date

#### Ability

    name
    text

#### Attack

    cost
    name
    text
    damage
    converted_energy_cost

#### TypeValue

    type
    value

### Functions Available

#### Find a card by id

    card = Pokemon::Card.find('xy1-1')

#### Filter Cards via query parameters

    cards = Pokemon::Card.where(set: 'generations').where(supertype: 'pokemon').all
    
#### Find all cards (will take awhile)

    cards = Pokemon::Card.all
    
#### Get all cards, but only a specific page of data

    cards = Pokemon::Card.where(page: 5).where(pageSize: 100).all
    
#### Find a set by code

    set = Pokemon::Set.find('base1')
    
#### Filter sets via query parameters

    sets = Pokemon::Set.where(standardLegal: true).all
    
#### Get all Sets

    sets = Pokemon::Set.all
    
#### Get all Types

    types = Pokemon::Type.all

#### Get all Subtypes

    subtypes = Pokemon::Subtype.all

#### Get all Supertypes

    supertypes = Pokemon::Supertype.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pokemon-tcg-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
