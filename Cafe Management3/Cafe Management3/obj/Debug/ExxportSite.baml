   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
   "    Cafe_Management3.ExxportSite   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục vật tư��5   	   $	��700��6!   $	��900��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+ �� ElementName$ window��6J   5      � 5   
   $��1��6    5      �� 5       $
��auto �6    60   �� 5!      $
��auto �6    60   �� 5"      6"   .+�5&      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5'      � 	 � ColumnDefinitions	 5(      �� 5)      6-   �� 5*      6-   �� 5+      6-    5-      �� 5.      6*   .+�50      (  "System.Windows.Controls.DatePicker  -   5        
  Name$

 ngay��50   !   $��1��60   $��	136,5,5,5q�6@   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Ngày nhập��51       ( $MaterialDesignFloatingHintDatePicker#��[ 52      �� 53      -   5         ��Name$
 vatu��53      $��0��6-   $��0��6:   $��5 5 5 5q�6J   $ 	Vật tư��6[    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 6�   6�   �� 54      -   5        $	 dvt��54      $��0��6,   $��1��69   $��	5,6,178,7q�6I   $ Đơn vị tính��6\    . #��[ 6�   6�   �� 55      -   5         ��Name$ sl��55   �   $��Right=�6   $��1��6�   $��2��6�   $��5 5 5 5q�6�   $ Số lượng��6�    % !MaterialDesignFloatingHintTextBox#��[ 6�   56      57        59      $��1��6"   $��5q�6/   .��5:      � .+�5;      �� -   5         ��Name$
 them��5;      
�����F�
���   �
��� � �$��Thêm��6i   $��5q�6x   $	��100��6�   6�   �� 5<      -   5        $	 sua��5<      
�����F�
���   �
��� � �$��Sửa��6i   $��5q�6x   $	��100��6�   6�   �� 5=      -   5        $	 xoa��5=      
�����F�
���   �
��� � �$��Xóa��6j   $��5q�6y   $	��100��6�   6�   5>      5?        5A      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5B      �� $
��Auto=�6   .��5C      � .+�5D        $��5q�6.   $��Stretch=�69   .��5E      �� $
��Auto=�6+   .��5F   "   &   System.Windows.Controls.DataGrid  -	   5          Name$ hoa_don��5F   �      
IsReadOnly . $
��auto��6�   ��6i   ��    Columns 5G   &   5I   #   5J      5K      5L      5M      5N      5O      5P      5Q      