   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  !    Cafe_Management3.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  4uc+clr-namespace:Cafe_Management3.UserControlA  -   $��MainWindow2��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���   � WindowStyle$
 None=� 
 MainVM � DataContext# [ 
 � Top$ 0�� � Left$ 0�� � Title$ THE COFFE HOUSE��$	��700��$
��1300��.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase	   Actions.	 6  0System.Windows.Interactivity.InvokeCommandAction  
   Command
 �� *LoadedWindowCommand+   CommandParameter ��  �� ElementName$ MainWindow2��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+$	 www��� $��1�� � ColumnDefinitions �� �� �� �� �� .+�� $��0�� �� �� �� �� �� �� �� �� �� �� �� �� .+��� $��0��$��HỆ THỐNG��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� -    ��Name$ x��
����İ�
��� d �$��1�� # MaterialDesignRaisedLightButton#��[ $	��220�� � ToolTip$4 .Resource name: MaterialDesignRaisedLightButton��$ ��Thêm người sử dụng������ *AccountCommand+�� -   $ y��
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Phân quyền truy cập��� $��1�� �� �� �� �� �� �� �� �� �� �� �� �� .+��� $��0��$	��KHO��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� -   $	 c1a��
����İ�
��� d �$��1��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Phiếu nhập kho���� -   $	 c2a��
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Phiếu xuất kho���� -   $	 c3a��
����İ�
��� d �$��3��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Danh mục vật tư������ *ItemCommand+�� -   $ c4��
����İ�
��� d �$��4��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$!��Danh mục đơn vị tính������ *UnitCommand+�� -   $ c5��
����İ�
��� d �$��5��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$,��&Danh mục quy đổi đơn vị tính���� -	   $ c6��
����İ�
��� d �$��6��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$ ��Danh mục nhà cung cấp���� -
   $ c7��
����İ�
��� d �$��7��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo nhập kho���� -   $ c8��
����İ�
��� d �$��8��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo xuất kho���� -   $ c9��
����İ�
��� d �$��9��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo tồn kho��� $��2�� �� �� �� �� �� �� �� �� �� �� �� �� .+��� $��0��$��
BÁN HÀNG��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� -   $	 c10��
����İ�
��� d �$��1��#��[ $	��220��$��41��$4 .Resource name: MaterialDesignRaisedLightButton������ *KindSustenanceCommand+.���� $
��Wrap=�$��30��$	��193��-+Danh mục loại đồ ăn, nước uống�� -   $	 c11��
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$*��$Danh mục đồ ăn, nước uống������ *SustenanceCommand+�� -   $	 c12��
����İ�
��� d �$��3��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$&�� Báo cáo tổng hợp doanh thu��$��
19,12,19,0q�$	��Top=��� -   $	 c13��
����İ�
��� d �$��4��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$$��Báo cáo chi tiết doanh thu��$��
19,12,19,0q�$	��Top=��� -   $	 c14��
����İ�
��� d �$��5��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$'��!Biểu đồ cột doanh thu năm��$��
19,12,19,0q�$	��Top=�� $��3�� �� �� $��55.25 ��� �� �� �� �� �� �� �� �� �� .+��� $��0��$��NHÂN VIÊN��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� -   $	 c15��
����İ�
��� d �$��1��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$#��Danh mục loại nhân viên���� -   $	 c16��
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Danh mục nhân viên��