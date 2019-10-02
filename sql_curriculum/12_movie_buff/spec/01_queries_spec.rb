require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../movie_buff/01_queries.rb'

describe 'it_was_ok' do
  subject { it_was_ok.as_json }

  it 'retrieves the correct information' do
    expected_result = [
      {id: 537, title: 'Battlefield Earth', score: 2.3},
      {id: 738, title: 'Spice World', score: 3.0},
      {id: 955, title: 'Police Academy 5: Assignment: Miami Beach', score: 2.5},
      {id: 1031, title: 'Stop! Or My Mom Will Shoot', score: 3.0},
      {id: 1040, title: 'Mortal Kombat: Annihilation', score: 3.0},
      {id: 1070, title: 'Police Academy 6: City Under Siege', score: 2.5},
      {id: 1423, title: 'Problem Child 2', score: 2.7},
      {id: 1572, title: 'Baby Geniuses', score: 2.2},
      {id: 1791, title: 'Teen Wolf Too', score: 2.5},
      {id: 1833, title: 'Santa Claus Conquers the Martians', score: 2.1}
    ].map{ |el| el.stringify_keys }

    expect(subject).to contain_exactly(*expected_result)
  end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'harrison_ford' do
  subject { harrison_ford.as_json }

  it 'retrieves the correct information' do
    expected_result = [
      {id: 5, title: 'Star Wars: Episode V - The Empire Strikes Back'},
      {id: 13, title: 'Star Wars: Episode VI - Return of the Jedi'},
      {id: 1, title: 'Star Wars'},
      {id: 45, title: 'Apocalypse Now'},
      {id: 371, title: 'American Graffiti'},
      {id: 700, title: 'Conversation, The'}
    ].map{ |el| el.stringify_keys }

    expect(subject).to contain_exactly(*expected_result)
  end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'biggest_cast' do
  subject { biggest_cast.as_json }

  it 'retrieves the correct information' do
    expected_result = [
      {id: 373, title: 'Fear and Loathing in Las Vegas'},
      {id: 280, title: 'Star Trek: Generations'},
      {id: 1153, title: '200 Cigarettes'}
    ].map{ |el| el.stringify_keys }

    expect(subject).to contain_exactly(*expected_result)
  end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'directed_by_one_of' do
  them = ['George Lucas', 'Steven Spielberg']
  subject { directed_by_one_of(them).as_json }

  it 'retrieves the correct information' do
    expected_result = [
      {id: 7, title: 'Schindler\'s List'},
      {id: 8, title: 'Saving Private Ryan'},
      {id: 11, title: 'Raiders of the Lost Ark'},
      {id: 37, title: 'Indiana Jones and the Last Crusade'},
      {id: 66, title: 'E.T. the Extra-Terrestrial'},
      {id: 103, title: 'Indiana Jones and the Temple of Doom'},
      {id: 133, title: 'Close Encounters of the Third Kind'},
      {id: 265, title: 'Hook'},
      {id: 454, title: 'Color Purple, The'},
      {id: 500, title: 'Amistad'},
      {id: 512, title: 'Empire of the Sun'},
      {id: 885, title: '1941'},
      {id: 939, title: 'Always'},
      {id: 1, title: 'Star Wars'},
      {id: 17, title: 'Star Wars: Episode I - The Phantom Menace'},
      {id: 371, title: 'American Graffiti'},
      {id: 1238, title: 'THX 1138'}
    ].map{ |el| el.stringify_keys }

    expect(subject).to contain_exactly(*expected_result)
  end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'movie_names_before_1940' do
	subject { movie_names_before_1940.to_a }

	it 'retrieves the correct information' do
		expect(subject).to contain_exactly(
     'Wizard of Oz, The',
     'Gone with the Wind',
     'Mr. Smith Goes to Washington',
     'Snow White and the Seven Dwarfs',
     'Duck Soup',
     'Modern Times',
     'Bringing Up Baby',
     'City Lights',
     '39 Steps, The',
     'Gold Rush, The',
     'Adventures of Robin Hood, The',
     'All Quiet on the Western Front',
     'Night at the Opera, A',
     'Nosferatu, eine Symphonie des Grauens',
     'General, The',
     'Frankenstein',
     'Stagecoach',
     'Bronenosets Potyomkin',
     'Thin Man, The',
     'Grande illusion, La',
     'Freaks',
     'Bride of Frankenstein',
     'Un chien andalou'
    )
	end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end
