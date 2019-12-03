using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Prog7
{
    public partial class ShoppingItem : System.Web.UI.UserControl
    {
        private string _theID, _theName;
        private double _thePrice, _theCost;
        private int _theQuantity;

        public string TheID
        {
            set
            {
                _theID = value.ToString();
            }
            get
            {
                return _theID;
            }
        }

        public int TheQuantity
        {
            set
            {
                _theQuantity = value;
            }
            get
            {
                return _theQuantity;
            }
        }

        public string TheName
        {
            set
            {
                _theName = value.ToString();
            }
            get
            {
                return _theName;
            }
        }

        public double ThePrice
        {
            set
            {
                _thePrice = value;
            }
            get
            {
                return _thePrice;
            }
        }

        public double TheCost
        {
            set
            {
                _theCost = value;
            }
            get
            {
                return _theCost;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            txtID.Text = _theID;
            txtName.Text = _theName;
            txtPrice.Text = string.Format("{0:C}", _thePrice);
            txtQuantity.Text = _theQuantity.ToString();
            txtCost.Text = string.Format("{0:C}", _theCost);
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            int quantity;

            if (int.TryParse(txtQuantity.Text, out quantity) &&
               quantity >= 0)
            {
                // update the object and display new cost
                ItemChanged(this, true);
            }
            else
            {
                // Error message on label and clear Cost
                ItemChanged(this, false);
            }

        }

        public event ItemChangedHandler ItemChanged;

        public delegate void ItemChangedHandler(object x, bool valid);


    }
}