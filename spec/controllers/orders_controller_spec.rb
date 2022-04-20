require 'rails_helper'

describe OrdersController do

    before :each do
        Customer.create(name: "Nadiya", email: "nadiya@gmail.com")
    end

    describe 'GET #index' do
        it "populates an array of all Orders" do 
            order1 = create(:order, customer_id: 1, order_date: "2022/04/14", status: "NEW")
            order2 = create(:order, customer_id: 1, order_date: "2022/04/13", status: "NEW")
            get :index
            expect(assigns(:orders)).to match_array([order1, order2])
        end

        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end

    describe 'GET #show' do
        it "assigns the requested order to @order" do
            order = create(:order)
            get :show, params: { id: order }
            expect(assigns(:order)).to eq order
        end

        it "renders the :show template" do
            order = create(:order)
            get :show, params: { id: order }
            expect(response).to render_template :show
        end
    end

    describe 'GET #new' do
        it "assigns a new Order to @order" do
            get :new
            expect(assigns(:order)).to be_a_new(Order)
        end

        it "renders the :new template" do
            get :new
            expect(:response).to render_template :new
        end
    end

    describe 'GET #edit' do
        it "assigns the requested order to @order" do
            order = create(:order)
            get :edit, params: { id: order }
            expect(assigns(:order)).to eq order
        end

        it "renders the :edit template" do
            order = create(:order)
            get :edit, params: { id: order }
            expect(response).to render_template :edit
        end
    end

end