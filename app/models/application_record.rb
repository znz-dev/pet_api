class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 引入自定义concern
  include ModelConcern
end
