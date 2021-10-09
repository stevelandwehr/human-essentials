FactoryBot.define do
  factory :partners_faq, class: Partners::Faq do
    partner
    question { "Is this my partner question?" }
    answer { "This is my partner answer." }
  end
end