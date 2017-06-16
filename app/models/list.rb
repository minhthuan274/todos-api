class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy 
  validates :title, presence: true 

  def add_todo
    self.increment!(:todo_count)
  end

  def add_done
    self.decrement!(:todo_count)
    self.increment!(:done_count)
  end

  def remove_done
    self.decrement!(:done_count)
  end
end
