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
FactoryBot.define do
  factory :organization_faq do
    organization
    question { "Is this my question?" }
    answer { "This is my answer." }
  end
end
