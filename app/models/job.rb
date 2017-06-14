class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def display_comments
    comments.order(updated_at: :desc)
  end
  
  def self.by_level_of_interest
    Job.group(:level_of_interest).order('count_id desc').count(:id)
  end

  def self.top_companies(number)
    Job.joins(:company).group(:name).order("average_level_of_interest desc").average(:level_of_interest).take(number)
  end

  def self.locations
    Job.group(:city).order('count_id desc').count(:id)
  end

  def self.sorted(by)
    by = "city ASC" if by == "location"
    by = "level_of_interest DESC" if by == "interest"
    Job.order(by)
  end
end
