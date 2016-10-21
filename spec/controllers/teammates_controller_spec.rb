require 'rails_helper'

RSpec.describe TeammatesController, type: :controller do

  describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of all teammates" do
      jack = create(:teammate, name: "Jack Reacher")
      ethan = create(:teammate, name: "Ethan Hunt")
      jason = create(:teammate, name: "Jason Bourne")
      get :index
      expect(assigns(:teammates)).to match([jack, ethan, jason])
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

  describe "GET #new" do
    it "assigns a new Teammate to @teammate" do
      get :new
      expect(assigns(:teammate)).to be_a_new(Teammate)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested teammate to @temmate" do
      teammate = create(:teammate)
      get :edit, id: teammate
      expect(assigns(:teammate)).to eq teammate
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new teammate in the database" do
        expect{
          post :create, teammate: attributes_for(:teammate)
        }.to change(Teammate, :count).by(1)
      end

      it "redirects to teammates#show" do
        post :create, teammate: attributes_for(:teammate)
        expect(response).to redirect_to teammate_path(assigns(:teammate))
      end
    end

    context "with invalid attributes" do
      it "does not save the new teammate in the database" do
        expect{
          post :create, teammate: attributes_for(:invalid_teammate)
        }.not_to change(Teammate, :count)
      end

      it "re-renders the :new template" do
        post :create, teammate: attributes_for(:invalid_teammate)
        expect(response).to render_template :new
      end
    end
  end
end
