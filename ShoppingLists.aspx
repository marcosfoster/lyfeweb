<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingLists.aspx.cs" Inherits="LYFEWEB.ShoppingLists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="optionBar">
        
        <h2>Shopping Lists</h2>

        <div class="searchBarContainer">
            <asp:TextBox runat="server" ID="tbNewListName" name="tbNewListName" placeholder="Shopping List Name..." CssClass="tbNewListName" />
            <a href="#openModal" runat="server">Add</a>
            <select id="select_list" class="select_list" name="selList" runat="server" ></select>
        </div>
    </div>

    <div class="gv_content">
        <asp:GridView ID="gvShoppingLists" runat="server"></asp:GridView>
    </div>

    <style type="text/css">
        .tbNewListName{
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</asp:Content>
