class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    
    enum payment_method: { クレジットカード: 0, 銀行振り込み: 1 }
    enum status: { 入金待ち: 0, 確認待ち: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4 }
    
    # #booksテーブルのpriceカラムの合計値を求めたい場合
    # array = [] #空の配列を用意し、
    # Order.all.each do |Order|
    #   array << order.count 
    #   #bookテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
    # end
    # array.sum #ここで合計を求める
    
    
end