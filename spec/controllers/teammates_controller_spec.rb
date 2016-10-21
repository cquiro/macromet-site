require 'rails_helper'

RSpec.describe TeammatesController, type: :controller do

  describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested teammate to @teammate" do
      teammate = create(:teammate)
      get :show, id: teammate
      expect(assigns(:teammate)).to eq teammate
    end

    it "renders the :show template" do
      teammate = create(:teammate)
      get :show, id: teammate
      expect(response).to render_template :show
    end
  end
end
