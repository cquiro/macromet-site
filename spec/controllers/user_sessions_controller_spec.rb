require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #create" do
    context "with correct credentials" do
      before :each do
        @user = create(:user)
      end

      it "redirects to contenido_path" do
        post :create, email: "james@bond.com", password: "password"

        expect(response).to be_redirect
        expect(response).to redirect_to contenido_path
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({
          email: "james@bond.com" 
        }).and_return(@user)
        post :create, email: "james@bond.com", password: "password"
      end

      it "authenticates the user" do
        allow(User).to receive(:find_by).and_return(@user)
        expect(@user).to receive(:authenticate)
        post :create, email: "james@bond.com", password: "password"
      end

      it "sets the user id in the session" do
        post :create, email: "james@bond.com", password: "password"
        expect(session[:user_id]).to eq @user.id
      end

      it "sets the flash success message" do
        post :create, email: "james@bond.com", password: "password"
        expect(flash[:success]).to eq "Has iniciado sesión"
      end
    end

    shared_examples_for "denied login" do
      it "renders the new template" do
        post :create, email: email, password: password
        expect(response).to render_template :new
      end

      it "sets the flash error message" do
        post :create, email: email, password: password
        expect(flash[:error]).to eq "Revisa tu usuario y contraseña e intenta de nuevo"
      end
    end
    
    context "with blank credentials" do
      let(:email) { "" }
      let(:password) { "" }
      it_behaves_like "denied login"
    end

    context "with incorrect password" do
      before :each do
        @user = create(:user)
      end

      let(:email) { @user.email }
      let(:password) { "incorrect" }
      it_behaves_like "denied login"
    end
    
    context "with no email in existence" do
      before :each do
        @user = create(:user)
      end

      let(:email) { "none@found.com" }
      let(:password) { "password" }
      it_behaves_like "denied login"
    end
  end

  describe "DELETE destroy" do
    context "logged in" do
      before :each do
        @user = create(:user)
        post :create, email: @user.email, password: "password" 
      end

      it "redirects to new_user_session_path" do
        delete :destroy
        expect(response).to redirect_to new_user_session_path
      end

      it "sets a notice flash message" do
        delete :destroy
        expect(flash[:notice]).to eq "La sesión ha finalizado"
      end

      it "removes the session[:user_id] key" do
        session[:user_id] = 1
        delete :destroy
        expect(session[:user_id]).to be_nil
      end

      it "resets the session" do
        expect(controller).to receive(:reset_session)
        delete :destroy
      end
    end
  end
end

