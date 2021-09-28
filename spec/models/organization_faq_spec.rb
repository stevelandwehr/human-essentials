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
RSpec.describe OrganizationFaq, type: :model do
  describe 'assocations' do
    it { should belong_to(:organization) }
  end
end
