require '00_attr_accessor_object'

describe AttrAccessorObject do
  before(:all) do
    class MyAttrAccessorObject < AttrAccessorObject
      my_attr_accessor :x, :y
    end
  end

  after(:all) do
    Object.send(:remove_const, :MyAttrAccessorObject)
  end

  subject(:obj) { MyAttrAccessorObject.new }

  describe '#my_attr_accessor' do
    it 'defines getter methods' do
      expect(obj).to respond_to(:x)
      expect(obj).to respond_to(:y)
    end

    it 'defines setter methods' do
      expect(obj).to respond_to(:x=)
      expect(obj).to respond_to(:y=)
    end

    it 'getter methods get from associated ivars' do
      x_val = 'value of @x'
      y_val = 'value of @y'
      obj.instance_variable_set('@x', x_val)
      obj.instance_variable_set('@y', y_val)

      expect(obj.x).to eq(x_val)
      expect(obj.y).to eq(y_val)
    end

    it 'setter methods set associated ivars' do
      x_val = 'value of @x'
      y_val = 'value of @y'
      obj.x = x_val
      obj.y = y_val

      expect(obj.instance_variable_get('@x')).to eq(x_val)
      expect(obj.instance_variable_get('@y')).to eq(y_val)
    end
  end
end
