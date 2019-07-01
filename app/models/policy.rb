class Policy < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :employees

  validates :name, uniqueness: true

  def self.add_or_get_policies(data=[], company_id)
		return [] if data.blank? || data[4].blank?
		policy_cont = []
		policy_data = data[4].split("|").map {|x| x.strip }
		policy_data.each do |poly|
			policy = Policy.find_or_initialize_by(name: poly)
			if policy.new_record?
				policy.company_id = company_id
				if policy.save!
					policy_cont << policy
				end
			else
				policy_cont << policy 	 
			end
		end
		return policy_cont
  end
end
