紅綠燈
工作方法

請描寫出A 街道及B 街道的Traffic Light 系統，各街道分別有紅、黃、綠三種燈，分為以下兩種模式:
A
全自動模式：
當sw[0]為0時，Traffic Light 依照下列順序所示重複轉換：                                                                                                                               
請在七段顯示器顯示剩餘秒數 
A綠燈→ on ，B紅燈→ on ：5s (Others are off)
A黃燈→ on ，B紅燈→ on ：3s (Others are off)
A紅燈→ on ，B綠燈→ on ：4s (Others are off)
A紅燈→ on ，B黃燈→ on ：3s (Others are off)

B
手動模式：
當sw[0]為1時，Traffic Light狀態轉換為手動模式，由KEY2(iHand)控制，KEY2(iHand)被觸發時Traffic Light轉換至下一狀態，其他時間則維持原狀態不變，狀態順序和全自動模式相同。

架構圖

![image](https://github.com/idpp1237/verilog_homework/blob/master/trafficlight/architecture.jpg)





範例

![image](https://github.com/idpp1237/verilog_homework/blob/master/trafficlight/example.jpg)
