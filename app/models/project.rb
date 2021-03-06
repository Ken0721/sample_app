class Project < ActiveRecord::Base
	#has_many :projects, dependent: :destroy
  belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence:true
	validates :name, presence: true, length: {maximum: 10}
end
