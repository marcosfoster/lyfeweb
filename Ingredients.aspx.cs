using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LYFEWEB
{
    public partial class Ingredients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateIngredientsSelect();

                PopulateListSelect();
            }

        }

        private void PopulateIngredientsSelect()
        {
            //Get all ingredients and display
            gv_ingredients.DataSource = DAL.GetIngredientsDT();
            gv_ingredients.DataBind();

            //Populate Drop Down
            List<INGREDIENT> n = DAL.GetIngredients();

            foreach (INGREDIENT i in n)
            {
                select_ingredient.Items.Add(new ListItem(i.NAME, i.I_ID.ToString()));
            }
        }

        private void PopulateListSelect()
        {
            List<SHOPPING_LIST> l = DAL.GetShoppingLists();

            foreach (SHOPPING_LIST i in l)
            {
                select_list.Items.Add(new ListItem(i.S_NAME, i.S_ID.ToString()));
            }
        }

        private DataTable FilterOnName(DataTable source, string filter)
        {
            filter = select_ingredient.Items[select_ingredient.SelectedIndex].Text;

            DataView dvReturn = new DataView(source)
            {
                RowFilter = "[Name]='" + filter + "'"
            };

            DataTable x = dvReturn.ToTable();
            return x;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            gv_ingredients.DataSource = FilterOnName((DataTable)gv_ingredients.DataSource, "Lettuce");
            gv_ingredients.DataBind();
        }

        protected void gv_ingredients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void IbDeleteIngredient_Click(object sender, ImageClickEventArgs e)
        {
            //Get row id
            if (sender.GetType() == typeof(ImageButton))
            {
                //get imagebutotn container - a gridviewrow
                ImageButton ib = (ImageButton)sender;
                var ibContainer = ib.NamingContainer;

                if (ibContainer.GetType() == typeof(GridViewRow))
                {
                    //Get ID from row
                    GridViewRow row = (GridViewRow)ibContainer;

                    try
                    {
                        int id = Convert.ToInt32(row.Cells[0].Text);

                        try
                        {
                            DeleteFromTable(id);

                            Response.Redirect("Ingredients.aspx");
                        }
                        catch (Exception ex)
                        {
                            //TODO:Handle Exception
                        }
                    }
                    catch (Exception)
                    {
                        //TODO: Handle exception
                    }
                }
            }

        }

        private void DeleteFromTable(int index)
        {
            DAL.DeleteFromIngredients(index);
        }

        protected void IbEditIngredient_Click(object sender, ImageClickEventArgs e)
        {
            //TODO: Add Edit Ingredient Page
        }

        protected void IbAddTo_Click(object sender, ImageClickEventArgs e)
        {
            //TODO: Show Popup menu for shopping list

            //Add Ingredient to currently selected shopping list
            int sId = GetCurrentShoppingList();

            //Get Current Ingredient ID 
            int iId = GetRowDbId(sender, e);

            DAL.InsertToShoppingList(sId, iId, 1);

        }

        private int GetCurrentShoppingList()
        {
            return Convert.ToInt32(select_list.Items[select_list.SelectedIndex].Value);
        }



        //                  METHODS

        /// <summary>
        /// Gets the ID at cell index 0 for any row
        /// This is useful as database IDs (e.g. R_ID, S_ID) reside in the first col [0]
        /// </summary>
        /// <param name="sender">Control that triggered the event (usually ImageButton)</param>
        /// <param name="e">ImageButton Click event args</param>
        /// <returns>int - Tries to parse value of sent row.cells[0]</returns>
        private int GetRowDbId(object sender, ImageClickEventArgs e)
        {
            //Get row id
            if (sender.GetType() == typeof(ImageButton))
            {
                //get imagebutotn container - a gridviewrow
                ImageButton ib = (ImageButton)sender;
                var ibContainer = ib.NamingContainer;

                if (ibContainer.GetType() == typeof(GridViewRow))
                {
                    //Get ID from row
                    GridViewRow row = (GridViewRow)ibContainer;

                    try
                    {
                        int id = Convert.ToInt32(row.Cells[0].Text);

                        return id;

                    }
                    catch (Exception ex)
                    {
                        //TODO: Handle exception
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

    }
}