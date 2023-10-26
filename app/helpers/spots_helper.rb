module SpotsHelper
  # tag.id に基づいて背景色を返す
  def tag_color(tag_id)
    case tag_id
    when 1
      "#FB0032" #PayPay
    when 2
      "#BF0000" #楽天Pay
    when 3
      "#CC0134" #d払い
    when 4
      "#28C34E" #LINE Pay
    when 5
      "#EB5605" #au PAY
    when 6
      "#E4C402" #iD
    when 7
      "#0E1F87" #QUICPAY
    when 8
      "#58B531" #Suica
    when 9
      "#1433CB" #VISA
    when 10
      "#EB5E14" #Master
    when 11
      "#0D1434" #JCB
    else
      "#CCCCCC"
    end
  end
end