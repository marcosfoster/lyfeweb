using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Web.Services;

namespace LYFEWEB
{
    public partial class Test_BrowseEdit_Ingredients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<INGREDIENT> n = DAL.GetIngredients();
            
            foreach(INGREDIENT i in n)
            {
                select_ingredient.Items.Add(new ListItem(i.NAME, i.I_ID.ToString()));
            }
        }
           
        [WebMethod]
        public static string SelIngChange()
        {
            return "this";
            //return id.ToString() + " - ID";
            //List<INGREDIENT> n = DAL.GetIngredientDetails(id);

            //return n[0].INGREDIENTS_PRICEs.ToString();
        }

    }
}