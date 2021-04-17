require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe '店舗登録' do
    context '店舗登録できるとき' do
      it 'shop_name, address, phone_number, opening_hours, non_business_day, latitude, longitude が存在すれば登録できる' do
        expect(@spot).to be_valid
      end
    end
    context '店舗登録できないとき' do
      it 'shop_nameが空では登録できない' do
        @spot.shop_name = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include('Shop nameを入力してください')
      end
      it 'addressが空では登録できない' do
        @spot.address = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include('Addressを入力してください')
      end
    end
  end
end
