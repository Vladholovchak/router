# frozen_string_literal: true

require 'spec_helper'
require '../app'
require '../controllers/basic_controller'

describe 'App' do
  let(:app) { App.new }
  let(:response) { app.call(env) }
  let(:body)     { response[2][0] }
  let(:status)   { response[0] }

  context 'GET to /players/all' do
    let(:env) { { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/players/all' } }
    it 'has status 200' do
      expect(status).to eq 200
    end
    it 'has body players' do
      expect(body).to match(/player_\d/)
    end
  end

  context 'GET to /players/:id/info' do
    let(:env) { { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/players/5/info' } }

    it 'has status 200' do
      expect(status).to eq 200
    end

    it 'has body with player id' do
      expect(body).to eq 'player: 5'
    end
  end

  context 'GET to /items/all' do
    let(:env)  { { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/items/all' } }

    it 'has status 200' do
      expect(status).to eq 200
    end

    it 'has body items' do
      expect(body).to match(/item_\d/)
    end
  end

  context 'GET to /items/:id/info' do
    let(:env) { { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/items/4/info' } }

    it 'has status 200' do
      expect(status).to eq 200
    end

    it 'has body with item id' do
      expect(body).to eq 'items: 4'
    end
  end

  context 'status 404' do
    let(:env) { { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/item/info' } }
    it 'has status 404' do
      expect(response[0]).to eq 404
    end
  end
end
