require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../movie_novice/queries.rb'

describe 'find_angelina' do
	subject { find_angelina.as_json }

	it 'retrieves the correct information' do
		expect(subject).to contain_exactly(
			['id', 487],
			['name', 'Angelina Jolie']
		)
	end
end

describe 'top_titles' do
	subject { top_titles.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: 2, title: 'Shawshank Redemption, The'},
			{id: 12, title: 'Godfather, The'},
			{id: 241, title: 'Shichinin no samurai'},
			{id: 331, title: 'Wo hu zang long'}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end

describe 'star_wars' do
	subject { star_wars.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: 1, title: 'Star Wars', yr: 1977},
			{id: 5, title: 'Star Wars: Episode V - The Empire Strikes Back', yr: 1980},
			{id: 13, title: 'Star Wars: Episode VI - Return of the Jedi', yr: 1983},
			{id: 17, title: 'Star Wars: Episode I - The Phantom Menace', yr: 1999}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end

describe 'below_average_years' do
	subject { below_average_years.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: nil, yr: 1997, bad_movies: 15},
			{id: nil, yr: 1999, bad_movies: 14},
			{id: nil, yr: 1994, bad_movies: 12},
			{id: nil, yr: 2000, bad_movies: 10},
			{id: nil, yr: 1996, bad_movies: 10},
			{id: nil, yr: 1995, bad_movies: 10},
			{id: nil, yr: 1993, bad_movies: 8},
			{id: nil, yr: 1988, bad_movies: 8},
			{id: nil, yr: 1991, bad_movies: 7},
			{id: nil, yr: 1992, bad_movies: 7},
			{id: nil, yr: 1990, bad_movies: 7},
			{id: nil, yr: 1998, bad_movies: 7},
			{id: nil, yr: 1986, bad_movies: 5},
			{id: nil, yr: 1985, bad_movies: 5},
			{id: nil, yr: 1987, bad_movies: 4},
			{id: nil, yr: 1980, bad_movies: 4},
			{id: nil, yr: 1982, bad_movies: 3},
			{id: nil, yr: 1984, bad_movies: 3},
			{id: nil, yr: 1989, bad_movies: 2},
			{id: nil, yr: 1977, bad_movies: 1},
			{id: nil, yr: 1983, bad_movies: 1},
			{id: nil, yr: 1981, bad_movies: 1},
			{id: nil, yr: 1978, bad_movies: 1},
			{id: nil, yr: 1964, bad_movies: 1},
			{id: nil, yr: 1958, bad_movies: 1}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end

describe 'alphabetized_actors' do
	subject { alphabetized_actors.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: 5141, name: '&#193;ngela Molina'},
			{id: 4238, name: '&#201;lisabeth Bourgine'},
			{id: 2143, name: '&#201;lodie Bouchez'},
			{id: 1876, name: '\'Weird Al\' Yankovic'},
			{id: 4235, name: 'A.J. Langer'},
			{id: 4234, name: 'Aaliyah'},
			{id: 940, name: 'Aaron Eckhart'},
			{id: 4223, name: 'Aaron Michael Metchik'},
			{id: 4231, name: 'Abdel Ahmed Ghili'},
			{id: 1881, name: 'Abe Vigoda'}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end

describe 'pulp_fiction_actors' do
	subject { pulp_fiction_actors.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: 13, name: 'Bruce Willis'},
			{id: 34, name: 'John Travolta'},
			{id: 73, name: 'Harvey Keitel'},
			{id: 89, name: 'Samuel L. Jackson'},
			{id: 99, name: 'Christopher Walken'},
			{id: 243, name: 'Uma Thurman'},
			{id: 355, name: 'Ving Rhames'},
			{id: 368, name: 'Rosanna Arquette'},
			{id: 702, name: 'Eric Stoltz'},
			{id: 791, name: 'Tim Roth'},
			{id: 849, name: 'Amanda Plummer'},
			{id: 3018, name: 'Peter Greene (I)'},
			{id: 3362, name: 'Maria de Medeiros'},
			{id: 3449, name: 'Paul Calderon'}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end

describe 'uma_movies' do
	subject { uma_movies.as_json }

	it 'retrieves the correct information' do
		expected_response = [
			{id: 281, title: 'Dangerous Liaisons', yr: 1988},
			{id: 574, title: 'Adventures of Baron Munchausen, The', yr: 1988},
			{id: 1545, title: 'Henry & June', yr: 1990},
			{id: 3, title: 'Pulp Fiction', yr: 1994},
			{id: 616, title: 'Beautiful Girls', yr: 1996},
			{id: 502, title: 'Truth About Cats & Dogs, The', yr: 1996},
			{id: 151, title: 'Gattaca', yr: 1997},
			{id: 107, title: 'Batman & Robin', yr: 1997},
			{id: 380, title: 'Avengers, The', yr: 1998},
			{id: 1058, title: 'Mis&#233;rables, Les', yr: 1998}
		].map { |el| el.stringify_keys }

		expect(subject).to contain_exactly(*expected_response)
	end
end
