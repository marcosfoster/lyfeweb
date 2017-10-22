using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;

namespace LYFEWEB
{
    public static class DAL
    {


        public static List<INGREDIENT> GetIngredients()
        {
            LYFEDB_DataClassesDataContext LydbContext = new LYFEDB_DataClassesDataContext();

            var result = from r in LydbContext.INGREDIENTs select r;
            return result.ToList();
        }

        public static List<INGREDIENT> GetIngredientDetails(int ingredientId)
        {
            LYFEDB_DataClassesDataContext LydbContext = new LYFEDB_DataClassesDataContext();

            var result = from r in LydbContext.INGREDIENTs select r;
            return result.ToList();
        }

        public static List<SHOPPING_LIST> GetShoppingLists()
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            var result = from r in db.SHOPPING_LISTs
                         orderby r.CREATE_DATE descending
                         select r;

            return result.ToList();
        }

        public static DataTable GetIngredientsDT()
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            //var result = db.INGREDIENTs.Select(b => new { b.I_ID, b.NAME, b.QUANTITY, b.QUANTITY_NAME });
            var result = from i in db.INGREDIENTs
                         join p in db.INGREDIENTS_PRICEs
                            on i.I_ID equals p.I_ID
                         select new { INGREDIENT = i, INGREDIENTS_PRICE = p };

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Price");
            dt.Columns.Add("PriceStore");

            foreach(var cell in result)
            {
                var row = dt.NewRow();
                row["ID"] = cell.INGREDIENT.I_ID;
                row["Name"] = cell.INGREDIENT.NAME;
                row["Quantity"] = cell.INGREDIENT.QUANTITY + " " + cell.INGREDIENT.QUANTITY_NAME;
                row["Price"] = cell.INGREDIENTS_PRICE.PRICE;
                row["PriceStore"] = cell.INGREDIENTS_PRICE.STORE;

                dt.Rows.Add(row);
            }

            return dt;
            
        }

        public static int InsertIngredient(Ingredient i)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();
            INGREDIENT dbi = new INGREDIENT();

            dbi.NAME = i.Name;
            dbi.QUANTITY = i.Quantity;
            dbi.QUANTITY_NAME = i.QuantityType;

            db.INGREDIENTs.InsertOnSubmit(dbi);

            try
            {
                db.SubmitChanges();

                return dbi.I_ID;
            }
            catch(Exception ex)
            {
                return 0;
            }
        }

        public static bool InsertIngredientPrice(Ingredient i)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();
            INGREDIENTS_PRICE dbip = new INGREDIENTS_PRICE();

            dbip.I_ID = i.Id;
            dbip.PRICE = i.Price;
            dbip.STORE = i.Store;

            db.INGREDIENTS_PRICEs.InsertOnSubmit(dbip);

            try
            {
                db.SubmitChanges();

                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public static bool InsertToShoppingList(int listId, int iId, int quantity)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();
            LIST_INGREDIENT x = new LIST_INGREDIENT();

            x.S_ID = listId;
            x.I_ID = iId;
            x.I_QUANTITY = quantity;

                db.LIST_INGREDIENTs.InsertOnSubmit(x);

            try
            {
                db.SubmitChanges();

                return true;
            }
            catch(Exception ex)
            {
                //TODO: Handle exception
                return false;
            }
        }

        public static DataTable GetRecipes()
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            var result = from r in db.RECIPEs
                         select r;

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Serves");
            dt.Columns.Add("PrepTime");
            dt.Columns.Add("Delete");
            dt.Columns.Add("Picture");

            foreach(var cell in result)
            {
                var row = dt.NewRow();
                row["ID"] = cell.R_ID.ToString();
                row["Name"] = cell.NAME;
                row["Serves"] = "Serves " + cell.SERVES.ToString();
                row["PrepTime"] = cell.PREPTIME.ToString();
                row["Delete"] = "images/delete.png";
                row["Picture"] = "images/food/" + cell.PICTURE_LOCATION.ToString();

                dt.Rows.Add(row);
            }

            return dt;
        }

        public static void DeleteFromIngredients(int id)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();
            var x = (from y in db.INGREDIENTs
                     where y.I_ID == id
                     select y).FirstOrDefault();

            db.INGREDIENTs.DeleteOnSubmit(x);
            db.SubmitChanges();
        }

        public static DataTable GetRecipeIngredients(int rId)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            var result = from r in db.RECIPE_INGREDIENTs
                         join i in db.INGREDIENTs
                            on r.I_ID equals i.I_ID
                         join p in db.RECIPEs
                            on r.R_ID equals p.R_ID
                         select new { RECIPE_INGREDIENT = r, INGREDIENT = i, RECIPE = p };

            DataTable dt = new DataTable();
            dt.Columns.Add("R_ID");
            dt.Columns.Add("I_ID");
            dt.Columns.Add("NAME");
            dt.Columns.Add("QUANTITY");

            foreach(var cell in result)
            {
                var row = dt.NewRow();
                row["R_ID"] = cell.RECIPE_INGREDIENT.R_ID.ToString();
                row["I_ID"] = cell.RECIPE_INGREDIENT.I_ID.ToString();
                row["NAME"] = cell.INGREDIENT.NAME;
                row["QUANTITY"] = cell.RECIPE_INGREDIENT.QUANTITY.ToString() + " " + cell.INGREDIENT.QUANTITY_NAME;

                dt.Rows.Add(row);
            }

            return dt;
        }

        public static string GetRecipeDetail(int id)
        {
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            var result = db.RECIPEs
                    .Where(u => u.R_ID == id)
                    .Select(u => new { u.SERVES, u.PREPTIME })
                    .FirstOrDefault();

            return result.PREPTIME + " | Serves: " + result.SERVES.ToString();
        }

        public static List<string> GetRecipeMethod(int id)
        { 
            LYFEDB_DataClassesDataContext db = new LYFEDB_DataClassesDataContext();

            var result = from s in db.RECIPE_STEPs
                         where s.R_ID == id
                         orderby s.STEP_ID ascending
                         select s;

            List<string> recipeSteps = new List<string>();

            foreach(var x in result)
            {
                recipeSteps.Add(x.STEP_TEXT);
            }

            return recipeSteps;
        }
    }
}