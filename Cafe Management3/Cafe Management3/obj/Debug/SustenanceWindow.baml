   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5	   
   '    !Cafe_Management3.SustenanceWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5	   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5       	 MonVM � DataContext# [ 5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$* $Danh mục đồ ăn, nước uống��5   	   $	��500��6+   $
��1000��68   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
	 � Tag	 6   �� *Title+
 �� ElementName$
 window��6J   5       � 5"   
   $��1��6    5#      �� 5$      $
��auto �6    60   �� 5%      $
��auto �6    60   �� 5&      6"   .+�5(      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5)      �  5*      �� 5+      6*   �� 5,      6*    � ColumnDefinitions 5.      �� 5/      6-   �� 50      6-   .+�52      �� $��0��6   $��0��6+   $��5q�6x   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã món��6�    % !MaterialDesignFloatingHintTextBox#��[ 6�   ��6;   �� *ma_mon+ �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 53      $��1��6   $��0��6+   $��5q�6y   $ 	Tên món��6�   #��[ 6�   ��6;   �� *	ten_mon+$ PropertyChanged=�6�   �� 54      $��0��6   $��1��6+   $��5,5,15,5q�6u   $
 Giá��6�   #��[ 6�   ��6;   �� *gia+$ PropertyChanged=�6�   �� 55      -   5         ��Name$	 cbb��55      $��1��6,   $��1��69    �� DisplayMemberPath$ ten_loaiMon��6I   $��5,7,15,0q�6i   $ Loại món��6�    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 63  $	��Top=�6o  ��6{   �� *
loai_mon+ �� SelectedItem 6�   �� *SelectedLoaiMon+ �� Mode$ TwoWay=�$ PropertyChanged=�6�  56      57        58      $��1��6"   $��5q�6/   .��59      � .+�5:      �� -   5        
�����F�
���   �
��� � �$��Thêm��5:   z   $��5q�6�   $	��100��6�   ��6[   �� *
AddCommand+6�   �� 5;      
�����F�
���   �
��� � �$��Sửa��6{   $��5q�6�   $	��100��6�   ��6[   �� *EditCommand+6�   �� 5<      
�����F�
���   �
��� � �$��Xóa��6}   $	��100��6�   ��6[   �� *DeleteCommand+6�   5=      5>        5@      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5A      �� $
��Auto=�6   .��5B      �� -   5         ��Name$ 	list_view��5B       ��63   �� *List+ 6Q   �� *SelectedItem+$ OneWayToSource=� �� View 5C      �� 5D      .P�5E   "   ��  �� Width$	 200��61   $��Mã món��6=    �� DisplayMemberBinding 6M   �� *ma_mon+6w   �� 5F   "   $	 200��61   $��	Tên món��6=    6N   �� *	ten_mon+6y   �� 5G   "   $	 200��61   $
��Giá��6=    6J   �� *gia+6q   �� 5H   "   $	 200��61   $��Loại món��6=    6O   �� *ten_loaiMon+6~   5I      5K      5L      5M      5N      5O      5P      