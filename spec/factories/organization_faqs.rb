FactoryBot.define do
  factory :organization_faq do
    organization
    question { "Is this my question?" }
    answer { "This is my answer." }
  end
end