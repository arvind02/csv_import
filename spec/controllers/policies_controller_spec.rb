require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PoliciesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Policy. As you add validations to Policy, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PoliciesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all policies as @policies" do
      policy = Policy.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:policies)).to eq([policy])
    end
  end

  describe "GET show" do
    it "assigns the requested policy as @policy" do
      policy = Policy.create! valid_attributes
      get :show, {:id => policy.to_param}, valid_session
      expect(assigns(:policy)).to eq(policy)
    end
  end

  describe "GET new" do
    it "assigns a new policy as @policy" do
      get :new, {}
      expect(assigns(:policy)).to be_a_new(Policy)
    end
  end

  describe "GET edit" do
    it "assigns the requested policy as @policy" do
      policy = Policy.create! valid_attributes
      get :edit, {:id => policy.to_param}, valid_session
      expect(assigns(:policy)).to eq(policy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Policy" do
        expect {
          post :create, {:policy => valid_attributes}, valid_session
        }.to change(Policy, :count).by(1)
      end

      it "assigns a newly created policy as @policy" do
        post :create, {:policy => valid_attributes}, valid_session
        expect(assigns(:policy)).to be_a(Policy)
        expect(assigns(:policy)).to be_persisted
      end

      it "redirects to the created policy" do
        post :create, {:policy => valid_attributes}, valid_session
        expect(response).to redirect_to(Policy.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved policy as @policy" do
        post :create, {:policy => invalid_attributes}, valid_session
        expect(assigns(:policy)).to be_a_new(Policy)
      end

      it "re-renders the 'new' template" do
        post :create, {:policy => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested policy" do
        policy = Policy.create! valid_attributes
        put :update, {:id => policy.to_param, :policy => new_attributes}, valid_session
        policy.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested policy as @policy" do
        policy = Policy.create! valid_attributes
        put :update, {:id => policy.to_param, :policy => valid_attributes}, valid_session
        expect(assigns(:policy)).to eq(policy)
      end

      it "redirects to the policy" do
        policy = Policy.create! valid_attributes
        put :update, {:id => policy.to_param, :policy => valid_attributes}, valid_session
        expect(response).to redirect_to(policy)
      end
    end

    describe "with invalid params" do
      it "assigns the policy as @policy" do
        policy = Policy.create! valid_attributes
        put :update, {:id => policy.to_param, :policy => invalid_attributes}, valid_session
        expect(assigns(:policy)).to eq(policy)
      end

      it "re-renders the 'edit' template" do
        policy = Policy.create! valid_attributes
        put :update, {:id => policy.to_param, :policy => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested policy" do
      policy = Policy.create! valid_attributes
      expect {
        delete :destroy, {:id => policy.to_param}, valid_session
      }.to change(Policy, :count).by(-1)
    end

    it "redirects to the policies list" do
      policy = Policy.create! valid_attributes
      delete :destroy, {:id => policy.to_param}, valid_session
      expect(response).to redirect_to(policies_url)
    end
  end

end
