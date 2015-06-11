require 'spec_helper'

describe CollaborativeFiltering do
  TEST_DATA = {
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

  it 'has a version number' do
    expect(CollaborativeFiltering::VERSION).not_to be nil
  end

  it 'all sample' do
    ret = [[0.6579516949597695, 'Beef bowl'], [0.4879500364742689, 'Curry'], [0.11180339887498941, 'Ramen'], [-0.1798471947990544, 'Wheat noodle'], [-0.42289003161103106, 'Fried rice']]
    expect(CollaborativeFiltering::Sample.all_sample).to match ret

  end

  it "the degree of similarity 'Yamada' and 'Tanaka' (distance)" do
    expect(CollaborativeFiltering.sim_distance(TEST_DATA, 'Yamada', 'Tanaka')).to be 0.14814814814814814
    expect(CollaborativeFiltering::Sample.sim_distance).to be 0.14814814814814814
  end
  it "the degree of similarity 'Yamada' and 'Tanaka' (pearson)" do
    expect(CollaborativeFiltering.sim_pearson(TEST_DATA, 'Yamada', 'Tanaka')).to be 0.39605901719066977
    expect(CollaborativeFiltering::Sample.sim_pearson).to be 0.39605901719066977
  end

  it 'users who are similar to Shimobayashi' do
    ret = [[0.9912407071619299, 'Yamada'], [0.9244734516419049, 'Kawamura'], [0.8934051474415647, 'Nakamura'], [0.66284898035987, 'Suzuki'], [0.38124642583151164, 'Tanaka']]
    expect(CollaborativeFiltering.top_matches(TEST_DATA, 'Shimobayashi')).to match ret
    expect(CollaborativeFiltering::Sample.top_matches).to match ret
  end

  it 'the menu of recommended for Shimobayashi' do
    ret = [[3.3477895267131017, 'Wheat noodle'], [2.8325499182641614, 'Curry'], [2.530980703765565, 'Fried rice']]
    expect(CollaborativeFiltering.get_recommendations(TEST_DATA, 'Shimobayashi')).to match ret
    expect(CollaborativeFiltering::Sample.get_recommendations).to match ret
  end

  it 'the menu which is similar to Sushi' do
    ret = [[0.6579516949597695, 'Beef bowl'], [0.4879500364742689, 'Curry'], [0.11180339887498941, 'Ramen'], [-0.1798471947990544, 'Wheat noodle'], [-0.42289003161103106, 'Fried rice']]
    menu = CollaborativeFiltering.transform_prefs(TEST_DATA)
    expect(CollaborativeFiltering.top_matches(menu, 'Sushi')).to match ret
    expect(CollaborativeFiltering::Sample.transform_prefs).to match ret
  end
end
