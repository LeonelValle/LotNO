<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LotNo.aspx.cs" Inherits="ROI_LotNo.LotNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <asp:Label Text="LOOK-UP LOT NUMBER" runat="server" CssClass="auto-style1" />

            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Item Number:"></asp:Label>
            <br />
            <asp:TextBox ID="txt_LotNo" runat="server" Width="50%"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" CssClass="button6" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" class="button6" style="background-color:#668fff" />

            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="grdContent" runat="server" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                AllowPaging="True" EmptyDataText="NO DATA LOAD!">
            </asp:GridView>


        </div>
    </form>
</body>
</html>
