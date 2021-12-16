# Pokémon TCG SDK

[![Gem Version](https://badge.fury.io/rb/pokemon_tcg_sdk.svg)](https://badge.fury.io/rb/pokemon_tcg_sdk)
![Build Status](https://github.com/PokemonTCG/pokemon-tcg-sdk-ruby/actions/workflows/test.yml/badge.svg)

### Now supporting Version 2 of the Pokémon TCG API!

This is the Pokémon TCG SDK Ruby implementation. It is a wrapper around the Pokémon TCG API of [pokemontcg.io](http://pokemontcg.io/).

## Installation

Add this line to your application's Gemfile:

    gem 'pokemon_tcg_sdk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon_tcg_sdk

## Usage

To configure your API Key:

    Pokemon.configure do |config|
      config.api_key = "xxxxxxxxx"
    end

### Classes

    Card
    Set
    Type
    Supertype
    Subtype
    Ability
    AncientTrait
    Attack
    Resistance
    Weakness
    Legalities
    Rarity
    SetImages
    CardImages
    Tcgplayer

### Properties Per Class

#### Card

    id
    name
    supertype
    subtypes
    level
    hp
    types
    evolves_from
    evolves_to
    rules
    ancient_trait
    abilities
    weaknesses
    resistances
    retreat_cost
    converted_retreat_cost
    set
    number
    artist
    rarity
    national_pokedex_numbers
    legalities
    regulation_mark
    tcgplayer
    cardmarket
    images
    flavor_text

#### Set

    id
    name
    series
    printedTotal
    total
    legalities
    ptcgo_code
    release_date
    updated_at
    images

#### Ability

    name
    text
    type

#### AncientTrait

    name
    text

#### Attack

    cost
    name
    text
    damage
    converted_energy_cost

#### Weakness

    type
    value

#### Resistance

    type
    value

#### CardImages

    small
    large

#### SetImages

    logo
    symbol

### Functions Available

#### Find a card by id

    card = Pokemon::Card.find('xy1-1')

#### Filter Cards via query parameters

    cards = Pokemon::Card.where(q: 'set.name:generations subtypes:mega')
    
#### Find all cards (will take awhile)

    cards = Pokemon::Card.all
    
#### Get all cards, but only a specific page of data

    cards = Pokemon::Card.where(page: 5, pageSize: 100)
    
#### Find a set by code

    set = Pokemon::Set.find('base1')
    
#### Filter sets via query parameters

    sets = Pokemon::Set.where(q: 'legalities.standard:legal')
    
#### Get all Sets

    sets = Pokemon::Set.all
    
#### Get all Types

    types = Pokemon::Type.all

#### Get all Subtypes

    subtypes = Pokemon::Subtype.all

#### Get all Supertypes

    supertypes = Pokemon::Supertype.all

#### Get all Rarities

    supertypes = Pokemon::Rarity.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pokemon-tcg-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
