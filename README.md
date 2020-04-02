# 😷 Sarskov

Sarskov returns JSON formated statistics on COVID-19.


## Installation

Add this line to your application's Gemfile: `gem 'sarskov'`. And then execute: `bundle install`. Or install it yourself as: `gem install sarskov`.

## Usage
### FETCHING
🧫 Fetching country data

```ruby
Sarskov::Request.check("ghana")
```
returns:

```json
{
  "country": "Ghana",
  "countryInfo": {
    "_id": 288,
    "iso2": "GH",
    "iso3": "GHA",
    "lat": 8,
    "long": -2,
    "flag": "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/gh.png"
  },
  "cases": 195,
  "todayCases": 0,
  "deaths": 5,
  "todayDeaths": 0,
  "recovered": 31,
  "active": 159,
  "critical": 1,
  "casesPerOneMillion": 6,
  "deathsPerOneMillion": 0.2,
  "updated": 1585805640451
}
```

🧫 Fetch world stats:

```ruby
Sarskov::Request.world
```
returns:

```json
{
  "cases": 955136,
  "deaths": 48578,
  "recovered": 203011,
  "updated": 1585831890796,
  "active": 703547,
  "affectedCountries": 205
}
```

🧫 Fetch Fetch aggregated data on Africa (all 57 states):

```ruby
Sarskov::Request.africa
```
returns:

```json
{
  "cases": 6547,
  "todayCases": 164,
  "deaths": 244,
  "todayDeaths": 8,
  "recovered": 524,
  "active": 5779,
  "critical": 30,
  "casesPerOneMillion": 520.4,
  "deathsPerOneMillion": 15.7,
  "updated": 77706080976400
}
```

🧫 Fetch Fetch aggregated data on Europe (all 45 states):

```ruby
Sarskov::Request.europe
```
returns:

```json
{
  "cases": 507309,
  "todayCases": 20179,
  "deaths": 35362,
  "todayDeaths": 1716,
  "recovered": 85480,
  "active": 386467,
  "critical": 24246,
  "casesPerOneMillion": 49194,
  "deathsPerOneMillion": 2054.3,
  "updated": 68191050652346
}
```


🧫 Fetch aggregated data on The EU (all 28 states):
```ruby
Sarskov::Request.eu
```
returns:

```json
{
  "cases": 426951,
  "todayCases": 0,
  "deaths": 30612,
  "todayDeaths": 0,
  "recovered": 75010,
  "active": 321329,
  "critical": 23062,
  "casesPerOneMillion": 18769,
  "deathsPerOneMillion": 813.2,
  "updated": 42816752292016
}
```

🧫 Fetch Fetch aggregated data on Asia (all 53 states):
```ruby
Sarskov::Request.asia
```
returns:

```json
{
  "cases": 191871,
  "todayCases": 5005,
  "deaths": 7602,
  "todayDeaths": 188,
  "recovered": 103818,
  "active": 80451,
  "critical": 5942,
  "casesPerOneMillion": 4077.5000000000005,
  "deathsPerOneMillion": 68.96000000000001,
  "updated": 71362727427057
}
```

🧫 Fetch Fetch aggregated data on South America (all 15 states):
```ruby
Sarskov::Request.sa
```
returns:

```json
{
  "cases": 16212,
  "todayCases": 512,
  "deaths": 444,
  "todayDeaths": 22,
  "recovered": 1075,
  "active": 14693,
  "critical": 548,
  "casesPerOneMillion": 757,
  "deathsPerOneMillion": 15.700000000000001,
  "updated": 17444222259947
}
```


🧫 Fetching state data 🇺🇸
```ruby
Sarskov::Request.state("ohio")
```
returns:

```json
{
  "state": "Ohio",
  "cases": 2547,
  "todayCases": 0,
  "deaths": 65,
  "todayDeaths": 0,
  "active": 2482
}
```

### COMPARING
🧫 Country Comparison
```ruby
Sarskov::Request.compare_countries("poland", "ghana", "iran")
```
returns an array of hashes sorted in DESC of number of cases:

```json
[
  {
    "country": "Iran",
    "countryInfo": {
      "_id": 364,
      "iso2": "IR",
      "iso3": "IRN",
      "lat": 32,
      "long": 53,
      "flag": "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/ir.png"
    },
    "cases": 47593,
    "todayCases": 0,
    "deaths": 3036,
    "todayDeaths": 0,
    "recovered": 15473,
    "active": 29084,
    "critical": 3871,
    "casesPerOneMillion": 567,
    "deathsPerOneMillion": 36,
    "updated": 1585805640441
  },
  {
    "country": "Poland",
    "countryInfo": {
      "_id": 616,
      "iso2": "PL",
      "iso3": "POL",
      "lat": 52,
      "long": 20,
      "flag": "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/pl.png"
    },
    "cases": 2554,
    "todayCases": 0,
    "deaths": 43,
    "todayDeaths": 0,
    "recovered": 56,
    "active": 2455,
    "critical": 50,
    "casesPerOneMillion": 67,
    "deathsPerOneMillion": 1,
    "updated": 1585805640443
  },
  {
    "country": "Ghana",
    "countryInfo": {
      "_id": 288,
      "iso2": "GH",
      "iso3": "GHA",
      "lat": 8,
      "long": -2,
      "flag": "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/gh.png"
    },
    "cases": 195,
    "todayCases": 0,
    "deaths": 5,
    "todayDeaths": 0,
    "recovered": 31,
    "active": 159,
    "critical": 1,
    "casesPerOneMillion": 6,
    "deathsPerOneMillion": 0.2,
    "updated": 1585805640451
  }
]
```

🧫 State Comparison
```ruby
Sarskov::Request.compare_states("maryland", "ohio")
```
returns:

```json
[
  {
    "state": "Ohio",
    "cases": 2547,
    "todayCases": 0,
    "deaths": 65,
    "todayDeaths": 0,
    "active": 2482
  },
  {
    "state": "Maryland",
    "cases": 1985,
    "todayCases": 0,
    "deaths": 31,
    "todayDeaths": 0,
    "active": 1885
  }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siaw23/sarskov. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/siaw23/sarskov/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sarskov project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/siaw23/sarskov/blob/master/CODE_OF_CONDUCT.md).
