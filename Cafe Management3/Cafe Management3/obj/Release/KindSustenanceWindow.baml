   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  +    %Cafe_Management3.KindSustenanceWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     :uc+clr-namespace:Cafe_Management3.UserControlA     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     �Name$  window��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  	LoaiMonVM � DataContext# [ 
�������  MaterialDesignFont#���   � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=� � Title$1 +Danh mục loại đồ ăn, nước uống��$	��500��$	��600��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
	 � Tag	 �� *Title+
 �� ElementName$
 window��� $��1�� �� $
��auto ��� $
��auto ��� .+�#  MaterialDesignThemes.Wpf.Card  $��0��$��5q�.���  �� ��  � ColumnDefinitions �� �� $
��auto �.+��� $��0��$��0��$��5q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã loại món�� % !MaterialDesignFloatingHintTextBox#��[ ���� *
ma_loaiMon+ �� UpdateSourceTrigger$ PropertyChanged=��� $��1��$��0��$��5q�$ Tên loại món��#��[ ���� *ten_loaiMon+$ PropertyChanged=�  $��1��$��5q�.��� .+��� 
�����F�
���   �
��� � �$��Thêm��$��5q�$	��100������ *
AddCommand+�� 
�����F�
���   �
��� � �$��Sửa��$��5q�$	��100������ *EditCommand+�� 
�����F�
���   �
��� � �$��Xóa��$	��100������ *DeleteCommand+  $��2��$��5q�$��Stretch=�.���� $
��Auto=�.���� ���� *List+ �� Mode$ TwoWay=�$ PropertyChanged=� �� SelectedItem �� *SelectedItem+$ TwoWay=� �� View �� .P���  �� Width$	 200��$��Mã loại món�� �� DisplayMemberBinding �� *
ma_loaiMon+�� $	 300��$��Tên loại món�� �� *ten_loaiMon+