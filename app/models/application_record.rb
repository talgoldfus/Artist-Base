class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.recently_created(num) 
      self.all.order("id DESC").limit(num) 
  end

 


end
