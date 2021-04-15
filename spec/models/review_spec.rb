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
      it 'overall_evaluationが6以上では登録できない' do
        @review.overall_evaluation = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("総合評価は5以下の値にしてください")
      end
      it 'commentが空では登録できない' do
        @review.comment = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("コメントを入力してください")
      end
      it "commentが400文字以上では登録できない" do
        @review.comment = "a" * 401
        @review.valid?
        expect(@review.errors.full_messages).to include("コメントは400文字以内で入力してください")
      end
      it 'atmosphereが空では登録できない' do
        @review.atmosphere = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("雰囲気を入力してください")
      end
      it 'atmosphereが6以上では登録できない' do
        @review.atmosphere = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("雰囲気は5以下の値にしてください")
      end
      it 'network_stabilityが空では登録できない' do
        @review.network_stability = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("ネット環境を入力してください")
      end
      it 'network_stabilityが6以上では登録できない' do
        @review.network_stability = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("ネット環境は5以下の値にしてください")
      end
      it 'facilityが空では登録できない' do
        @review.facility = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("店内設備を入力してください")
      end
      it 'facilityが6以上では登録できない' do
        @review.facility = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("店内設備は5以下の値にしてください")
      end
      it 'congestionが空では登録できない' do
        @review.congestion = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("混雑度を入力してください")
      end
      it 'congestionが6以上では登録できない' do
        @review.congestion = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("混雑度は5以下の値にしてください")
      end
      it 'corona_countermeasureが空では登録できない' do
        @review.corona_countermeasure = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("コロナ対策を入力してください")
      end
      it 'corona_countermeasureが6以上では登録できない' do
        @review.corona_countermeasure = 6
        @review.valid?
        expect(@review.errors.full_messages).to include("コロナ対策は5以下の値にしてください")
      end
    end
  end
end
