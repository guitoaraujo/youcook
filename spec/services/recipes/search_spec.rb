# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipes::Search do
  describe '.call' do
    subject(:call) do
      described_class.new(recipes_params).call
    end

    let!(:recipes_params) { { terms: terms, filter: filter, page: '1' } }

    context 'When filter is INGREDIENTS' do
      let!(:filter) { 'Ingredients' }

      context 'when it HAS NOT terms' do
        let!(:terms) { nil }

        let!(:recipes) { create_list(:recipe, 15) }

        it 'returns 10 recipe' do
          expect(subject.size).to eq(10)
        end
      end

      context 'when it HAS recipes with these terms' do
        let!(:terms) { 'ing_100' }
        let!(:recipe) { create(:recipe, :recipe_with_defined_ingredients) }

        it 'returns 1 recipe' do
          expect(subject.size).to eq(1)
        end
      end

      context 'when it HAS NOT recipes with these terms' do
        let!(:terms) { '1234567890 aaabbbccc dddeeefff' }
        let!(:recipes) { create_list(:recipe, 50) }

        it 'returns 0 recipes' do
          expect(subject.size).to eq(0)
        end
      end
    end
  end
end
