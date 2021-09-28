class HelpController < ApplicationController
  attr_reader :organization

  def index
    @organization = current_organization
    @help_faq = @organization.organization_faqs
  end

  def show
    @faq_structured_data = OrganizationStructuredData.new(@organization).generate_faq_schema
  end

  def create
    @organization_faq = OrganizationFaq.new(organization_faq_params)
    if @organization_faq.save
      redirect_to help_index_path, notice: "FAQ successfully added"
    else
      redirect_to help_index_path, error: "#{organization_faq_params}"
    end
  end

  def new
    @organization_faq = OrganizationFaq.new
  end

  private

  def organization_faq_params
    params.require(:organization_faq).permit(:organization_id, :question, :answer)
  end
end
