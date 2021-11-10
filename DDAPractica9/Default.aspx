<%@ Page Title="Ejercicio Propuesto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DDAPractica9._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p>
            <asp:Button ID="cmdCreateXml" runat="server" OnClick="cmdCreateXml_Click1" Text="Crear XML" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="cmdReadXml" runat="server" OnClick="cmdReadXml_Click" Text="Leer XML (Como texto)" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="cdmReadXmlAsObjects" runat="server" OnClick="cdmReadXmlAsObjects_Click" Text="Leer XML (Como objeto)" />
        </p>
        <p>
            <asp:Label ID="lblXml" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="gridResults" runat="server">
            </asp:GridView>
        </p>
    </div>

</asp:Content>
