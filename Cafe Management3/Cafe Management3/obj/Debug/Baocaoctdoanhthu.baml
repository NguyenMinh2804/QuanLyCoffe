   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
   '    !Cafe_Management3.Baocaoctdoanhthu   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục vật tư��5   	   $	��650��6!   $	��900��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+	 �� ElementName$	 window��6J   5      � 5   
   $��1��6    5       �� 5!      $
��auto �6    60   �� 5"      $
��auto �6    60   �� 5#      6#   .+�5'      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5(      � 
 � ColumnDefinitions
 5)      �� 5*      6-   �� 5+      6-   �� 5,      6-   �� 5-      $	��100 �6+   69   .+�5/      (  "System.Windows.Controls.DatePicker  -   5          Name$ tu_ngay��5/   !   $	��200��62   $��0��6>   $��5q�6N   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 
Từ ngày��50       ( $MaterialDesignFloatingHintDatePicker#��[ 51        52      -   5        $ den_ngay��52   !   $	��200��63   $��1��6@   $��5q�6P   $ Đến ngày��53      #��[ 54      �� 55      -   5        
�����F�$��15(�55   4   
��� d �
���   �$��2��6m   $��Xem báo cáo��6~   $��
41,10,36,5q�6�   $	��119��6�   $
��Auto��6�   6�   �� 56      -   5        
���   �$��3��56   ]   $��	0,6,36,10q�6m   $
��Auto��6�   ��60   Z� ��6F   Z� .��57      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	FileExcel=�62   $��22��6C   $��30��6O   58      59      5:      � 5;      $��2��6   .+�5<        $��5q�6&   $��Stretch=�61   .��5=      � .+�5>        $��5q�6.   $��Stretch=�69   .��5?      �� $
��Auto=�6+   .��5@   "   &   System.Windows.Controls.DataGrid  -   5          Name$ 	doanh_thu��5@   c      
IsReadOnly . $
��auto��6U   $	��850��6v   ��6=   ��    Columns 5A   &   5C   #   5D      5E      5F      5G      5H      5I      5J      5K      