using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LYFEWEB
{
    public partial class RecipeDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Test multi join
            DataTable dt = DAL.GetRecipeIngredients(100);

            gvIngredients.DataSource = dt;
            gvIngredients.DataBind();

            //Get serve number and time taken value to put in Recipe Detail
            recipeDetail.InnerText = DAL.GetRecipeDetail(100);

            //Get Method HTML from RECIPES.METHOD field
            List<string> method = DAL.GetRecipeMethod(100);
            recipeMethod.InnerHtml = InsertRecipeSteps(method);

        }

        private string InsertRecipeSteps(List<string> steps)
        {
            string method = "<h2>Method</h2><ol>";

            foreach(string s in steps)
            {
                method += "<li>";
                method += s;
                method += "</li>";
            }

            method += "</ol>";
            return method;
        }
    }
}