<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test_BrowseEdit_Ingredients.aspx.cs" Inherits="LYFEWEB.Test_BrowseEdit_Ingredients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- jQuery -->          <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 - CSS -->  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />
    <!-- Select2 - JS -->   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>
    
        
    <script type="text/javascript">
        $(document).ready(function () {
            $('#select_ingredient').select2();

            $("#select_ingredient").on("change", function () {
                console.log($(this).val());

                fun();
            });
        });
    </script>

    <script type ="text/javascript">
        function fun()
        {
            PageMethods.SelIngChange(onSuccess, onError)
            //return false;
        }
        function onSuccess(resultString)
        {
            console.log("Success");

            console.log(resultString);
        }
        function onError()
        {
            console.log("Error");
        }
    </script>

    <style type="text/css">
        .menu{
            width:80%;
            min-width:500px;
            border: solid 1px;
        }
        #select_Ingredient{
            width:100%
        }
    </style>

    <title>LyfeWeb - TEST- Browse Ingredients</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">
            <label for="select_ingredient">Select an Ingredient</label>
            <select id="select_ingredient" name="selIngredient" runat="server" OnSelectedIndexChanged="selIngChange">
            </select>
        </div>
        <div class="data">
            <p id="data" runat="server"></p>
        </div>
        <asp:ScriptManager ID="scriptman_selIngChange" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>
</body>
</html>

