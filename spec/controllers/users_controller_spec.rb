require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { create(:user) }

  it "index" do
    get :index
    expect(response).to render_template("index")
    expect(response).to have_http_status(200)
  end

  it "new" do
    get :new
    expect(response).to render_template("new")
    expect(response).to have_http_status(200)
  end

  it "edit" do
    get :edit, params: {id: user.id}
    expect(response).to render_template("edit")
    expect(response).to have_http_status(200)
  end

  it "creates new" do
    params = {
      first_name: 'Le',
      last_name: 'Phong',
      user: {
        team_id: ''
      }
    }
    post :create, params: params
    expect(response).to redirect_to :action => :index
    expect(response).to have_http_status(302)
  end

  let (:team) { create(:team, :with_players) }
  it "does not create new record if team is full" do
    params = {
      first_name: 'Le',
      last_name: 'Phong',
      user: {
        team_id: team.id
      }
    }
    post :create, params: params
    expect(response).to redirect_to :action => :new
    expect(response).to have_http_status(302)
  end

  it "updates" do
    params = {
      id: user.id,
      first_name: 'Le',
      last_name: 'Phong',
      user: {
        team_id: ''
      }
    }
    put :update, params: params
    expect(response).to redirect_to :action => :index
    expect(response).to have_http_status(302)
  end

  let (:team) { create(:team, :with_users) }
  it "does not update record if team is full" do
    params = {
      id: user.id,
      first_name: 'Le',
      last_name: 'Phong',
      user: {
        team_id: team.id
      }
    }
    put :update, params: params
    expect(response).to redirect_to :action => :edit
    expect(response).to have_http_status(302)
  end

  it "deleted" do
    params = {
      id: user.id
    }
    delete :destroy, params: params
    expect(response).to redirect_to :action => :index
    expect(response).to have_http_status(302)
  end
end