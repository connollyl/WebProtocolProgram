using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebSite.App_Code
{
    public class ShoppingBag
    {

        private DataTable dt = new DataTable();

        public ShoppingBag()
        {
            dt.Clear();
            dt.Columns.Add("ProductID");
            dt.Columns.Add("ProductName");
            dt.Columns.Add("UnitPrice");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("GrandTotal");
        }

        public void AddRow(DataRow dr)
        {
            dt.Rows.Add(dr);
        }

        public DataTable getBag()
        {
            return dt;
        }

    }
}