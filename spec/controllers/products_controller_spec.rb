require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "populates an array of all products" do
      grill = create(:product, name: "Grill")
      fence = create(:product, name: "Fence")
      sword = create(:product, name: "Sword")
      get :index
      expect(assigns(:products)).to match [grill, fence, sword]
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :show, id: product
      expect(assigns(:product)).to eq product
    end

    it "renders the :show template" do
      product = create(:product)
      get :show, id: product
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Product to @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :edit, id: product
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
      product = create(:product)
      get :edit, id: product
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new product in the database"
      it "redirects to products#show"
    end

    context "with invalid attributes" do
      it "does not save the new product in the database"
      it "re-renders the :new template"
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the product in the database"
      it "redirects to the product"
    end

    context "with invalid attributes" do
      it "does not upadate the product"
      it "re-renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the product from the database"
    it "redirects to products#index"
  end
end
