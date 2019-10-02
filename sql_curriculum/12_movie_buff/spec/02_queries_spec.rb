require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../movie_buff/02_queries.rb'

describe 'eighties_b_movies' do
	subject { eighties_b_movies.as_json }
	it 'retrieves the correct information' do
		expected_result = [
			{id: 472, title: 'Star Trek V: The Final Frontier', yr: 1989, score: 4.6},
			{id: 607, title: 'Rocky IV', yr: 1985, score: 4.8},
			{id: 663, title: 'Howard the Duck', yr: 1986, score: 3.7},
			{id: 682, title: '\'Crocodile\' Dundee II', yr: 1988, score: 5.0},
			{id: 703, title: 'Rambo: First Blood Part II', yr: 1985, score: 4.8},
			{id: 806, title: 'Rambo III', yr: 1988, score: 3.7},
			{id: 814, title: 'Superman III', yr: 1983, score: 4.3},
			{id: 863, title: 'Superman IV: The Quest for Peace', yr: 1987, score: 3.1},
			{id: 868, title: 'European Vacation', yr: 1985, score: 5.0},
			{id: 949, title: 'Police Academy 4: Citizens on Patrol', yr: 1987, score: 3.1},
			{id: 1018, title: 'Popeye', yr: 1980, score: 4.7},
			{id: 1022, title: 'Police Academy 2: Their First Assignment', yr: 1985, score: 4.0},
			{id: 1024, title: 'Grease 2', yr: 1982, score: 3.3},
			{id: 1083, title: 'Cobra', yr: 1986, score: 4.0},
			{id: 1086, title: 'My Stepmother Is an Alien', yr: 1988, score: 4.7},
			{id: 1102, title: 'Earth Girls Are Easy', yr: 1989, score: 5.0},
			{id: 1107, title: 'Blue Lagoon, The', yr: 1980, score: 4.3},
			{id: 1148, title: 'Police Academy 3: Back in Training', yr: 1986, score: 3.4},
			{id: 1171, title: 'Caddyshack II', yr: 1988, score: 3.5},
			{id: 1279, title: 'Teen Wolf', yr: 1985, score: 5.0},
			{id: 1291, title: 'Caligula', yr: 1980, score: 4.3},
			{id: 1389, title: 'Halloween III: Season of the Witch', yr: 1982, score: 3.4},
			{id: 1390, title: 'Red Sonja', yr: 1985, score: 4.1},
			{id: 1399, title: 'Short Circuit 2', yr: 1988, score: 4.3},
			{id: 1470, title: 'Nightmare on Elm Street Part 2: Freddy\'s Revenge, A', yr: 1985, score: 4.4},
			{id: 1525, title: 'Nightmare on Elm Street 4: The Dream Master, A', yr: 1988, score: 4.8},
			{id: 1602, title: 'Children of the Corn', yr: 1984, score: 4.6},
			{id: 1605, title: 'Cocoon: The Return', yr: 1988, score: 4.8},
			{id: 1614, title: 'Friday the 13th Part 2', yr: 1981, score: 4.4},
			{id: 1639, title: 'Supergirl', yr: 1984, score: 3.7},
			{id: 1641, title: 'Cannonball Run II', yr: 1984, score: 3.5},
			{id: 1646, title: 'Over the Top', yr: 1987, score: 3.8},
			{id: 1650, title: 'Xanadu', yr: 1980, score: 4.3},
			{id: 1731, title: 'Halloween 4: The Return of Michael Myers', yr: 1988, score: 5.0},
			{id: 1745, title: 'Young Einstein', yr: 1988, score: 4.8},
			{id: 1758, title: 'Poltergeist II: The Other Side', yr: 1986, score: 4.8},
			{id: 1794, title: 'Raw Deal', yr: 1986, score: 4.7},
			{id: 1797, title: 'Friday the 13th Part 3: 3D', yr: 1982, score: 3.8}
		].map{ |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_result)
	end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'bad_years' do
	subject { bad_years }

	it 'retrieves the correct information' do
		expect(subject).to contain_exactly(1947, 1932, 1965)
	end

  it 'hits the database exactly once' do
    expect{ subject.as_json }.to make_database_queries(count: 1)
  end
end

describe 'cast_list' do
	let(:star_wars) { cast_list('Star Wars').as_json }
	let(:forrest_gump) { cast_list('Forrest Gump').as_json }

	it 'retrieves the correct information' do
		star_wars_expected_result = [
			{id: 552, name: 'Mark Hamill'},
			{id: 6, name: 'Harrison Ford'},
			{id: 462, name: 'Carrie Fisher'},
			{id: 3234, name: 'Peter Cushing'},
			{id: 925, name: 'Alec Guinness'},
			{id: 1655, name: 'Anthony Daniels'},
			{id: 2881, name: 'Kenny Baker (I)'},
			{id: 3178, name: 'Peter Mayhew (II)'},
			{id: 3707, name: 'David Prowse'},
			{id: 5788, name: 'Jack Purvis'}
		].map{ |el| el.stringify_keys }

		forrest_gump_expected_result = [
			{id: 8, name: 'Tom Hanks'},
			{id: 536, name: 'Robin Wright'},
			{id: 255, name: 'Gary Sinise'},
			{id: 1204, name: 'Mykelti Williamson'},
			{id: 369, name: 'Sally Field'}
		].map{ |el| el.stringify_keys }

		expect(star_wars).to eq(star_wars_expected_result)

		expect(forrest_gump).to eq(forrest_gump_expected_result)
	end

	 it 'hits the database exactly once' do
    expect{ star_wars }.to make_database_queries(count: 1)
    expect{ forrest_gump }.to make_database_queries(count: 1)
  end
end

describe 'vanity_projects' do
	subject { vanity_projects.as_json }
	it 'retrieves the correct information' do
		expected_result = [
			{id: 1073, title: 'Zelig', name: 'Woody Allen'},
			{id: 921, title: 'Sleeper', name: 'Woody Allen'},
			{id: 1169, title: 'Sweet and Lowdown', name: 'Woody Allen'},
			{id: 1244, title: 'Small Time Crooks', name: 'Woody Allen'},
			{id: 1121, title: 'Everything You Always Wanted to Know About Sex', name: 'Woody Allen'},
			{id: 1318, title: 'Bananas', name: 'Woody Allen'},
			{id: 1648, title: 'Broadway Danny Rose', name: 'Woody Allen'},
			{id: 1544, title: 'New York Stories', name: 'Woody Allen'},
			{id: 1578, title: 'Take the Money and Run', name: 'Woody Allen'},
			{id: 1770, title: 'Midsummer Night\'s Sex Comedy, A', name: 'Woody Allen'},
			{id: 208, title: 'Annie Hall', name: 'Woody Allen'},
			{id: 642, title: 'Deconstructing Harry', name: 'Woody Allen'},
			{id: 1027, title: 'True Crime', name: 'Clint Eastwood'},
			{id: 769, title: 'Space Cowboys', name: 'Clint Eastwood'},
			{id: 812, title: 'Outlaw Josey Wales, The', name: 'Clint Eastwood'},
			{id: 1440, title: 'Firefox', name: 'Clint Eastwood'},
			{id: 1433, title: 'High Plains Drifter', name: 'Clint Eastwood'},
			{id: 1332, title: 'Pale Rider', name: 'Clint Eastwood'},
			{id: 1779, title: 'Sudden Impact', name: 'Clint Eastwood'},
			{id: 1518, title: 'Heartbreak Ridge', name: 'Clint Eastwood'},
			{id: 118, title: 'Unforgiven', name: 'Clint Eastwood'},
			{id: 651, title: 'Bridges of Madison County, The', name: 'Clint Eastwood'},
			{id: 657, title: 'Absolute Power', name: 'Clint Eastwood'},
			{id: 733, title: 'Bronx Tale, A', name: 'Robert De Niro'},
			{id: 762, title: 'Rocky II', name: 'Sylvester Stallone'},
			{id: 736, title: 'Rocky III', name: 'Sylvester Stallone'},
			{id: 607, title: 'Rocky IV', name: 'Sylvester Stallone'},
			{id: 109, title: 'Dances with Wolves', name: 'Kevin Costner'},
			{id: 635, title: 'Postman, The', name: 'Kevin Costner'},
			{id: 835, title: 'Throw Momma from the Train', name: 'Danny DeVito'},
			{id: 930, title: 'Bob Roberts', name: 'Tim Robbins'},
			{id: 946, title: 'History of the World: Part I', name: 'Mel Brooks'},
			{id: 1628, title: 'Silent Movie', name: 'Mel Brooks'},
			{id: 1624, title: 'High Anxiety', name: 'Mel Brooks'},
			{id: 730, title: 'Horse Whisperer, The', name: 'Robert Redford'},
			{id: 264, title: 'This Is Spinal Tap', name: 'Rob Reiner'},
			{id: 520, title: 'Dead Again', name: 'Kenneth Branagh'},
			{id: 1122, title: 'Heaven Can Wait', name: 'Warren Beatty'},
			{id: 1662, title: 'Reds', name: 'Warren Beatty'},
			{id: 567, title: 'Dick Tracy', name: 'Warren Beatty'},
			{id: 472, title: 'Star Trek V: The Final Frontier', name: 'William Shatner'},
			{id: 922, title: 'Gold Rush, The', name: 'Charles Chaplin'},
			{id: 589, title: 'Modern Times', name: 'Charles Chaplin'},
			{id: 715, title: 'Great Dictator, The', name: 'Charles Chaplin'},
			{id: 1374, title: 'Forget Paris', name: 'Billy Crystal'},
			{id: 1519, title: 'On Deadly Ground', name: 'Steven Seagal'},
			{id: 1792, title: 'Slacker', name: 'Richard Linklater'},
			{id: 1324, title: 'Prince of Tides, The', name: 'Barbra Streisand'},
			{id: 1258, title: 'Mirror Has Two Faces, The', name: 'Barbra Streisand'},
			{id: 1426, title: 'Defending Your Life', name: 'Albert Brooks'},
			{id: 40, title: 'Citizen Kane', name: 'Orson Welles'},
			{id: 522, title: 'Touch of Evil', name: 'Orson Welles'},
			{id: 1305, title: 'Orgazmo', name: 'Trey Parker'},
			{id: 111, title: 'South Park: Bigger, Longer and Uncut', name: 'Trey Parker'},
			{id: 143, title: 'Sling Blade', name: 'Billy Bob Thornton'},
			{id: 1341, title: 'Best in Show', name: 'Christopher Guest'},
			{id: 488, title: 'Beavis and Butt-head Do America', name: 'Mike Judge'},
			{id: 832, title: 'Buffalo \'66', name: 'Vincent Gallo'},
			{id: 74, title: 'Vita &#232; bella, La', name: 'Roberto Benigni'},
			{id: 1745, title: 'Young Einstein', name: 'Yahoo Serious'}
		].map{ |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_result)
	end

  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'most_supportive' do
	subject { most_supportive.as_json }
	it 'retrieves the correct information' do
		expected_result = [
			{id: 16, name: 'Gene Hackman', roles: 20},
			{id: 44, name: 'Robert Duvall', roles: 20}
		].map{ |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_result)
	end

	it 'hits the database exactly once' do
		expect{ subject }.to make_database_queries(count: 1)
	end
end
