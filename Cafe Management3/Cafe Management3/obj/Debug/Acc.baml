   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	   M+clr-namespace:Cafe_Management3.UserControlACafe_Management3.UserControlA  5   
       Cafe_Management3.Acc   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   :uc+clr-namespace:Cafe_Management3.UserControlA     5   
   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  6R   -   5          �Name$  window��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5      
�������  MaterialDesignFont#���  5       � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Title$ Danh mục vật tư��5   	   $	��280��6!   $	��500��6.   .��5      � $	��507��6   $	��Top=�6   $��
0,0,0,-235q�60    � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      6   .+�5   
   � $��0��6   .+�5      0   *Cafe_Management3.UserControlA.ControlBarUc  
 � Tag 6   �� *Title+ �� ElementName$ window��6J   5      � 5   
   $��1��6   $��	0,0,0,216q�6    5      �� 5       $
��auto �6    60   �� 5!      $
��auto �6    60   .+�5%      #  MaterialDesignThemes.Wpf.Card  $��0��6"   $��5q�6/   .��5&      �  5'      �� 5(      6*   �� 5)      6*   �� 5*      6*   �� 5+      6*   .+�5-      G� -   5        	 G�Name$		 mkc��5-   "   $��0��6/   )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$!
 Mật khẩu hiện tại��5.   "    ) %MaterialDesignFloatingHintPasswordBox#��[ 5/   "   $��5,10,192,10q�6a   51      G� 52      -   5        $	 mk��52   "   $��1��6.   $
 Mật khẩu mới��53   "   #��[ 54   "   $��	5,0,192,5q�6a   56      G� 57      -   5        $		 mkl��57   "   $��2��6/   $&
  Lặp lại mật khẩu mới��58   "   #��[ 59   "   $��5,10,192,10q�6a   5:      5;      5<        5>      $��1��6"   $��5q�6/   .��5?      � .+�5@      �� -   5         ��Name$
 them��5@      
�����F�
���   �
��� � �$
��Lưu��6i   $��5q�6w   $	��100��6�   6�   5A      5B      5C      5D      5E      