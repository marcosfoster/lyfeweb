using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LYFEWEB
{
    public partial class AddIngredients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addIngredient_Click(object sender, EventArgs e)
        {
            //Store values in Session object
            AddValuesToSession();

            if(DoValidation())
            {
                //Add to Database
                DoInsert();

                ClearForm();
            }
            else
            {
                RetrieveSessionValue();
            }
            

            ingredientName.Focus();

        }

        private void AddValuesToSession()
        {
            //Add values in form to session so can retrieve if INSERT fails
            Session["name"] = ingredientName.Text;
            Session["quantity"] = quantity.Text;
            Session["quantityType"] = quantityType.Text;
            Session["price"] = price.Text;
            Session["store"] = store.SelectedIndex;
        }

        private void RetrieveSessionValue()
        {
            ingredientName.Text = Session["name"].ToString();
            quantity.Text = Session["quantity"].ToString();
            quantityType.Text = Session["quantityType"].ToString();
            price.Text = Session["price"].ToString();
            store.SelectedIndex = (int)Session["store"];
        }

        private bool DoValidation()
        {
            if (String.IsNullOrWhiteSpace(ingredientName.Text))
            {
                ingredientName.BorderColor = Color.Red;
                return false;
            }
            if (String.IsNullOrWhiteSpace(quantity.Text))
            {
                quantity.BorderColor = Color.Red;
                return false;
            }
            if (String.IsNullOrWhiteSpace(quantityType.Text))
            {
                quantityType.BorderColor = Color.Red;
                return false;
            }
            if (String.IsNullOrWhiteSpace(price.Text))
            {
                price.BorderColor = Color.Red;
                return false;
            }

            return true;


        }

        private void DoInsert()
        {
            Ingredient i = new Ingredient();
            i.Name = ingredientName.Text;
            i.Quantity = short.Parse(quantity.Text);
            i.QuantityType = quantityType.Text.ToLower();
            i.Price = decimal.Parse(price.Text);
            i.Store = store.Items[store.SelectedIndex].Text;

            i.Id = DAL.InsertIngredient(i);


            if (i.Id != 0)
            {
                //Add price to db
                if (DAL.InsertIngredientPrice(i))
                {
                    messagediv.InnerText = "Ingredient added";
                    messagediv.Attributes.CssStyle["display"] = "block";
                    messagediv.Attributes.CssStyle["color"] = "#4CAF50";
                }
                else
                {
                    messagediv.InnerText = "Failed to add price";
                    messagediv.Attributes.CssStyle["display"] = "block";
                    messagediv.Attributes.CssStyle["color"] = "#f00";
                }

            }
            else
            {
                messagediv.InnerText = "Failed to add ingredient";
                messagediv.Attributes.CssStyle["display"] = "block";
                messagediv.Attributes.CssStyle["color"] = "#f00";
            }
        }

        private void ClearForm()
        {
            ingredientName.Text = String.Empty;
            quantity.Text = String.Empty;
            quantityType.Text = String.Empty;
            price.Text = String.Empty;
        }
    }
}