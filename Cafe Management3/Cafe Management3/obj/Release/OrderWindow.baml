   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  "    Cafe_Management3.OrderWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     :uc+clr-namespace:Cafe_Management3.UserControlA     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -   $��orderwindow��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���   � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=�$	��750��$
��1350�� � Title$ THE COFFE HOUSE��.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+	   CommandParameter	 �� 
 �� ElementName$
 orderwindow��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+$
 orderwindow���� -    ��Name$ 
tabcontrol��$��0,0,0,0q�$��1��$
��Left=�$
��auto��$	��Top=�$
��auto��.@��� $��Order��.���  � ColumnDefinitions �� $	��670 ��� .+�� $��0�� �� $��70 ��� .+�� $��0�� �� $	��75* ��� $	��24* ��� $
��602* �.+��� -   $��cb_mon��$��0��$��
10,15,0,15q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tìm kiếm món�� �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ $��3��$
��Left=�$	��332���� -   
���   �$��15(�$��Refesh��
�������
��� � �$��0��$��2��$��
295,23,0,0q�$
��Left=�$	��104�� J� RenderTransformOrigin$ 0.49,-0.031&�$	��Top=�� $��1�� �� $	��87* ��� $	��47* �.+��� $��Disabled=�$
��Auto=�$��2��.��� -   $��x�� � Orientation$ 
Horizontal=�� $��1�� �� $	��500 ��� .+�#  MaterialDesignThemes.Wpf.Card  $��5q�$��Stretch=�.���� $
��Auto=�.��&	   System.Windows.Controls.DataGrid	  -    	 Name$ 	list_View�� 	  Columns 0
  *System.Windows.Controls.DataGridTextColumn
  ,  &System.Windows.Controls.DataGridColumn   
IsReadOnly .    MaxWidth$ 0Q�   Header$  ��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *id+
   .    Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto $ 	Tên món�� �� *	ten_mon+
   . $
 auto $ Số lượng�� �� *
so_luong+4  .System.Windows.Controls.DataGridTemplateColumn     CellTemplate �� .R��� -   
���   ���Z� ��Z� .��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Plus=�   �� .R��� -   
���   ���Z� ��Z� .��  $ Minus=�
   . $
 auto $ 
Đơn giá�� �� *	don_gia+
   . $
 auto $ Thành tiền�� �� *
thanh_tien+   �� .R��� -	   
���   ���Z� ��Z� .��  $ Delete=�
   . $ 0Q�$ Mã món�� �� *ma_mon+� $��1�� �� $	��500 ��� .+�� $��0�� �� �� �� .+�� $��0�� �� �� .+��� $��17(�$
��Bold"�$	��150��$��5,13,0,3q�$
��Left=�$��0��$��Tổng tiền hàng���� -
   $��	tien_hang��$��0�� �� 
IsReadOnly .  �� TextAlignment$ Right=�$��17(�$
��Bold"�$��
183,13,0,3q�$	��247��$
��Left=�$��2��.��� $��1�� �� $	��47* ��� $��3* ��� $	��18* ��� $	��32* �.+��� $��17(�$
��Bold"�$	��150��$��5,14,0,3q�$
��Left=�$��0��$��Giảm giá���� -    ��Name$ giam_gia��$��0�� .  $ Right=�$��17(�$
��Bold"�$��
183,13,0,3q�$	��247��$
��Left=�$��4��.���� $��17(�$
��Bold"�$��46��$��100,64,0,-48q�$
��Left=�$��3��$
��VNĐ��$ 0.783,0.361&��� $��17(�$
��Bold"�$��46��$��
104,10,0,6q�$
��Left=�$��3��$��%��$ 0.783,0.361&�� $��2�� �� �� .+��� $��17(�$
��Bold"�$	��150��$��5,13,0,3q�$
��Left=�$��0��$��Thanh toán���� -   $��
thanh_toan��$��0�� . $ Right=�$��17(�$
��Bold"�$��
183,13,0,3q�$	��249��$
��Left=�$��2���� $��17(�$
��Bold"�$��46��$��444,13,0,106q�$
��Left=�$��0��$
��VNĐ��$ 0.783,0.361&�� $��1��.+��� -   $��14(�$
��Bold"�
���   �
��� � �
���   �$
��Auto��$��
0,26,10,43q�$ 0.511,0.802&�.��THANH TOÁN�� $#��Hóa đơn chưa hoàn thành��.��� .+�  $��5q�$��Stretch=�.���� $
��Auto=�.��	  -   $ hoa_don�� 	  
IsReadOnly . $
��auto��$	��800������  