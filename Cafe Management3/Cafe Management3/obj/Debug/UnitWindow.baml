   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
   !    Cafe_Management3.UnitWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	    
 UnitVM � DataContext# [ 5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Đơn vị tính��5   	   $	��500��6   $	��600��6+   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
	 � Tag	 6   �� *Title+
 �� ElementName$
 window��6J   5      � 5    
   $��1��6    5!      �� 5"      $
��auto �6    60   �� 5#      $
��auto �6    60   �� 5$      6"   .+�5(      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5)      �  5*      �� 5+      6*   �� 5,      6*   .+�5.      �� $��0��6   $��5q�6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã đơn vị tính��6�    % !MaterialDesignFloatingHintTextBox#��[ 6�   ��6+   �� *ma_dvt+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=�6�   50      51        53      $��1��6"   $��5q�6/   .��54      � .+�55      �� 
�����F�
���   �
��� � �$��Thêm��6z   $��5q�6�   $	��100��6�   ��6[   �� *
AddCommand+6�   �� 56      
�����F�
���   �
��� � �$��Sửa��6{   $��5q�6�   $	��100��6�   ��6[   �� *EditCommand+6�   �� 57      
�����F�
���   �
��� � �$��Xóa��6}   $��5q�6�   $	��100��6�   ��6[   �� *DeleteCommand+6�   58      59        5;      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5<      �� $
��Auto=�6   .��5=      �� ��6   �� *List+$ TwoWay=�$ PropertyChanged=� �� SelectedItem 6n   �� *SelectedItem+$ TwoWay=� �� View 5>      �� 5?      .P�5@   "   �� $��Đơn vị tính��61    �� DisplayMemberBinding 6F   �� *ma_dvt+6p   5B      5D      5E      5F      5G      5H      5I      