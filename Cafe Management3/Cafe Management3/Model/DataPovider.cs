using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cafe_Management3.Model
{
    public class DataPovider
    {
        private static DataPovider _ins;
        public static DataPovider Ins { 
            get {              
             if(_ins == null) 
                _ins = new DataPovider(); 
             return _ins;           
            } 
            set { _ins = value; } 
        
        }
        public quanLyCafeEntities DB {get; set;}
        private DataPovider()
        {
            DB = new quanLyCafeEntities();
        }
    }
}
