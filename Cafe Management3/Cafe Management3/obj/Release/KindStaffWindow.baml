   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  &     Cafe_Management3.KindStaffWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     :uc+clr-namespace:Cafe_Management3.UserControlA     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     �Name$  window��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�
�������  MaterialDesignFont#���   � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � Title$# Danh mục loại nhân viên�� � WindowStartupLocation$ CenterScreen=�$	��600��$	��800��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+	 �� ElementName$	 xwindow��� $��1�� �� $
��auto ��� $
��auto ��� .+�#  MaterialDesignThemes.Wpf.Card  $��0��$��5q�.���  �� �� �� 
 � ColumnDefinitions
 �� �� .+��� -    ��Name$ maloai��$��0��$��0��$��5q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã loại nhân viên�� % !MaterialDesignFloatingHintTextBox#��[ �� -   $ tenloai��$��1��$��0��$��5q�$ Tên loại nhân viên��#��[ �� -   $ luong��$��0��$��Right=�$��0��$��1��$��5q�$ Lương��#��[   $��1��$��5q�.��� .+��� -    ��Name$
 them��$��Thêm��
��� � �
�����F�
���   �$��5q�$	��100���� -   $	 sua��
��� � �
�����F�
���   �$��Sửa��$��5q�$	��100���� -   $	 xoa��$
��Xóa��
��� � �
�����F�
���   �$	��100��  $��2��$��5q�$��Stretch=�.���� $
��Auto=�.��� .+�  $��5q�$��Stretch=�.���� $
��Auto=�.��&   System.Windows.Controls.DataGrid  -     Name$ hoa_don��   
IsReadOnly . $
��auto������    Columns 