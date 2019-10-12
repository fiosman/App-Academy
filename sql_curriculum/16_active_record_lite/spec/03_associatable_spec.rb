require '03_associatable'

describe 'AssocOptions' do
  describe 'BelongsToOptions' do
    it 'provides defaults' do
      options = BelongsToOptions.new('house')

      expect(options.foreign_key).to eq(:house_id)
      expect(options.class_name).to eq('House')
      expect(options.primary_key).to eq(:id)
    end

    it 'allows overrides' do
      options = BelongsToOptions.new('owner',
                                     foreign_key: :human_id,
                                     class_name: 'Human',
                                     primary_key: :human_id
      )

      expect(options.foreign_key).to eq(:human_id)
      expect(options.class_name).to eq('Human')
      expect(options.primary_key).to eq(:human_id)
    end
  end

  describe 'HasManyOptions' do
    it 'provides defaults' do
      options = HasManyOptions.new('cats', 'Human')

      expect(options.foreign_key).to eq(:human_id)
      expect(options.class_name).to eq('Cat')
      expect(options.primary_key).to eq(:id)
    end

    it 'allows overrides' do
      options = HasManyOptions.new('cats', 'Human',
                                   foreign_key: :owner_id,
                                   class_name: 'Kitten',
                                   primary_key: :human_id
      )

      expect(options.foreign_key).to eq(:owner_id)
      expect(options.class_name).to eq('Kitten')
      expect(options.primary_key).to eq(:human_id)
    end
  end

  describe 'AssocOptions' do
    before(:all) do
      class Cat < SQLObject
        self.finalize!
      end

      class Human < SQLObject
        self.table_name = 'humans'

        self.finalize!
      end
    end

    it '#model_class returns class of associated object' do
      options = BelongsToOptions.new('human')
      expect(options.model_class).to eq(Human)

      options = HasManyOptions.new('cats', 'Human')
      expect(options.model_class).to eq(Cat)
    end
    
    it '#table_name returns table name of associated object' do
      options = BelongsToOptions.new('human')
      expect(options.table_name).to eq('humans')

      options = HasManyOptions.new('cats', 'Human')
      expect(options.table_name).to eq('cats')
    end
  end
end

describe 'Associatable' do
  before(:each) { DBConnection.reset }
  after(:each) { DBConnection.reset }

  before(:all) do
    class Cat < SQLObject
      belongs_to :human, foreign_key: :owner_id

      finalize!
    end

    class Human < SQLObject
      self.table_name = 'humans'

      has_many :cats, foreign_key: :owner_id
      belongs_to :house

      finalize!
    end

    class House < SQLObject
      has_many :humans

      finalize!
    end
  end

  describe '#belongs_to' do
    let(:breakfast) { Cat.find(1) }
    let(:devon) { Human.find(1) }

    it 'fetches `human` from `Cat` correctly' do
      expect(breakfast).to respond_to(:human)
      human = breakfast.human

      expect(human).to be_instance_of(Human)
      expect(human.fname).to eq('Devon')
    end

    it 'fetches `house` from `Human` correctly' do
      expect(devon).to respond_to(:house)
      house = devon.house

      expect(house).to be_instance_of(House)
      expect(house.address).to eq('26th and Guerrero')
    end

    it 'returns nil if no associated object' do
      stray_cat = Cat.find(5)
      expect(stray_cat.human).to eq(nil)
    end
  end

  describe '#has_many' do
    let(:ned) { Human.find(3) }
    let(:ned_house) { House.find(2) }

    it 'fetches `cats` from `Human`' do
      expect(ned).to respond_to(:cats)
      cats = ned.cats

      expect(cats.length).to eq(2)

      expected_cat_names = %w(Haskell Markov)
      2.times do |i|
        cat = cats[i]

        expect(cat).to be_instance_of(Cat)
        expect(cat.name).to eq(expected_cat_names[i])
      end
    end

    it 'fetches `humans` from `House`' do
      expect(ned_house).to respond_to(:humans)
      humans = ned_house.humans

      expect(humans.length).to eq(1)
      expect(humans[0]).to be_instance_of(Human)
      expect(humans[0].fname).to eq('Ned')
    end

    it 'returns an empty array if no associated items' do
      catless_human = Human.find(4)
      expect(catless_human.cats).to eq([])
    end
  end
end
