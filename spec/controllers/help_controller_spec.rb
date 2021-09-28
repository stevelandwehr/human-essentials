require 'rails_helper'

RSpec.describe HelpController, type: :controller do
  let(:default_params) do
    { organization_id: @organization.to_param }
  end

  context "While signed in as an admin user >" do
    before do
      sign_in(@organization_admin)
    end

    describe "GET #index" do
      subject { get :index, params: default_params }
      it "returns http success" do
        expect(subject).to be_successful
      end
      it "does not display help page when the user logs out" do
        sign_out(@user)
        expect(subject).to_not be_successful
      end
    end

    describe "POST #create" do
      let(:params) do
        {
          organization_faq: {
            organization_id: @organization.id,
            question: "Some question",
            answer: "Some answer"
          }
        }
      end

      subject { post :create, params: params }

      it "renders with a flash notice" do
        expect(subject).to have_http_status(:found)
        expect(flash[:notice]).to eq("FAQ successfully added")
      end
    end
  end
  
  context "While signed in as a normal user >" do
    before do
      sign_in(@user)
    end

    describe "GET #index" do
      subject { get :index, params: default_params }
      it "returns http success" do
        expect(subject).to be_successful
      end
      it "does not display help page when the user logs out" do
        sign_out(@user)
        expect(subject).to_not be_successful
      end
    end
  end
end
