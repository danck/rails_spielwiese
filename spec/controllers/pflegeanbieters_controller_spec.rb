require 'spec_helper'

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

describe PflegeanbietersController do

  # This should return the minimal set of attributes required to create a valid
  # Pflegeanbieter. As you add validations to Pflegeanbieter, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PflegeanbietersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pflegeanbieters as @pflegeanbieters" do
      pflegeanbieter = Pflegeanbieter.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pflegeanbieters).should eq([pflegeanbieter])
    end
  end

  describe "GET show" do
    it "assigns the requested pflegeanbieter as @pflegeanbieter" do
      pflegeanbieter = Pflegeanbieter.create! valid_attributes
      get :show, {:id => pflegeanbieter.to_param}, valid_session
      assigns(:pflegeanbieter).should eq(pflegeanbieter)
    end
  end

  describe "GET new" do
    it "assigns a new pflegeanbieter as @pflegeanbieter" do
      get :new, {}, valid_session
      assigns(:pflegeanbieter).should be_a_new(Pflegeanbieter)
    end
  end

  describe "GET edit" do
    it "assigns the requested pflegeanbieter as @pflegeanbieter" do
      pflegeanbieter = Pflegeanbieter.create! valid_attributes
      get :edit, {:id => pflegeanbieter.to_param}, valid_session
      assigns(:pflegeanbieter).should eq(pflegeanbieter)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pflegeanbieter" do
        expect {
          post :create, {:pflegeanbieter => valid_attributes}, valid_session
        }.to change(Pflegeanbieter, :count).by(1)
      end

      it "assigns a newly created pflegeanbieter as @pflegeanbieter" do
        post :create, {:pflegeanbieter => valid_attributes}, valid_session
        assigns(:pflegeanbieter).should be_a(Pflegeanbieter)
        assigns(:pflegeanbieter).should be_persisted
      end

      it "redirects to the created pflegeanbieter" do
        post :create, {:pflegeanbieter => valid_attributes}, valid_session
        response.should redirect_to(Pflegeanbieter.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pflegeanbieter as @pflegeanbieter" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pflegeanbieter.any_instance.stub(:save).and_return(false)
        post :create, {:pflegeanbieter => { "name" => "invalid value" }}, valid_session
        assigns(:pflegeanbieter).should be_a_new(Pflegeanbieter)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pflegeanbieter.any_instance.stub(:save).and_return(false)
        post :create, {:pflegeanbieter => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pflegeanbieter" do
        pflegeanbieter = Pflegeanbieter.create! valid_attributes
        # Assuming there are no other pflegeanbieters in the database, this
        # specifies that the Pflegeanbieter created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pflegeanbieter.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => pflegeanbieter.to_param, :pflegeanbieter => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested pflegeanbieter as @pflegeanbieter" do
        pflegeanbieter = Pflegeanbieter.create! valid_attributes
        put :update, {:id => pflegeanbieter.to_param, :pflegeanbieter => valid_attributes}, valid_session
        assigns(:pflegeanbieter).should eq(pflegeanbieter)
      end

      it "redirects to the pflegeanbieter" do
        pflegeanbieter = Pflegeanbieter.create! valid_attributes
        put :update, {:id => pflegeanbieter.to_param, :pflegeanbieter => valid_attributes}, valid_session
        response.should redirect_to(pflegeanbieter)
      end
    end

    describe "with invalid params" do
      it "assigns the pflegeanbieter as @pflegeanbieter" do
        pflegeanbieter = Pflegeanbieter.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pflegeanbieter.any_instance.stub(:save).and_return(false)
        put :update, {:id => pflegeanbieter.to_param, :pflegeanbieter => { "name" => "invalid value" }}, valid_session
        assigns(:pflegeanbieter).should eq(pflegeanbieter)
      end

      it "re-renders the 'edit' template" do
        pflegeanbieter = Pflegeanbieter.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pflegeanbieter.any_instance.stub(:save).and_return(false)
        put :update, {:id => pflegeanbieter.to_param, :pflegeanbieter => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pflegeanbieter" do
      pflegeanbieter = Pflegeanbieter.create! valid_attributes
      expect {
        delete :destroy, {:id => pflegeanbieter.to_param}, valid_session
      }.to change(Pflegeanbieter, :count).by(-1)
    end

    it "redirects to the pflegeanbieters list" do
      pflegeanbieter = Pflegeanbieter.create! valid_attributes
      delete :destroy, {:id => pflegeanbieter.to_param}, valid_session
      response.should redirect_to(pflegeanbieters_url)
    end
  end

end
