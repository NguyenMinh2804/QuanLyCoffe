﻿#pragma checksum "..\..\ItemWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "282CCB34EB527AC08C4EB6B7E8C9495AA7CB134F845968AFD009B8C52C185647"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Cafe_Management3;
using Cafe_Management3.UserControlA;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.Integration;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Cafe_Management3 {
    
    
    /// <summary>
    /// ItemWindow
    /// </summary>
    public partial class ItemWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 20 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal Cafe_Management3.ItemWindow window;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox mavt;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox ten;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox dvt;
        
        #line default
        #line hidden
        
        
        #line 54 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button them;
        
        #line default
        #line hidden
        
        
        #line 55 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button sua;
        
        #line default
        #line hidden
        
        
        #line 56 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button xoa;
        
        #line default
        #line hidden
        
        
        #line 65 "..\..\ItemWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid hoa_don;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Cafe Management3;component/itemwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\ItemWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal System.Delegate _CreateDelegate(System.Type delegateType, string handler) {
            return System.Delegate.CreateDelegate(delegateType, this, handler);
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.window = ((Cafe_Management3.ItemWindow)(target));
            
            #line 22 "..\..\ItemWindow.xaml"
            this.window.Loaded += new System.Windows.RoutedEventHandler(this.window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.mavt = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.ten = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.dvt = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 5:
            this.them = ((System.Windows.Controls.Button)(target));
            
            #line 54 "..\..\ItemWindow.xaml"
            this.them.Click += new System.Windows.RoutedEventHandler(this.them_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.sua = ((System.Windows.Controls.Button)(target));
            
            #line 55 "..\..\ItemWindow.xaml"
            this.sua.Click += new System.Windows.RoutedEventHandler(this.sua_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.xoa = ((System.Windows.Controls.Button)(target));
            
            #line 56 "..\..\ItemWindow.xaml"
            this.xoa.Click += new System.Windows.RoutedEventHandler(this.xoa_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.hoa_don = ((System.Windows.Controls.DataGrid)(target));
            
            #line 65 "..\..\ItemWindow.xaml"
            this.hoa_don.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.hoa_don_SelectionChanged);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

