   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  "    Cafe_Management3.ExxportSite   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     :uc+clr-namespace:Cafe_Management3.UserControlA     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     �Name$  window��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�
�������  MaterialDesignFont#���   � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=� � Title$ Danh mục vật tư��$	��700��$	��900��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+ �� ElementName$ window��� $��1�� �� $
��auto ��� $
��auto ��� .+�#  MaterialDesignThemes.Wpf.Card  $��0��$��5q�.��� 	 � ColumnDefinitions	 �� �� ��  �� .+�(  "System.Windows.Controls.DatePicker  -   
  Name$

 ngay��$��1��$��	136,5,5,5q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Ngày nhập�� ( $MaterialDesignFloatingHintDatePicker#��[ �� -    ��Name$
 vatu��$��0��$��0��$��5 5 5 5q�$ 	Vật tư�� �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ �� -   $	 dvt��$��0��$��1��$��	5,6,178,7q�$ Đơn vị tính�� . #��[ �� -    ��Name$ sl��$��Right=�$��1��$��2��$��5 5 5 5q�$ Số lượng�� % !MaterialDesignFloatingHintTextBox#��[   $��1��$��5q�.��� .+��� -    ��Name$
 them��
�����F�
���   �
��� � �$��Thêm��$��5q�$	��100���� -   $	 sua��
�����F�
���   �
��� � �$��Sửa��$��5q�$	��100���� -   $	 xoa��
�����F�
���   �
��� � �$��Xóa��$��5q�$	��100��  $��2��$��5q�$��Stretch=�.���� $
��Auto=�.��� .+�  $��5q�$��Stretch=�.���� $
��Auto=�.��&   System.Windows.Controls.DataGrid  -	     Name$ hoa_don��   
IsReadOnly . $
��auto������    Columns 