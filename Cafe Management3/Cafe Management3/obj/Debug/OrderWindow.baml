   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   	   "    Cafe_Management3.OrderWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   
   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   -   5        $��orderwindow��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignPaper#���  5        MaterialDesignFont#���  5       � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   
   $	��750��5   	   $
��1350��6    � Title$ THE COFFE HOUSE��5   	   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+	   CommandParameter	 5   $   �� 
 �� ElementName$
 orderwindow��5      .��5      �  � RowDefinitions 5!   
   �� 5"      $
��auto �6   6,   �� 5#      6   .+�5%   
   � $��0��6   .+�5&      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+$
 orderwindow��6O   5'      �� 5(   
   -   5         ��Name$ 
tabcontrol��5(      $��0,0,0,0q�6X   $��1��6j   $
��Left=�6w   $
��auto��6�   $	��Top=�6�   $
��auto��6�   .@�5)      �� $��Order��6   .��5*      �  � ColumnDefinitions 5,      �� 5-      $	��670 �6+   69   �� 5.      6-   .+�50      � $��0��6    51      �� 52      $��70 �6,   6:   �� 53      6.   .+�55      � $��0��6    56      �� 57   "   $	��75* �63   �� 58   "   $	��24* �63   �� 59   "   $
��602* �63   .+�5;      �� -   5        $��cb_mon��5;   '   $��0��65   $��
10,15,0,15q�6B   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tìm kiếm món��6�    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 6�   $��3��6  $
��Left=�6  $	��332��60  �� 5<      -   5        
���   �$��15(�5<   P   $��Refesh��6^   
�������
��� � �$��0��6�   $��2��6�   $��
295,23,0,0q�6�   $
��Left=�6�   $	��104��6�    J� RenderTransformOrigin$ 0.49,-0.031&�6�   $	��Top=�6  5=      � 5>      $��1��6    5?      �� 5@   "   $	��87* �63   �� 5A   "   $	��47* �63   .+�5C      �� $��Disabled=�6+   $
��Auto=�6T   $��2��6w   .��5D   "   � -   5        $��x��5D   ,    � Orientation$ 
Horizontal=�65   5E   #   5F      5G      5H      � 5I      $��1��6    5J      �� 5K      $	��500 �6,   6;   �� 5L      6.   .+�5N      #  MaterialDesignThemes.Wpf.Card  $��5q�6.   $��Stretch=�69   .��5O      �� $
��Auto=�6+   .��5P   "   &	   System.Windows.Controls.DataGrid	  -   5         	 Name$ 	list_View��5P   +    	  Columns 5Q   &   0
  *System.Windows.Controls.DataGridTextColumn
  5R   *   ,  &System.Windows.Controls.DataGridColumn   
IsReadOnly .    MaxWidth$ 0Q�6O      Header$  ��6s   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6\   �� *id+6   
  5S   *    .    Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6P   $ 	Tên món��6y    6]   �� *	ten_mon+6�   
  5T   *    . $
 auto 6O   $ Số lượng��6y    6\   �� *
so_luong+6�   4  .System.Windows.Controls.DataGridTemplateColumn  5U   *      CellTemplate 5V   .   �� 5W   2   .R�5X   6   �� -   5        
���   ���5X   =   Z� ��6j   Z� .��5Y   :   '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Plus=�6R   5Z   7   5[   3   5]   +     5^   *    5_   .   �� 5`   2   .R�5a   6   �� -   5        
���   ���5a   =   Z� ��6S   Z� .��5b   :     $ Minus=�6R   5c   7   5d   3   5f   +   
  5g   *    . $
 auto 6O   $ 
Đơn giá��6x    6\   �� *	don_gia+6�   
  5h   *    . $
 auto 6O   $ Thành tiền��6{    6\   �� *
thanh_tien+6�     5i   *    5j   .   �� 5k   2   .R�5l   6   �� -	   5        
���   ���5l   =   Z� ��6k   Z� .��5m   :     $ Delete=�6R   5n   7   5o   3   5q   +   
  5r   *    . $ 0Q�6O   $ Mã món��6w    6\   �� *ma_mon+6�   5t   #   5u      5v      � 5w      $��1��6    5x      �� 5y   "   $	��500 �63   6A   �� 5z   "   65   .+�5|      � $��0��6#    5}   "   �� 5~   &   66   �� 5   &   66   �� 5�   &   66   .+�5�   "   � $��0��6'    5�   &   �� 5�   *   6=   �� 5�   *   6=   .+�5�   &   �� $��17(�6,   $
��Bold"�6:   $	��150��6L   $��5,13,0,3q�6X   $
��Left=�6j   $��0��6�   $��Tổng tiền hàng��6�   �� 5�   &   -
   5        $��	tien_hang��5�   \   $��0��6/    �� 
IsReadOnly .  �� TextAlignment$ Right=�6   $��17(�6�   $
��Bold"�6�   $��
183,13,0,3q�6�   $	��247��6�   $
��Left=�6�   $��2��6�   .��6  5�   '   5�   #   � 5�   "   $��1��6'    5�   &   �� 5�   *   $	��47* �6;   6I   �� 5�   *   $��3* �6;   �� 5�   *   $	��18* �6;   6I   �� 5�   *   $	��32* �6;   .+�5�   &   �� $��17(�6,   $
��Bold"�6:   $	��150��6L   $��5,14,0,3q�6X   $
��Left=�6j   $��0��6�   $��Giảm giá��6�   �� 5�   &   -   5         ��Name$ giam_gia��5�   �   $��0��6�    .  $ Right=�6�   $��17(�6�   $
��Bold"�6�   $��
183,13,0,3q�6�   $	��247��6�   $
��Left=�6  $��4��6  .��63  5�   '   �� 5�   &   $��17(�6,   $
��Bold"�6:   $��46��6L   $��100,64,0,-48q�6W   $
��Left=�6m   $��3��6�   $
��VNĐ��6�   $ 0.783,0.361&�6�   �� 5�   &   $��17(�6,   $
��Bold"�6:   $��46��6L   $��
104,10,0,6q�6W   $
��Left=�6k   $��3��6�   $��%��6�   $ 0.783,0.361&�6�   5�   #   � 5�   "   $��2��6'    5�   &   �� 5�   *   6=   �� 5�   *   6=   .+�5�   &   �� $��17(�6,   $
��Bold"�6:   $	��150��6L   $��5,13,0,3q�6X   $
��Left=�6j   $��0��6�   $��Thanh toán��6�   �� 5�   &   -   5        $��
thanh_toan��5�   7   $��0��6.    . $ Right=�6[   $��17(�6q   $
��Bold"�6   $��
183,13,0,3q�6�   $	��249��6�   $
��Left=�6�   $��2��6�   5�   #   5�      �� 5�      $��17(�6$   $
��Bold"�62   $��46��6D   $��444,13,0,106q�6O   $
��Left=�6e   $��0��6�   $
��VNĐ��6�   $ 0.783,0.361&�6�   � 5�      $��1��6#   .+�5�   "   �� -   5        $��14(�5�   *   $
��Bold"�68   
���   �
��� � �
���   �$
��Auto��6�   $��
0,26,10,43q�6�   $ 0.511,0.802&�6�   .��6�   THANH TOÁN5�   #   5�      5�      5�      5�      5�      �� 5�      $#��Hóa đơn chưa hoàn thành��6   .��5�      � .+�5�        $��5q�6*   $��Stretch=�65   .��5�      �� $
��Auto=�6'   .��5�      	  -   5        $ hoa_don��5�   �    	  
IsReadOnly . $
��auto��6}   $	��800��6�   ��6e   ��  5�   "   5�      5�      5�      5�      5�      5�      5�      5�      