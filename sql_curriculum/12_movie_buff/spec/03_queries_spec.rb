require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../movie_buff/03_queries.rb'

describe 'what_was_that_one_with' do
	let(:ben_and_matt) {what_was_that_one_with([
		'Ben Affleck', 'Matt Damon'
	]).as_json}

	let(:geena_and_susan) {what_was_that_one_with([
		'Geena Davis', 'Susan Sarandon'
	]).as_json}

	it 'retrieves the correct information' do
		ben_and_matt_expected_result = [
			{id: 1449, title: 'School Ties'},
			{id: 29, title: 'Good Will Hunting'},
			{id: 98, title: 'Dogma'},
			{id: 95, title: 'Chasing Amy'}
		].map{ |el| el.stringify_keys }

		geena_and_susan_expected_result = [
			{id: 201, title: 'Thelma & Louise'}
		].map{ |el| el.stringify_keys }

		expect(ben_and_matt).to contain_exactly(*ben_and_matt_expected_result)

		expect(geena_and_susan).to eq(geena_and_susan_expected_result)
	end

	it 'hits the database exactly once' do
		expect{ ben_and_matt }.to make_database_queries(count: 1)
		expect{ geena_and_susan }.to make_database_queries(count: 1)
	end
end

describe 'golden_age' do
	subject { golden_age }
	it 'retrieves the correct information' do
		expect(subject).to be(1920)
	end

	 it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe 'costars' do
	let (:julie_andrews) { costars('Julie Andrews').to_a }
	let (:humphrey_bogart) { costars('Humphrey Bogart').to_a }
	it 'retrieves the correct information' do
		expect(julie_andrews).to contain_exactly(
			'Bo Derek',
			'Peter Arne',
			'Richard Haydn',
			'Peggy Wood',
			'Graham Stark',
			'Dee Wallace-Stone',
			'Alex Karras',
			'Ben Wright (I)',
			'Eleanor Parker (I)',
			'Robert Preston (I)',
			'James Garner',
			'Brian Dennehy',
			'Dudley Moore',
			'Sam J. Jones',
			'Don Calfa',
			'Deborah Rush',
			'Lesley Ann Warren',
			'John Rhys-Davies',
			'Robert Webber (I)',
			'Christopher Plummer'
		)
		expect(humphrey_bogart).to contain_exactly(
			'Barton MacLane',
			'Bruce Bennett',
			'Claude Akins',
			'Claude Rains',
			'Conrad Veidt',
			'Curt Bois',
			'Dolores Moran',
			'Dorothy Malone',
			'E.G. Marshall',
			'Elisha Cook Jr.',
			'Fred MacMurray',
			'Hoagy Carmichael',
			'Ingrid Bergman',
			'Jerry Paris',
			'John Qualen',
			'John Ridgely',
			'Jos&#233; Ferrer',
			'Katharine Hepburn',
			'Lauren Bacall',
			'Lee Marvin',
			'Madeleine LeBeau',
			'Martha Vickers',
			'Paul Henreid',
			'Peter Bull (I)',
			'Peter Lorre',
			'Regis Toomey',
			'Robert Francis (I)',
			'Robert Morley (I)',
			'Theodore Bikel',
			'Tim Holt',
			'Van Johnson',
			'Walter Brennan',
			'Walter Gotell',
			'Walter Huston'
		)
	end

	it 'hits the database at most twice' do
    expect{ julie_andrews }.to make_database_queries(count: 1..2)
    expect{ humphrey_bogart }.to make_database_queries(count: 1..2)
  end
end

describe 'actor_out_of_work' do
	subject { actor_out_of_work }

	it 'retrieves the correct information' do
		expect(subject).to eq(770)
	end

	it 'hits the database exactly once' do
		expect{ subject }.to make_database_queries(count: 1)
	end
end

describe 'starring(whazzername)' do
	let (:lester) { starring('lester stone') }
	let (:me) { starring('me book') }
	let (:ery) { starring('ery steep') }
	it 'retrieves the correct information' do
		expect(lester).to contain_exactly(*Actor.find_by(name: 'Sylvester Stallone').movies)
		expect(me).to contain_exactly(*Actor.find_by(name: 'Mel Brooks').movies)
		expect(ery).to contain_exactly(*Actor.find_by(name: 'Meryl Streep').movies)
	end

	it 'hits the database exactly once' do
		expect{ lester.as_json }.to make_database_queries(count: 1)
		expect{ me.as_json }.to make_database_queries(count: 1)
		expect{ ery.as_json }.to make_database_queries(count: 1)
	end
end

describe 'longest_career' do
	subject { longest_career.as_json }
	it 'retrieves the correct information' do
		expected_result = [
			{id: 3537, name: 'Deems Taylor', career: 59},
			{id: 1915, name: 'Leopold Stokowski', career: 59},
			{id: 845, name: 'Robert Stack', career: 56}
		].map{ |el| el.stringify_keys }

		expect(subject).to eq(expected_result)
	end

	it 'hits the database exactly once' do
		expect{ subject }.to make_database_queries(count: 1)
	end
end
