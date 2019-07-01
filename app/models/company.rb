class Company < ApplicationRecord
  has_many :employees
  has_many :policies

  validates :name, presence: true

  def self.import_data(file_path, company_id)
    import_boss_data(file_path, company_id)         
    import_employee_data(file_path, company_id) 
    Employee.build_tree   
  end

  def self.import_boss_data(file_path, company_id)
    CSV.foreach(file_path, headers: true) do |row|
      next if row.blank? || !row[3].nil?
      process_data(row, '', company_id)
    end
  end

  def self.import_employee_data(file_path, company_id)
    boss_hash = Employee.boss_employees_data
    CSV.foreach(file_path, headers: true) do |row|
      next if row.blank? || row[3].nil?
      parent_id = boss_hash[row[3]] rescue ''
      process_data(row, parent_id, company_id)
    end 
  end

  private 

  def self.process_data(row, parent_id, company_id)
    employee = Employee.add_or_get_employees(row,parent_id,company_id)
    policy_data = Policy.add_or_get_policies(row, company_id)
    if !policy_data.blank? && !employee.blank?
      policy_data.each do |policy|
        employee.policies << policy
      end 
    end
  end

end

