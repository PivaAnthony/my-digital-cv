class Hash
  def deep_transform_keys(&block)
    deep_transform_keys_in_object(self, &block)
  end

  private

  def deep_transform_keys_in_object(object, &block)
    case object
    when Array
      object.map { |value| deep_transform_keys_in_object(value, &block) }
    when Hash
      object.each_with_object({}) do |(key, value), acc|
        acc[yield(key)] = deep_transform_keys_in_object(value, &block)
      end
    else
      object
    end
  end
end

def format_timestamps(value)
  value = DateTime.parse(value).utc.iso8601(0)
end

def transform_id_to_integer(hash)
  hash.each do |key, value|
    if key == 'id' && value.is_a?(String)
      hash[key] = value.to_i
    elsif value.is_a?(Hash)
      transform_id_to_integer(value)
    elsif value.is_a?(Array)
      value.each { |v| transform_id_to_integer(v) if v.is_a?(Hash) }
    end
  end
  hash
end

def deep_snakelize_keys(hash)
  hash.deep_transform_keys { |key| key.to_s.underscore }
end

def deep_camelize_keys(hash)
  hash.deep_transform_keys { |key| key.to_s.camelize(:lower) }
end
