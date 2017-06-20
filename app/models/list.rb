class List < ApplicationRecord
  belongs_to :user
  has_many :tasks,  dependent: :destroy 
  has_many :shares, dependent: :destroy
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

  def name_with_shared_user
    "#{self.title} (shared by #{User.find_by_id(self.user_id).email})"
  end

  def shares_label
    shares = Share.where(list_id: self.id).length
    "#{shares} people"
  end
end
