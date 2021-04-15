require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビュー投稿' do
    context 'レビュー投稿できるとき' do
      it 'overall_evaluation, comment, atmosphere, network_stability, facility, congestion, corona_countermeasure が存在すれば登録できる' do
        expect(@review).to be_valid
      end
    end

    context 'レビュー投稿できないとき' do
      it 'overall_evaluationが空では登録できない' do
        @review.overall_evaluation = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("総合評価を入力してください")
      end
    #   it 'commentが空では登録できない' do

    #   end
    #   it 'overall_evaluationが空では登録できない' do

    #   end
    #   it 'overall_evaluationが空では登録できない' do

    #   end
    #   it 'overall_evaluationが空では登録できない' do

    #   end
    #   it 'overall_evaluationが空では登録できない' do

    #   end
    #   it 'overall_evaluationが空では登録できない' do

    #   end
    end
  end
end
