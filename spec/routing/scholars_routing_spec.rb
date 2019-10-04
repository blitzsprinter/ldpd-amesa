require "rails_helper"

RSpec.describe ScholarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/scholars").to route_to("scholars#index")
    end

    it "routes to #new" do
      expect(:get => "/scholars/new").to route_to("scholars#new")
    end

    it "routes to #show" do
      expect(:get => "/scholars/1").to route_to("scholars#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scholars/1/edit").to route_to("scholars#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/scholars").to route_to("scholars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scholars/1").to route_to("scholars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scholars/1").to route_to("scholars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scholars/1").to route_to("scholars#destroy", :id => "1")
    end
  end
end
