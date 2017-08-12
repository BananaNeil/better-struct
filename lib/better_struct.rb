class BetterStruct
  include ActiveModel::Validations

  delegate :_required_params, :_optional_params, to: self

  def initialize(hashish)
    hashish.each do |key, val|
      send(:"#{key}=", val)
    end
  end

  def to_h
    {}.tap do |attrs|
      instance_variables.each do |var|
        str = var.to_s.gsub /^@/, ''
        if respond_to? "#{str}="
          attrs[str.to_sym] = instance_variable_get var
        end
      end
    end.compact
  end

  def self.required_params(*required_keys)
    _required_params |= Array.wrap(required_keys)
    required_keys.each(&method(:attr_accessor))
    required_keys.each(&method(:validates_presence_of))
  end

  def self.optional_params(*optional_keys)
    _optional_params |= Array.wrap(optional_keys)
    optional_keys.each(&method(:attr_accessor))
  end

  class << self

    attr_accessor :_required_params, :_optional_params

    def _required_params
      @required_params ||= []
    end

    def _optional_params
      @optional_params ||= []
    end

  end
end
