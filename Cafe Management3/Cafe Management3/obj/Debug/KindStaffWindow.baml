   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5	   
   &     Cafe_Management3.KindStaffWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5	   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � Title$# Danh mục loại nhân viên��5   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��600��5   	   $	��800��6   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+	 �� ElementName$	 xwindow��6K   5      � 5!   
   $��1��6    5"      �� 5#      $
��auto �6    60   �� 5$      $
��auto �6    60   �� 5%      6"   .+�5'      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5(      �  5)      �� 5*      6*   �� 5+      6*   �� 5,      6*   
 � ColumnDefinitions
 5.      �� 5/      6-   �� 50      6-   .+�52      �� -   5         ��Name$ maloai��52      $��0��6.   $��0��6;   $��5q�6K   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã loại nhân viên��6V    % !MaterialDesignFloatingHintTextBox#��[ 6�   �� 53      -   5        $ tenloai��53      $��1��6/   $��0��6<   $��5q�6L   $ Tên loại nhân viên��6W   #��[ 6�   �� 54      -   5        $ luong��54   K   $��0��6   $��Right=�6'   $��0��6Z   $��1��6�   $��5q�6�   $ Lương��6�   #��[ 6�   55      56        57      $��1��6"   $��5q�6/   .��58      � .+�59      �� -   5         ��Name$
 them��59   j   $��Thêm��6   
��� � �
�����F�
���   �$��5q�6x   $	��100��6�   6�   �� 5:      -   5        $	 sua��5:   [   
��� � �
�����F�
���   �$��Sửa��6h   $��5q�6w   $	��100��6�   6�   �� 5;      -   5        $	 xoa��5;   ?   $
��Xóa��6   
��� � �
�����F�
���   �$	��100��6v   6�   5<      5=        5?      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5@      �� $
��Auto=�6   .��5A      � .+�5B        $��5q�6.   $��Stretch=�69   .��5C      �� $
��Auto=�6+   .��5D   "   &   System.Windows.Controls.DataGrid  -   5          Name$ hoa_don��5D   �      
IsReadOnly . $
��auto��6�   ��6i   ��    Columns 5E   &   5G   #   5H      5I      5J      5K      5L      5M      5N      5O      