<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartCheck.aspx.cs" Inherits="CartCheck.CartCheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .CenterStyle {
            text-align: center;
            font-size: xx-large;
        }

        .auto-style1 {
            font-size: xx-large;
        }

        .auto-style2 {
            text-align: center;
        }

        .grdContent {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }

            .rows:hover {
                background-color: #ff8000;
                font-family: Arial;
                color: #fff;
                text-align: left;
            }

        .selectedrow {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .mygrdContent a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
            background-color: #000;
            color: #fff;
        }

        .mygrdContent span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mygrdContent td {
            padding: 5px;
        }

        .mygrdContent th {
            padding: 5px;
        }

        a.button6 {
             display: inline-block;
             padding: 0.7em 1.4em;
             margin: 0 0.3em 0.3em 0;
             border-radius: 0.15em;
             box-sizing: border-box;
             text-decoration: none;
             font-family: 'Roboto',sans-serif;
             text-transform: uppercase;
             font-weight: 400;
             color: #FFFFFF;
             background-color: #3369ff;
             box-shadow: inset 0 -0.6em 0 -0.35em rgba(0,0,0,0.17);
             text-align: center;
             position: relative;
        }

            a.button6:active {
                 top: 0.1em;
            }

        @media all and (max-width:30em) {
             a.button6 {
                  display: block;
                  margin: 0.4em auto;
                 
            }
        }

        .auto-style3 {
            font-size: x-large;
        }
    </style>
    <script type="text/javascript">

            function funCheck() {
                var flag = confirm('Do you want to empty this Cart Location?');
                var hdnfld = document.getElementById('<%= HiddenField1.ClientID %>');
                hdnfld.value = flag ? '1' : '0';
            }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/logo.jpeg" ImageAlign="Left" Height="97px" Width="125px" />
        </div>
        <br />
        <br />
        <br />
        <div class="CenterStyle">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Cart Location:"></asp:Label>
            <br />
            <asp:TextBox ID="txt_CartLocation" runat="server" Width="30%" Height="27px"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Work Order:"></asp:Label>
            <br />
            <asp:TextBox ID="txt_WO" runat="server" Width="30%" Height="27px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" OnClientClick="funCheck()" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="WO Issue Picklist"></asp:Label>
        <div class="auto-style1">
            <asp:Button ID="btn_Report" runat="server" Text="Report" OnClick="btn_Report_Click" />
        </div>
        <br />
        <asp:GridView ID="gw_ListLoc" runat="server" Width="100%" Height="50%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
        <asp:Label ID="Label3" runat="server" Text="WO Issue Item"></asp:Label>

        <br />
        <asp:GridView ID="gw_Control" runat="server" Width="100%" Height="50%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

    </form>
</body>
</html>
