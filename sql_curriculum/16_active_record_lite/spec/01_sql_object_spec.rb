require '01_sql_object'
require 'db_connection'
require 'securerandom'

describe SQLObject do
  before(:each) { DBConnection.reset }
  after(:each) { DBConnection.reset }

  context 'before ::finalize!' do
    before(:each) do
      class Cat < SQLObject
      end
    end

    after(:each) do
      Object.send(:remove_const, :Cat)
    end

    describe '::table_name' do
      it 'generates default name' do
        expect(Cat.table_name).to eq('cats')
      end
    end

    describe '::table_name=' do
      it 'sets table name' do
        class Human < SQLObject
          self.table_name = 'humans'
        end

        expect(Human.table_name).to eq('humans')

        Object.send(:remove_const, :Human)
      end
    end

    describe '::columns' do
      it 'returns a list of all column names as symbols' do
        expect(Cat.columns).to eq([:id, :name, :owner_id])
      end

      it 'only queries the DB once' do
        expect(DBConnection.instance).to(
          receive(:execute2).exactly(1).times.and_call_original)
        3.times { Cat.columns }
      end
    end

    describe '#attributes' do
      it 'returns @attributes hash byref' do
        cat_attributes = {name: 'Gizmo'}
        c = Cat.new
        c.instance_variable_set('@attributes', cat_attributes)

        expect(c.attributes).to equal(cat_attributes)
      end

      it 'lazily initializes @attributes to an empty hash' do
        c = Cat.new

        expect(c.instance_variables).not_to include(:@attributes)
        expect(c.attributes).to eq({})
        expect(c.instance_variables).to include(:@attributes)
      end
    end
  end

  context 'after ::finalize!' do
    before(:all) do
      class Cat < SQLObject
        self.finalize!
      end

      class Human < SQLObject
        self.table_name = 'humans'

        self.finalize!
      end
    end

    after(:all) do
      Object.send(:remove_const, :Cat)
      Object.send(:remove_const, :Human)
    end

    describe '::finalize!' do
      it 'creates getter methods for each column' do
        c = Cat.new
        expect(c.respond_to? :something).to be false
        expect(c.respond_to? :name).to be true
        expect(c.respond_to? :id).to be true
        expect(c.respond_to? :owner_id).to be true
      end

      it 'creates setter methods for each column' do
        c = Cat.new
        c.name = "Nick Diaz"
        c.id = 209
        c.owner_id = 2
        expect(c.name).to eq 'Nick Diaz'
        expect(c.id).to eq 209
        expect(c.owner_id).to eq 2
      end

      it 'created getter methods read from attributes hash' do
        c = Cat.new
        c.instance_variable_set(:@attributes, {name: "Nick Diaz"})
        expect(c.name).to eq 'Nick Diaz'
      end

      it 'created setter methods use attributes hash to store data' do
        c = Cat.new
        c.name = "Nick Diaz"

        expect(c.instance_variables).to include(:@attributes)
        expect(c.instance_variables).not_to include(:@name)
        expect(c.attributes[:name]).to eq 'Nick Diaz'
      end
    end

    describe '#initialize' do
      it 'calls appropriate setter method for each item in params' do
        # We have to set method expectations on the cat object *before*
        # #initialize gets called, so we use ::allocate to create a
        # blank Cat object first and then call #initialize manually.
        c = Cat.allocate

        expect(c).to receive(:name=).with('Don Frye')
        expect(c).to receive(:id=).with(100)
        expect(c).to receive(:owner_id=).with(4)

        c.send(:initialize, {name: 'Don Frye', id: 100, owner_id: 4})
      end

      it 'throws an error when given an unknown attribute' do
        expect do
          Cat.new(favorite_band: 'Anybody but The Eagles')
        end.to raise_error "unknown attribute 'favorite_band'"
      end
    end

    describe '::all, ::parse_all' do
      it '::all returns all the rows' do
        cats = Cat.all
        expect(cats.count).to eq(5)
      end

      it '::parse_all turns an array of hashes into objects' do
        hashes = [
          { name: 'cat1', owner_id: 1 },
          { name: 'cat2', owner_id: 2 }
        ]

        cats = Cat.parse_all(hashes)
        expect(cats.length).to eq(2)
        hashes.each_index do |i|
          expect(cats[i].name).to eq(hashes[i][:name])
          expect(cats[i].owner_id).to eq(hashes[i][:owner_id])
        end
      end

      it '::all returns a list of objects, not hashes' do
        cats = Cat.all
        cats.each { |cat| expect(cat).to be_instance_of(Cat) }
      end

      it '::all does not cache the results' do
        expect(DBConnection).to(
          receive(:execute).exactly(2).times.and_call_original)
        2.times { Cat.all }
      end
    end

    describe '::find' do
      it 'fetches single objects by id' do
        c = Cat.find(1)

        expect(c).to be_instance_of(Cat)
        expect(c.id).to eq(1)
      end

      it 'returns nil if no object has the given id' do
        expect(Cat.find(123)).to be_nil
      end
    end

    describe '#attribute_values' do
      it 'returns array of values' do
        cat = Cat.new(id: 123, name: 'cat1', owner_id: 1)

        expect(cat.attribute_values).to eq([123, 'cat1', 1])
      end
    end

    describe '#insert' do
      let(:cat) { Cat.new(name: 'Gizmo', owner_id: 1) }

      before(:each) { cat.insert }

      it 'inserts a new record' do
        expect(Cat.all.count).to eq(6)
      end

      it 'sets the id once the new record is saved' do
        expect(cat.id).to eq(DBConnection.last_insert_row_id)
      end

      it 'creates a new record with the correct values' do
        # pull the cat again
        cat2 = Cat.find(cat.id)

        expect(cat2.name).to eq('Gizmo')
        expect(cat2.owner_id).to eq(1)
      end
    end

    describe '#update' do
      it 'saves updated attributes to the DB' do
        human = Human.find(2)

        human.fname = 'Matthew'
        human.lname = 'von Rubens'
        human.update

        # pull the human again
        human = Human.find(2)
        expect(human.fname).to eq('Matthew')
        expect(human.lname).to eq('von Rubens')
      end
    end

    describe '#save' do
      it 'calls #insert when record does not exist' do
        human = Human.new
        expect(human).to receive(:insert)
        human.save
      end

      it 'calls #update when record already exists' do
        human = Human.find(1)
        expect(human).to receive(:update)
        human.save
      end
    end
  end
end
