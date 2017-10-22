using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LYFEWEB
{
    public class Ingredient
    {
        private int id;
        private string name;
        private short quantity;
        private string quantityType;
        private decimal price;
        private string store;

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public short Quantity { get => quantity; set => quantity = value; }
        public string QuantityType { get => quantityType; set => quantityType = value; }
        public decimal Price { get => price; set => price = value; }
        public string Store { get => store; set => store = value; }
    }
}