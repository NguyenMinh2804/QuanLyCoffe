   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5      !    Cafe_Management3.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   4uc+clr-namespace:Cafe_Management3.UserControlA  5      -   5        $��MainWindow2��5         MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignPaper#���  5        MaterialDesignFont#���  5       � WindowStyle$
 None=�5       
 MainVM � DataContext# [ 5      
 � Top$ 0��5       � Left$ 0��6    � Title$ THE COFFE HOUSE��5   	   $	��700��6!   $
��1300��6.   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase	   Actions.	 5      6  0System.Windows.Interactivity.InvokeCommandAction  
   Command
 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ MainWindow2��5      .��5      �  � RowDefinitions 5    
   �� 5!      $
��auto �6   6,   �� 5"      6   .+�5$   
   � $��0��6   .+�5%      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+$	 www��6G   5&      � 5'   
   $��1��6    � ColumnDefinitions 5(      �� 5)      6%   �� 5*      6%   �� 5+      6%   �� 5,      6%   �� 5-      6%   .+�5/      � $��0��6    50      �� 51      6&   �� 52      6&   �� 53      6&   �� 54      6&   �� 55      6&   �� 56      6&   �� 57      6&   �� 58      6&   �� 59      6&   �� 5:      6&   �� 5;      6&   �� 5<      6&   .+�5>      �� $��0��6   $��HỆ THỐNG��6%   $��Center=�68   $��0,15,0,0q�6U   $	��Top=�6g   $
��Bold"�6   �� 5?      -   5         ��Name$ x��5?      
����İ�
��� d �$��1��6Y    # MaterialDesignRaisedLightButton#��[ 5@      $	��220��5A       � ToolTip$4 .Resource name: MaterialDesignRaisedLightButton��5B      $ ��Thêm người sử dụng��6R   ��5A   '   �� *AccountCommand+5C      �� 5D      -   5        $ y��5D   )   
����İ�
��� d �$��2��6i   #��[ 5E      $	��220��5F      $4 .Resource name: MaterialDesignRaisedLightButton��5G      $��Phân quyền truy cập��6R   5H      5I      � 5J      $��1��6    5K      �� 5L      6&   �� 5M      6&   �� 5N      6&   �� 5O      6&   �� 5P      6&   �� 5Q      6&   �� 5R      6&   �� 5S      6&   �� 5T      6&   �� 5U      6&   �� 5V      6&   �� 5W      6&   .+�5Y      �� $��0��6   $	��KHO��6%   $��Center=�63   $��0,15,0,0q�6P   $	��Top=�6b   $
��Bold"�6z   �� 5Z      -   5        $	 c1a��5Z      
����İ�
��� d �$��1��6Z   #��[ 5[      $	��220��5\      $4 .Resource name: MaterialDesignRaisedLightButton��5]      $��Phiếu nhập kho��6R   5^      �� 5_      -   5        $	 c2a��5_      
����İ�
��� d �$��2��6Z   #��[ 5`      $	��220��5a      $4 .Resource name: MaterialDesignRaisedLightButton��5b      $��Phiếu xuất kho��6R   5c      �� 5d      -   5        $	 c3a��5d      
����İ�
��� d �$��3��6Z   #��[ 5e      $	��220��5f      $4 .Resource name: MaterialDesignRaisedLightButton��5g      $��Danh mục vật tư��6R   ��5d   g   �� *ItemCommand+5h      �� 5i      -   5        $ c4��5i      
����İ�
��� d �$��4��6Y   #��[ 5j      $	��220��5k      $4 .Resource name: MaterialDesignRaisedLightButton��5l      $!��Danh mục đơn vị tính��6R   ��5i   f   �� *UnitCommand+5m      �� 5n      -   5        $ c5��5n      
����İ�
��� d �$��5��6Y   #��[ 5o      $	��220��5p      $4 .Resource name: MaterialDesignRaisedLightButton��5q      $,��&Danh mục quy đổi đơn vị tính��6R   5r      �� 5s      -	   5        $ c6��5s      
����İ�
��� d �$��6��6Y   #��[ 5t      $	��220��5u      $4 .Resource name: MaterialDesignRaisedLightButton��5v      $ ��Danh mục nhà cung cấp��6R   5w      �� 5x      -
   5        $ c7��5x      
����İ�
��� d �$��7��6Y   #��[ 5y      $	��220��5z      $4 .Resource name: MaterialDesignRaisedLightButton��5{      $��Báo cáo nhập kho��6R   5|      �� 5}      -   5        $ c8��5}      
����İ�
��� d �$��8��6Y   #��[ 5~      $	��220��5      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $��Báo cáo xuất kho��6R   5�      �� 5�      -   5        $ c9��5�      
����İ�
��� d �$��9��6Y   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $��Báo cáo tồn kho��6R   5�      5�      � 5�      $��2��6    5�      �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   .+�5�      �� $��0��6   $��
BÁN HÀNG��6%   $��Center=�68   $��0,15,0,0q�6U   $	��Top=�6g   $
��Bold"�6   �� 5�      -   5        $	 c10��5�      
����İ�
��� d �$��1��6\   #��[ 5�      $	��220��5�      $��41��6%   $4 .Resource name: MaterialDesignRaisedLightButton��5�      ��5�   i   �� *KindSustenanceCommand+.��5�      �� $
��Wrap=�6    $��30��65   $	��193��6A   -+Danh mục loại đồ ăn, nước uống6m   5�      �� 5�      -   5        $	 c11��5�      
����İ�
��� d �$��2��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $*��$Danh mục đồ ăn, nước uống��6R   ��5�   g   �� *SustenanceCommand+5�      �� 5�      -   5        $	 c12��5�      
����İ�
��� d �$��3��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $&�� Báo cáo tổng hợp doanh thu��6R   $��
19,12,19,0q�6�   $	��Top=�6�   5�      �� 5�      -   5        $	 c13��5�      
����İ�
��� d �$��4��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $$��Báo cáo chi tiết doanh thu��6R   $��
19,12,19,0q�6�   $	��Top=�6�   5�      �� 5�      -   5        $	 c14��5�      
����İ�
��� d �$��5��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $'��!Biểu đồ cột doanh thu năm��6R   $��
19,12,19,0q�6�   $	��Top=�6�   5�      5�      � 5�      $��3��6    5�      �� 5�      6&   �� 5�      $��55.25 �6$   65   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   �� 5�      6&   .+�5�      �� $��0��6   $��NHÂN VIÊN��6%   $��Center=�69   $��0,15,0,0q�6V   $	��Top=�6h   $
��Bold"�6�   �� 5�      -   5        $	 c15��5�      
����İ�
��� d �$��1��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $#��Danh mục loại nhân viên��6R   5�      �� 5�      -   5        $	 c16��5�      
����İ�
��� d �$��2��6Z   #��[ 5�      $	��220��5�      $4 .Resource name: MaterialDesignRaisedLightButton��5�      $��Danh mục nhân viên��6R   5�      5�      5�      5�      5�      