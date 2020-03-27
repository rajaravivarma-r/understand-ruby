# frozen_string_literal: true

class ModelClass
  def initialize(attribute)
    send('attribute=', attribute)
  end

  private

  attr_writer :attribute

  def attribute=(val)
    # super(val) # This will result in error `attribute=': super: no superclass method `attribute=' for #<ModelClass:0x00007fa01710e848>
    # self.attribute = val # This will result in `attribute=': stack level too deep (SystemStackError)
    @attribute = val
    puts 'Called super'
    puts 'value from call', val
  end
end

mc = ModelClass.new('value')
