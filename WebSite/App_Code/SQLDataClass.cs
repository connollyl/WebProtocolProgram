using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebSite.App_Code
{
    public class SQLDataClass
    {
        public DataTable dTable = new DataTable();

        public void fillDataTable()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString"].ConnectionString);
            conn.Open();
            string allData = "select * from Product";
            using (SqlCommand com = new SqlCommand(allData, conn))
            {
                dTable.Load(com.ExecuteReader());
            }
            conn.Close();
        }

        public void updateDatabase()
        {
            string selectAll = "select * from Product";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString"].ConnectionString);
            conn.Open();
            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = new SqlCommand(selectAll, conn);
            SqlCommandBuilder cb = new SqlCommandBuilder(DA);
            DA.UpdateCommand = cb.GetUpdateCommand();
            DA.Update(dTable);
            conn.Close();
            fillDataTable();
        }

        public string addEntry(string id, string name, string price, string description)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString"].ConnectionString);
                conn.Open();
                string insertCom = "insert into Product (ProductID, ProductName, UnitPrice, Description) values (@ID, @name, @price, @description)";
                SqlCommand com = new SqlCommand(insertCom, conn);
                com.Parameters.AddWithValue("@id", id);
                com.Parameters.AddWithValue("@name", name);
                com.Parameters.AddWithValue("@price", price);
                com.Parameters.AddWithValue("@description", description);
                com.ExecuteNonQuery();
                conn.Close();
                fillDataTable();
                return "Product added";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}