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
    before :each do
      @teammate = create(:teammate)
    end

    context "logged out" do
      it "requires login" do
        get :show, id: @teammate
        expect(response).to be_redirect
        expect(response).to redirect_to macromet_manejo_contenido_path
      end
    end

    context "logged in" do
      before :each do
        sign_in(build_stubbed(:user))
      end

      it "assigns the requested teammate to @teammate" do
        get :show, id: @teammate
        expect(assigns(:teammate)).to eq @teammate
      end

      it "renders the :show template" do
        get :show, id: @teammate
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    context "logged out" do
      it "requires login" do
        get :new
        expect(response).to be_redirect
        expect(response).to redirect_to macromet_manejo_contenido_path
      end
    end

    context "logged in" do
      before :each do
        sign_in(build_stubbed(:user))
      end

      it "assigns a new Teammate to @teammate" do
        get :new
        expect(assigns(:teammate)).to be_a_new(Teammate)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
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
    context "logged out" do
      it "requires login" do
        post :create, teammate: attributes_for(:teammate)
        expect(response).to be_redirect
        expect(response).to redirect_to macromet_manejo_contenido_path
      end
    end

    context "logged in" do
      before :each do
        sign_in(:user)
      end

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

  describe "PATCH# update" do
    before :each do
      @teammate = create(:teammate, name: "Bruce Wayne", position: "Superhero")
    end

    context "logged out" do
      it "requires login" do
        patch :update, id: @teammate, teammate: attributes_for(:teammate)
        expect(response).to be_redirect
        expect(response).to redirect_to macromet_manejo_contenido_path
      end
    end

    context "logged in" do
      before :each do
        sign_in(build_stubbed(:user))
      end

      context "with valid attributes" do
        it "locates the requested @teammate" do
          patch :update, id: @teammate, teammate: attributes_for(:teammate)
          expect(assigns(:teammate)).to eq(@teammate)
        end

        it "changes @temmate's attributes" do
          patch :update, id: @teammate, 
            teammate: attributes_for(:teammate, 
              name: "Jason Bourne", 
              position: "Spy")
          @teammate.reload
          expect(@teammate.name).to eq("Jason Bourne")
          expect(@teammate.position).to eq("Spy")
        end

        it "redirects to the updated contact" do
          patch :update, id: @teammate, teammate: attributes_for(:teammate)
          expect(response).to redirect_to @teammate
        end
      end
      
      context "with invalid attributes" do
        it "does not change the teammate's attributes" do
          patch :update, id: @teammate, 
            teammate: attributes_for(:teammate, name: nil, position: "Spy")
          @teammate.reload
          expect(@teammate.name).to eq("Bruce Wayne")
          expect(@teammate.position).not_to eq("Spy")
        end

        it "re-renders the :edit template" do
          patch :update, id: @teammate,
            teammate: attributes_for(:invalid_teammate)
          expect(response).to render_template :edit
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @teammate = create(:teammate)
    end

    context "logged out" do
      it "requires login" do
        delete :destroy, id: @teammate
        expect(response).to be_redirect
        expect(response).to redirect_to macromet_manejo_contenido_path
      end
    end

    context "logged in" do
      it "deletes the contact" do
        sign_in(build_stubbed(:user))
        expect{
          delete :destroy, id: @teammate
        }.to change(Teammate, :count).by(-1)
      end
    end
  end
end
