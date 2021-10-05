require "rails_helper"

RSpec.describe Partners::Faq, type: :model do
  describe 'associations' do
    it { should belong_to(:partner) }
  end
end