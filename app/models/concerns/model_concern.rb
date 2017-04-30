module ModelConcern
  extend ActiveSupport::Concern

  module ClassMethods
    def search_by_params(params = {})
      result = self.all
      if params.present?
        keys = params.keys
        keys.each do |key|
          value = params[key]
          result = result.where(key.to_sym => value) if self.attribute_names.include?(key.to_s)
          if key.to_s.include?('like_')
            attr_key = key.to_s.gsub('like_', '')
            result = result.where("#{self.name.tableize}.#{attr_key} ilike ?", "%#{value}%") if self.attribute_names.include?(attr_key.to_s)
          end
        end
      end
      result
    end
  end
end