//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cafe_Management3.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class phieu_nhap_kho
    {
        public int id { get; set; }
        public string ma_phieu { get; set; }
        public Nullable<int> stt_rect { get; set; }
        public string ma_vt { get; set; }
        public Nullable<double> so_luong { get; set; }
        public Nullable<System.DateTime> ngay_nhap { get; set; }
        public Nullable<decimal> don_gia { get; set; }
        public Nullable<decimal> thanh_tien { get; set; }
    }
}