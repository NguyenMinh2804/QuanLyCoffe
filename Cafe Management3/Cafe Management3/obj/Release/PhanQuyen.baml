   M S B A M L   `   `   `  ���� K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA       Cafe_Management3.PhanQuyen   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     0localclr-namespace:Cafe_Management3     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  4uc+clr-namespace:Cafe_Management3.UserControlA  -   $��MainWindow2��   MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignPaper#���    MaterialDesignFont#���   � WindowStyle$
 None=�
 � Top$ 0�� � Left$ 0�� � Title$ THE COFFE HOUSE��$	��700��$
��1300��.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction  	   Command	 �� *LoadedWindowCommand+
   CommandParameter
 ��  �� ElementName$ MainWindow2��.���  � RowDefinitions �� $
��auto ��� .+�� $��0��.+�0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag �� *Title+$	 www��� $��1�� � ColumnDefinitions �� $��0 ��� �� �� �� $��0 �.+�� $��0�� �� �� �� �� �� �� �� �� �� �� �� �� � $��1�� �� �� �� �� �� �� �� �� �� �� �� ��  �� $
��auto ��� .+��� -   $��c1��$��1��$��1��$��10,10,127,13q��� -   $��c2��$��2��$��2��$��10,10,127,13q��� -   $��c3��$��3��$��3��$��10,10,127,13q��� -   $��c4��$��4��$��4��$��10,10,127,13q��� -   $��c5��$��5��$��5��$��10,10,127,13q��� -   $��c6��$��6��$��1��$��10,10,127,13q��� -   $��c7��$��7��$��2��$��10,10,127,13q��� -	   $��c8��$��8��$��3��$��10,10,127,13q��� -
   $��c9��$��9��$��4��$��10,10,127,13q��� $��0��$	��KHO��$��Center=�$��112,15,111,0q�$	��Top=�$
��Bold"��� -   
����İ�
��� d �$��1�� # MaterialDesignRaisedLightButton#��[ $	��220�� � ToolTip$4 .Resource name: MaterialDesignRaisedLightButton��$��Phiếu nhập kho��$��
19,12,19,0q�$	��Top=��� -   
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Phiếu xuất kho��$��
19,12,19,0q�$	��Top=��� 
����İ�
��� d �$��3��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Danh mục vật tư��$��
19,12,19,0q����� *ItemCommand+�� 
����İ�
��� d �$��4��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$!��Danh mục đơn vị tính��$��
19,12,19,0q����� *UnitCommand+�� -   
����İ�
��� d �$��5��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$,��&Danh mục quy đổi đơn vị tính��$	��Top=�$��
19,12,19,0q��� -   
����İ�
��� d �$��6��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$ ��Danh mục nhà cung cấp��$	��Top=�$��
19,12,19,0q��� -   
����İ�
��� d �$��7��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo nhập kho��$	��Top=�$��
19,12,19,0q��� -   
����İ�
��� d �$��8��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo xuất kho��$	��Top=�$��
19,12,19,0q��� -   
����İ�
��� d �$��9��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Báo cáo tồn kho��$	��Top=�$��
19,12,19,0q�� $��2��$	��654��$��Bottom=� �� �� �� �� �� �� �� �� �� �� �� ��  �� $
��auto ��� .+��� -   $	��c10��$��1��$��1��$��10,10,127,13q��� -   $	��c11��$��2��$��2��$��10,10,127,13q��� -   $	��c12��$��3��$��3��$��10,10,127,13q��� -   $	��c13��$��4��$��4��$��10,10,127,13q��� -   $	��c14��$��5��$��5��$��10,10,127,13q��� $��0��$��
BÁN HÀNG��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� 
����İ�
��� d �$��1��#��[ $	��220��$��41��$4 .Resource name: MaterialDesignRaisedLightButton������ *KindSustenanceCommand+.���� $
��Wrap=�$��30��$	��193��-+Danh mục loại đồ ăn, nước uống�� 
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$*��$Danh mục đồ ăn, nước uống������ *SustenanceCommand+�� -   
����İ�
��� d �$��3��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$&�� Báo cáo tổng hợp doanh thu��$��
19,12,19,0q�$	��Top=��� -   
����İ�
��� d �$��4��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$$��Báo cáo chi tiết doanh thu��$��
19,12,19,0q�$	��Top=��� -   
����İ�
��� d �$��5��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$'��!Biểu đồ cột doanh thu năm��$��
19,12,19,0q�$	��Top=�� $��3�� �� �� $��55.25 ��� �� �� �� �� �� �� �� �� ��  �� $
��auto ��� .+��� -   $	��c15��$��1��$��1��$��10,10,127,13q��� -   $	��c16��$��2��$��2��$��10,10,127,13q��� $��0��$��NHÂN VIÊN��$��Center=�$��0,15,0,0q�$	��Top=�$
��Bold"��� -   
����İ�
��� d �$��1��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$#��Danh mục loại nhân viên���� -   
����İ�
��� d �$��2��#��[ $	��220��$4 .Resource name: MaterialDesignRaisedLightButton��$��Danh mục nhân viên���� -    ��Name$ tk�� �� DisplayMemberPath$ 
ten_loainv��$��8��$��186,0,50,15q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tài khoản�� & "MaterialDesignFloatingHintComboBox#��[ $��2���� -   $��20(�$
��Lưu��
��� � �
���   �
���   �$��9��$��186,34,50,11q�$��2��$
��Auto��$��2��