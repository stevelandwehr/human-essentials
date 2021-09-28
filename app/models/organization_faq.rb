# == Schema Information
#
# Table name: organization_faqs
#
#  id              :bigint           not null, primary key
#  answer          :string
#  question        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
class OrganizationFaq < ApplicationRecord
  belongs_to :organization
end
