module CollaborativeFiltering::Sample
  class << self
    SAMPLE = {
      'Yamada' => {
        'Curry'        => 2.5,
        'Ramen'        => 3.5,
        'Fried rice'   => 3.0,
        'Sushi'        => 3.5,
        'Beef bowl'    => 2.5,
        'Wheat noodle' => 3.0
      },
      'Tanaka' => {
        'Curry'        => 3.0,
        'Ramen'        => 3.5,
        'Fried rice'   => 1.5,
        'Sushi'        => 5.0,
        'Wheat noodle' => 3.0,
        'Beef bowl'    => 3.5
      },
      'Sato' => {
        'Curry'        => 2.5,
        'Ramen'        => 3.0,
        'Sushi'        => 3.5,
        'Wheat noodle' => 4.0
      },
      'Nakamura' => {
        'Ramen'        => 3.5,
        'Fried rice'   => 3.0,
        'Wheat noodle' => 4.5,
        'Sushi'        => 4.0,
        'Beef bowl'    => 2.5
      },
      'Kawamura' => {
        'Curry'        => 3.0,
        'Ramen'        => 4.0,
        'Fried rice'   => 2.0,
        'Sushi'        => 3.0,
        'Wheat noodle' => 3.0,
        'Beef bowl'    => 2.0
      },
      'Suzuki' => {
        'Curry'        => 3.0,
        'Ramen'        => 4.0,
        'Wheat noodle' => 3.0,
        'Sushi'        => 5.0,
        'Beef bowl'    => 3.5
      },
      'Shimobayashi' => {
        'Ramen'        => 4.5,
        'Beef bowl'    => 1.0,
        'Sushi'        => 4.0
      }
    }

    def show_sample_data
      p SAMPLE
    end

    def all_sample
      puts %(
        //////////////////////////////////////////////////////////////
        // this source exists lib/collaborative_filtering/sample.rb //
        //////////////////////////////////////////////////////////////
      )
      show_sample_data
      sim_distance
      sim_pearson
      top_matches
      get_recommendations
      transform_prefs
    end

    def sim_distance
      puts "write like this -> CollaborativeFiltering.sim_distance(SAMPLE, 'Yamada', 'Tanaka')"
      p CollaborativeFiltering.sim_distance(SAMPLE, 'Yamada', 'Tanaka')
    end

    def sim_pearson
      puts "write like this -> CollaborativeFiltering.sim_pearson(SAMPLE, 'Yamada', 'Tanaka')"
      p CollaborativeFiltering.sim_pearson(SAMPLE, 'Yamada', 'Tanaka')
    end

    def top_matches
      puts "write like this -> CollaborativeFiltering.top_matches(SAMPLE, 'Shimobayashi')"
      p CollaborativeFiltering.top_matches(SAMPLE, 'Shimobayashi')
    end

    def get_recommendations
      puts "write like this -> CollaborativeFiltering.get_recommendations(SAMPLE, 'Shimobayashi')"
      p CollaborativeFiltering.get_recommendations(SAMPLE, 'Shimobayashi')
    end

    def transform_prefs
      puts "write like this -> menu = CollaborativeFiltering.transform_prefs(SAMPLE)"
      puts "write like this -> CollaborativeFiltering.top_matches(menu, 'Sushi')"
      menu = CollaborativeFiltering.transform_prefs(SAMPLE)
      p CollaborativeFiltering.top_matches(menu, 'Sushi')
    end
  end
end
