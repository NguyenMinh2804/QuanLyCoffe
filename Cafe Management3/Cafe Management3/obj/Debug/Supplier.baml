   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5	   
       Cafe_Management3.Supplier   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5	   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục nhân viên��5   	   $	��600��6$   $	��700��61   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+	 �� ElementName$	 window��6J   5       � 5"   
   $��1��6    5#      �� 5$      $
��auto �6    60   �� 5%      $
��auto �6    60   �� 5&      6"   .+�5(      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5)      �  5*      �� 5+      6*   �� 5,      6*   �� 5-      6*   �� 5.      6*   
 � ColumnDefinitions
 50      �� 51      6-   �� 52      6-   .+�54      �� -   5         ��Name$
 manv��54      $��0��6,   $��0��69   $��	5 5 100 0q�6I   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã nhà cung cấp��6\    % !MaterialDesignFloatingHintTextBox#��[ 6�   �� 55      -   5        $	 ten��55      $��1��6,   $��0��69   $��	5 0 100 0q�6I   $ Tên nhà cung cấp��6\   #��[ 6�   �� 56      -   5        $ diachi��56      $��2��6/   $��0��6<   $��	5 0 100 0q�6L   $ Địa chỉ��6_   #��[ 6�   �� 57      -   5        $ 	dienthoai��57      $��0��62   $��1��6?   $��	5 0 100 0q�6O   $ Điện thoại��6b   #��[ 6�   �� 58      -   5        $ email��58      $��1��6.   $��1��6;   $��	5 0 100 0q�6K   $ Email��6^   #��[ 6�   59      5:        5<      $��1��6"   $��5q�6/   .��5=      � .+�5>      �� -   5         ��Name$
 them��5>   0   
�����F�
���   �
��� � �$��Thêm��6|   $��5q�6�   $	��100��6�   6�   �� 5?      -   5        $	 sua��5?   0   
�����F�
���   �
��� � �$��Sửa��6|   $��5q�6�   $	��100��6�   6�   �� 5@      -	   5        $	 xoa��5@   /   
�����F�
���   �
��� � �$��Xóa��6z   $	��100��6�   5A      5B        5D      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5E      �� $
��Auto=�6   .��5F      � .+�5G        $��5q�6.   $��Stretch=�69   .��5H      �� $
��Auto=�6+   .��5I   "   &   System.Windows.Controls.DataGrid  -
   5          Name$ hoa_don��5I   �      
IsReadOnly . $
��auto��6�   ��6i   ��    Columns 5J   &   5L   #   5M      5N      5O      5P      5Q      5R      5S      5T      