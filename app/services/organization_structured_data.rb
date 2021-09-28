class OrganizationStructuredData
  attr_reader :organization

  def initialize(organization)
    binding.pry
    @organization = current_organization
  end

  def generate_faq_schema
    return if @organization.organization_faqs.empty?

    JSON.pretty_generate(
      "@context" => "http://schema.org",
      "@type" => "FAQPage",
      "mainEntity" => @organization.organization_faqs.map { |faq|
        {
          "@type" => "Question",
          "name" => faq.question,
          "acceptedAnswer" => {
            "@type" => "Answer",
            "text" => faq.answer,
          }
        }
      }
    )
  end
end
