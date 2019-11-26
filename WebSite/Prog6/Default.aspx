<%@ Page Title="" Language="C#" MasterPageFile="~/Prog6/Prog6MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSite.Prog6.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:GridView ID="GVProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductID" DataSourceID="SDSServer" ForeColor="#333333" GridLines="None" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerSettings Visible="False" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:Button ID="btnFirst" runat="server" OnClick="btnFirst_Click" Text="First" Width="56px" />
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:Button ID="btnPrevious" runat="server" CssClass="auto-style1" OnClick="btnPrevious_Click" Text="Previous" />
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:Button ID="btnNext" runat="server" CssClass="auto-style2" OnClick="btnNext_Click" Text="Next" />
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:Button ID="btnLast" runat="server" CssClass="auto-style3" OnClick="btnLast_Click" Text="Last" />
<asp:SqlDataSource ID="SDSServer" runat="server" ConnectionString="<%$ ConnectionStrings:UWP3870ConnectionStringServer %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
</asp:Content>
