# CollaborativeFiltering

[![Build Status](https://travis-ci.org/8398a7/collaborative_filtering.svg?branch=master)](https://travis-ci.org/8398a7/collaborative_filtering)
[![Gem Version](https://badge.fury.io/rb/collaborative_filtering.svg)](http://badge.fury.io/rb/collaborative_filtering)
[![Code Climate](https://codeclimate.com/github/8398a7/collaborative_filtering/badges/gpa.svg)](https://codeclimate.com/github/8398a7/collaborative_filtering)
[![Coverage Status](https://coveralls.io/repos/8398a7/collaborative_filtering/badge.svg?branch=master)](https://coveralls.io/r/8398a7/collaborative_filtering?branch=master)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/collaborative_filtering`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collaborative_filtering'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collaborative_filtering

## Usage

```ruby
require 'collaborative_filtering'

CollaborativeFiltering.all_sample
```

```
        //////////////////////////////////////////////////////////////
        // this source exists lib/collaborative_filtering/sample.rb //
        //////////////////////////////////////////////////////////////
      
{
    "Yamada"=>{"Curry"=>2.5, "Ramen"=>3.5, "Fried rice"=>3.0, "Sushi"=>3.5, "Beef bowl"=>2.5, "Wheat noodle"=>3.0},        
    "Tanaka"=>{"Curry"=>3.0, "Ramen"=>3.5, "Fried rice"=>1.5, "Sushi"=>5.0, "Wheat noodle"=>3.0, "Beef bowl"=>3.5}, 
    "Sato"=>{"Curry"=>2.5, "Ramen"=>3.0, "Sushi"=>3.5, "Wheat noodle"=>4.0},
    "Nakamura"=>{"Ramen"=>3.5, "Fried rice"=>3.0, "Wheat noodle"=>4.5, "Sushi"=>4.0, "Beef bowl"=>2.5}, 
    "Kawamura"=>{"Curry"=>3.0, "Ramen"=>4.0, "Fried rice"=>2.0, "Sushi"=>3.0, "Wheat noodle"=>3.0, "Beef bowl"=>2.0}, 
    "Suzuki"=>{"Curry"=>3.0, "Ramen"=>4.0, "Wheat noodle"=>3.0, "Sushi"=>5.0, "Beef bowl"=>3.5}, 
    "Shimobayashi"=>{"Ramen"=>4.5, "Beef bowl"=>1.0, "Sushi"=>4.0}
}

write like this -> CollaborativeFiltering.sim_distance(SAMPLE, 'Yamada', 'Tanaka')
0.14814814814814814

write like this -> CollaborativeFiltering.sim_pearson(SAMPLE, 'Yamada', 'Tanaka')
0.39605901719066977

write like this -> CollaborativeFiltering.top_matches(SAMPLE, 'Shimobayashi')
[[0.9912407071619299, "Yamada"], [0.9244734516419049, "Kawamura"], [0.8934051474415647, "Nakamura"], [0.66284898035987, "Suzuki"], [0.38124642583151164, "Tanaka"]]

write like this -> CollaborativeFiltering.get_recommendations(SAMPLE, 'Shimobayashi')
[[3.3477895267131017, "Wheat noodle"], [2.8325499182641614, "Curry"], [2.530980703765565, "Fried rice"]]

write like this -> menu = CollaborativeFiltering.transform_prefs(SAMPLE)
write like this -> CollaborativeFiltering.top_matches(menu, 'Sushi')
[[0.6579516949597695, "Beef bowl"], [0.4879500364742689, "Curry"], [0.11180339887498941, "Ramen"], [-0.1798471947990544, "Wheat noodle"], [-0.42289003161103106, "Fried rice"]]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/8398a7/collaborative_filtering/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
