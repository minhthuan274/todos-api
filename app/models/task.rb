class Task < ApplicationRecord
  belongs_to :list

  def set_done
    self.update_attribute(:complete, true)
  end
end
