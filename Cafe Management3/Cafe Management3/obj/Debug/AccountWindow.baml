   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
   $    Cafe_Management3.AccountWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  6R   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục vật tư��5   	   $	��500��6!   $	��700��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+ �� ElementName$ window��6J   5      � 5   
   $��1��6    5      �� 5       $
��auto �6    60   �� 5!      $
��auto �6    60   �� 5"      6"   .+�5&      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5'      �  5(      �� 5)      6*   �� 5*      6*   �� 5+      6*   �� 5,      6*   .+�5.      �� -   5        	 ��Name$	 tk��5.      $��0��6*   $��	5 5 400 5q�67   )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Tài khoản��6J    % !MaterialDesignFloatingHintTextBox#��[ 6u   �� 5/      -   5        $		 ten��5/      $��0��6+   $��
318,5,10,5q�68   $
 Tên hiển thị��6L   #��[ 6z   G� 50      -   5         G�Name$ mk��50   "   $��1��6.   $
 Mật khẩu��51   "    ) %MaterialDesignFloatingHintPasswordBox#��[ 52   "   $��	5,0,400,0q�6a   54      G� 55      -   5        $	 mkl��55   "   $��2��6/   $
 Mật khẩu��56   "   #��[ 57   "   $��	5,0,400,0q�6a   59      �� 5:      -   5         ��Name$ loaitk��5:      $��3��6/   $��	5 5 400 5q�6<   $
 Loại tài khoản��6O    �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[ 6�   6�   5;      5<        5>      $��1��6"   $��5q�6/   .��5?      � .+�5@      �� -   5         ��Name$
 them��5@      
�����F�
���   �
��� � �$��Thêm��6i   $��5q�6x   $	��100��6�   6�   �� 5A      -   5        $	 sua��5A      
�����F�
���   �
��� � �$��Sửa��6i   $��5q�6x   $	��100��6�   6�   �� 5B      -	   5        $	 xoa��5B      
�����F�
���   �
��� � �$��Xóa��6j   $��5q�6y   $	��100��6�   6�   �� 5C      -
   5        $ re��5C      
�����F�
���   �
��� � �$��
Reset pass��6i   $��5q�6~   $	��100��6�   6�   5D      5E        5G      $��2��6"   $��5q�6/   $��Stretch=�6:   .��5H      �� $
��Auto=�6   .��5I      � .+�5J        $��5q�6.   $��Stretch=�69   .��5K      �� $
��Auto=�6+   .��5L   "   &   System.Windows.Controls.DataGrid  -   5          Name$ hoa_don��5L   �      
IsReadOnly . $
��auto��6�   ��6i   ��    Columns 5M   &   5O   #   5P      5Q      5R      5S      5T      5U      5V      5W      