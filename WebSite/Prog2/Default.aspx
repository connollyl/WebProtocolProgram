<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSite.Prog2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CS3870- Fall 2019 - Program 2</title>
    <link href="../Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Web Protocols, Technologies and Applications</h1>
            <h2>Logan Connolly</h2>
        </div>
        <div class="navbar">

            <asp:HyperLink ID="StartHL" runat="server" NavigateUrl="~/Prog2/Default.aspx">Start Page</asp:HyperLink>
            <br />
            <asp:HyperLink ID="OrderHL" runat="server" NavigateUrl="~/Prog2/OrderingProduct.aspx">Order Form</asp:HyperLink>
        </div>
        <div>
            <h3>CS 3870: Program 2</h3>
        </div>
        <div style="text-align: center">
            <ul style="list-style: none;">
                <li>Dynamic Page</li>
                <li>Postback</li>
                <li>Event Procedures</li>
                <li>Validation</li>
                <li>Styles and CSS Files</li>
            </ul>
        </div>
    </form>
</body>
</html>
