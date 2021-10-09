RSpec.describe "Faq", type: :system do
  let(:partner) { FactoryBot.create(:partner) }
  let(:partner_user) { partner.primary_partner_user }

  before do
    partner.profile.update(partner_status: :verified)
    login_as(partner_user, scope: :partner_user)
  end

  describe "for partner users" do
    it "displays the help page" do
      visit partners_faqs_path
      expect(page).to have_text("Frequently Asked Questions")
    end

    it "can create a new FAQ pair" do
      params = {
        partners_faq: {
          partner_id: partner.id,
          question: "Some question",
          answer: "Some answer"
        }
      }
      subject = { post :create, params: params }
      expect(subject).to have_http_status(:found)
      expect(flash[:notice]).to eq("FAQ successfully added")
    end
  end
end
