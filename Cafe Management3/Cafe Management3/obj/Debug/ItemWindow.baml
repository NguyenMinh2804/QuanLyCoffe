   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
   !    Cafe_Management3.ItemWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục vật tư��5   	   $	��500��6!   $	��600��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+	 �� ElementName$	 window��6J   5      � 5   
   $��1��6    5       �� 5!      $
��auto �6    60   �� 5"      $
��auto �6    60   �� 5#      6"   .+�5'      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5(      �  5)      �� 5*      6*   �� 5+      6*   �� 5,      6*   .+�5.      �� -   5        
 ��Name$

 mavt��5.      $��0��6,   $��	5 5 400 5q�69   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Mã vật tư��6L    % !MaterialDesignFloatingHintTextBox#��[ 6w   �� 5/      -   5        $	
 ten��5/      $��1��6+   $��5,0,5,5q�69   $ Tên vật tư��6J   #��[ 6v   �� 50      -   5         ��Name$	 dvt��50      $��2��6,   $��	5 5 400 5q�69   $ Đơn vị tính��6L    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 6�   6�   51      52        54      $��1��6"   $��5q�6/   .��55      � .+�56      �� -   5         ��Name$
 them��56      
�����F�
���   �
��� � �$��Thêm��6i   $��5q�6x   $	��100��6�   6�   �� 57      -   5        $	 sua��57      
�����F�
���   �
��� � �$��Sửa��6i   $��5q�6x   $	��100��6�   6�   �� 58      -   5        $	 xoa��58      
�����F�
���   �
��� � �$��Xóa��6j   $��5q�6y   $	��100��6�   6�   59      5:        5<      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5=      �� $
��Auto=�6   .��5>      � .+�5?        $��5q�6.   $��Stretch=�69   .��5@      �� $
��Auto=�6+   .��5A   "   &   System.Windows.Controls.DataGrid  -   5          Name$ hoa_don��5A   �      
IsReadOnly . $
��auto��6�   ��6i   ��    Columns 5B   &   5D   #   5E      5F      5G      5H      5I      5J      5K      5L      