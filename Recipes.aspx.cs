using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LYFEWEB
{
    public partial class Recipes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRecipes();
            LoadRecipeSelect();
        }

        private void LoadRecipes()
        {
            DataTable dt = DAL.GetRecipes();
            gv_Recipe.DataSource = dt;
            gv_Recipe.DataBind();
            
        }

        private void LoadRecipeSelect()
        {
            DataTable dt = DAL.GetRecipes();

            foreach (DataRow row in dt.Rows)
            {
                select_recipe.Items.Add(row.Field<string>(1));
            }
        }

        protected void gv_Recipe_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if(e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string id = e.Row.Cells[0].Text;
            //    e.Row.Attributes["onclick"] = Page
            //}
        }
    }
}