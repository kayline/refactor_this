class Todo < ActiveRecord::Base
  
STATUS_CODES = { incomplete: 0, complete: 1, in_progress: 2, moved: 3, deleted: 4, postponed: 5, important: 6 }

  attr_accessible :title, :body, :list_name, :todo_count, :status
  before_save :format_list_name
  
  def status?(status)
    status_code = STATUS_CODES[status.to_sym]
    self.status == status_code
  end

  def status!(new_status)
    status_code = STATUS_CODES[new_status.to_sym]
    self.update_attributes :status => status_code
  end

  class << self

    def all_by_status(status)
      status_code = STATUS_CODES[status.to_sym]
      self.where :status => status_code
    end

    def create_by_status(status)
      status_code = STATUS_CODES[status.to_sym]
      self.create :status => status_code
    end
 
  end

  private
    def format_list_name
      self.list_name = self.list_name.parameterize
    end 

end
