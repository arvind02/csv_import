class Employee < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :policies

  validates :name, presence: true
  validates :email, uniqueness: true

  acts_as_nested_set

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  scope :boss_employees_data, -> { where("employees.parent_id is null").pluck(:email, :id).to_h }

	def self.add_or_get_employees(data = [], parent_id='', company_id)
		return [] if data.blank? || data[0].blank?
		employee = Employee.find_or_initialize_by(email: data[1]) 
		if employee.new_record? 
			employee.name = data[0]
			employee.phone = data[2] 
			employee.company_id = company_id
			employee.parent_id = parent_id.to_i unless parent_id.blank?
			if employee.save!
				return employee.reload
		  end
		else
			return []
		end
	end 

end