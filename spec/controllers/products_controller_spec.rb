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
      it "saves the new product in the database" do
        expect{
          post :create, product: attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "redirects to products#show" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end

    context "with invalid attributes" do
      it "does not save the new product in the database" do
        expect{
          post :create, product: attributes_for(:invalid_product)
        }.not_to change(Product, :count)
      end

      it "re-renders the :new template" do
        post :create, product: attributes_for(:invalid_product)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @product = create(:product, name: "Gun", description: "Fires")
    end

    context "with valid attributes" do
      it "locates the requested product" do
        patch :update, id: @product, product: attributes_for(:product)
        expect(assigns(:product)).to eq @product
      end

      it "updates the product in the database" do
        patch :update, id: @product, 
          product: attributes_for(:product,
            name:"Sword",
            description: "Cuts")
        @product.reload
        expect(@product.name).to eq "Sword"
        expect(@product.description).to eq "Cuts"
      end

      it "redirects to the updated product" do
        patch :update, id: @product, product: attributes_for(:product)
        expect(response).to redirect_to @product
      end
    end

    context "with invalid attributes" do
      it "does not upadate the product" do
        patch :update, id: @product, 
          product: attributes_for(:invalid_product,
            description: "Cuts")
        @product.reload
        expect(@product.name).to eq "Gun"
        expect(@product.description).not_to eq "Cuts"
      end

      it "re-renders the :edit template" do
        patch :update, id: @product, 
          product: attributes_for(:invalid_product,
            description: "Cuts")
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @product = create(:product)
    end

    it "deletes the product from the database" do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_path
    end
  end
end