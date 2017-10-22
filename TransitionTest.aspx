<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransitionTest.aspx.cs" Inherits="LYFEWEB.TransitionTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">


.box {
  display: block;  
  background: lightblue;
  margin-bottom: 1em;
}

#fade-in {
  height: 150px;
  width: 1px;
  opacity: 0;
  transition: all .75s ease;
}

#fade-in.show {
  opacity: 1;
  height: 150px;
  width: 500px;
}



h1.spacing {
  letter-spacing: 0;
  opacity: .5;
  transition: all .75s ease-out;
}

h1.spacing.spaced {
  opacity: 1;
  letter-spacing: 10px;
}
    </style>
    <a class="slide" href="#">Slide Out</a>
<div id="fade-in" class="box"></div>
</asp:Content>
