   M S B A M L   `   `   `  ����K  GCafe Management3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Cafe_Management3Cafe_Management3  5   	       Cafe_Management3.cthd   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Cafe_Management3     5   	   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5          � Title$  Chi tiết hóa đơn��5	   	   $	��450��6"   $��629.351��6/    � WindowStartupLocation$ CenterScreen=�5
   	   .��5      �  � RowDefinitions 5   
   �� 5      6   �� 5      $��50 �6   6*   .+�5   
   � $��0��6   .+�5      #  MaterialDesignThemes.Wpf.Card  $��5q�6"   $��Stretch=�6-   .��5      �� $
��Auto=�6   .��5      &   System.Windows.Controls.DataGrid  -   5          Name$ dtcthd��5   W      
IsReadOnly . $
��auto��6I   $
��auto��6g   ��61   ��    Columns 5      5      5      5      5      � 5   
   $��1��6    � ColumnDefinitions 5      �� 5      $
��332* �6#   �� 5      $	��53* �6#   .+�5       �� -   5        $��14(�5    *   $
��Bold"�68   
���   �
��� � �
���   �$
��Auto��6�   $��462,0,10,10q�6�   $��2��6�   .��6�   HOÀN THÀNH5"      �� 5#      -   5        $��lable��5#      $��	6,0,263,0q�6!    J� RenderTransformOrigin$ 0.5,0.5&�64   5$      5%      5&      5'      