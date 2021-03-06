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

describe YktNewsController do

  # This should return the minimal set of attributes required to create a valid
  # YktNew. As you add validations to YktNew, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "date" => "2013-02-26" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # YktNewsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all ykt_news as @ykt_news" do
      ykt_new = YktNew.create! valid_attributes
      get :index, {}, valid_session
      assigns(:ykt_news).should eq([ykt_new])
    end
  end

  describe "GET show" do
    it "assigns the requested ykt_new as @ykt_new" do
      ykt_new = YktNew.create! valid_attributes
      get :show, {:id => ykt_new.to_param}, valid_session
      assigns(:ykt_new).should eq(ykt_new)
    end
  end

  describe "GET new" do
    it "assigns a new ykt_new as @ykt_new" do
      get :new, {}, valid_session
      assigns(:ykt_new).should be_a_new(YktNew)
    end
  end

  describe "GET edit" do
    it "assigns the requested ykt_new as @ykt_new" do
      ykt_new = YktNew.create! valid_attributes
      get :edit, {:id => ykt_new.to_param}, valid_session
      assigns(:ykt_new).should eq(ykt_new)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new YktNew" do
        expect {
          post :create, {:ykt_new => valid_attributes}, valid_session
        }.to change(YktNew, :count).by(1)
      end

      it "assigns a newly created ykt_new as @ykt_new" do
        post :create, {:ykt_new => valid_attributes}, valid_session
        assigns(:ykt_new).should be_a(YktNew)
        assigns(:ykt_new).should be_persisted
      end

      it "redirects to the created ykt_new" do
        post :create, {:ykt_new => valid_attributes}, valid_session
        response.should redirect_to(YktNew.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ykt_new as @ykt_new" do
        # Trigger the behavior that occurs when invalid params are submitted
        YktNew.any_instance.stub(:save).and_return(false)
        post :create, {:ykt_new => { "date" => "invalid value" }}, valid_session
        assigns(:ykt_new).should be_a_new(YktNew)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        YktNew.any_instance.stub(:save).and_return(false)
        post :create, {:ykt_new => { "date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ykt_new" do
        ykt_new = YktNew.create! valid_attributes
        # Assuming there are no other ykt_news in the database, this
        # specifies that the YktNew created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        YktNew.any_instance.should_receive(:update_attributes).with({ "date" => "2013-02-26" })
        put :update, {:id => ykt_new.to_param, :ykt_new => { "date" => "2013-02-26" }}, valid_session
      end

      it "assigns the requested ykt_new as @ykt_new" do
        ykt_new = YktNew.create! valid_attributes
        put :update, {:id => ykt_new.to_param, :ykt_new => valid_attributes}, valid_session
        assigns(:ykt_new).should eq(ykt_new)
      end

      it "redirects to the ykt_new" do
        ykt_new = YktNew.create! valid_attributes
        put :update, {:id => ykt_new.to_param, :ykt_new => valid_attributes}, valid_session
        response.should redirect_to(ykt_new)
      end
    end

    describe "with invalid params" do
      it "assigns the ykt_new as @ykt_new" do
        ykt_new = YktNew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        YktNew.any_instance.stub(:save).and_return(false)
        put :update, {:id => ykt_new.to_param, :ykt_new => { "date" => "invalid value" }}, valid_session
        assigns(:ykt_new).should eq(ykt_new)
      end

      it "re-renders the 'edit' template" do
        ykt_new = YktNew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        YktNew.any_instance.stub(:save).and_return(false)
        put :update, {:id => ykt_new.to_param, :ykt_new => { "date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ykt_new" do
      ykt_new = YktNew.create! valid_attributes
      expect {
        delete :destroy, {:id => ykt_new.to_param}, valid_session
      }.to change(YktNew, :count).by(-1)
    end

    it "redirects to the ykt_news list" do
      ykt_new = YktNew.create! valid_attributes
      delete :destroy, {:id => ykt_new.to_param}, valid_session
      response.should redirect_to(ykt_news_url)
    end
  end

end
