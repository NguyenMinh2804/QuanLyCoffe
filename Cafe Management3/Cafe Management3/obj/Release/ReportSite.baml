   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  !    Cafe_Management3.ReportSite   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     :uc+clr-namespace:Cafe_Management3.UserControlA     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -     �Name$  window��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�
�������  MaterialDesignFont#���   � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=� � Title$ Danh mục vật tư��$	��650��$
��1000��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+	 �� ElementName$	 window��� $��1�� �� $
��auto ��� $
��auto ��� .+�#  MaterialDesignThemes.Wpf.Card  $��0��$��5q�.��� 
 � ColumnDefinitions
 �� �� �� �� $	��100 �.+�(  "System.Windows.Controls.DatePicker  -     Name$ den_ngay��$	��200��$��1��$��5q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Đến ngày�� ( $MaterialDesignFloatingHintDatePicker#��[ �� -    ��Name$
 vatu��$��0��$��56,6,5,7q�$ 	Vật tư�� �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ �� -   
�����F�$��15(�
��� d �
���   �$��2��$��Xem báo cáo��$��
41,10,36,5q�$	��119��$
��Auto���� -   
���   �$��3��$��	0,6,36,10q�$
��Auto����Z� ��Z� .��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	FileExcel=�$��22��$��30��� $��2��.+�  $��5q�$��Stretch=�.��� 
 �� $
��163* ��� $
��827* �.+�  $��5q�$��Stretch=�$��2��.���� $
��Auto=�.��&   System.Windows.Controls.DataGrid  -     Name$ 	doanh_thu��   
IsReadOnly . $
��auto��$
��auto������    Columns 