# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, user:) }
  let(:past_event) { create(:event, :past, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns future events to @upcomming_events' do
      event
      past_event
      get :index
      expect(assigns(:upcomming_events)).to eq([event])
    end

    it 'assigns past events to @past_events' do
      event
      past_event
      get :index
      expect(assigns(:past_events)).to eq([past_event])
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: event.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:event, user_id: user.id) }

      it 'creates a new Event' do
        expect do
          post :create, params: { event: valid_attributes }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to the events list' do
        post :create, params: { event: valid_attributes }
        expect(response).to redirect_to(events_path)
        expect(flash[:notice]).to eq(I18n.t('events.created'))
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:event, name: nil, user_id: user.id) }

      it 'does not create a new Event' do
        expect do
          post :create, params: { event: invalid_attributes }
        end.not_to change(Event, :count)
      end

      it 'renders the new template with an error status' do
        post :create, params: { event: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Event Name' } }

      it 'updates the requested event' do
        put :update, params: { id: event.to_param, event: new_attributes }
        event.reload
        expect(event.name).to eq('Updated Event Name')
      end

      it 'redirects to the events list' do
        put :update, params: { id: event.to_param, event: new_attributes }
        expect(response).to redirect_to(events_path)
        expect(flash[:notice]).to eq(I18n.t('events.updated'))
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not update the event and renders the edit template' do
        put :update, params: { id: event.to_param, event: invalid_attributes }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested event' do
      event = create(:event, user:)
      expect do
        delete :destroy, params: { id: event.to_param }
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      delete :destroy, params: { id: event.to_param }
      expect(response).to redirect_to(events_url)
      expect(flash[:notice]).to eq(I18n.t('events.destroyed'))
    end
  end
end
