<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="WesternSydneyHotel.Account.Customers.MyBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>My Bookings</h1>
    <p>All bookings for  <b><asp:Label ID="user" runat="server" Text=""></asp:Label></b> are as follows:</p>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:customerConnectionString %>' 
        SelectCommand="SELECT customers.gname AS [First Name], customers.sname AS [Last Name], bookings.rid AS [Room ID], 
                            bookings.checkin AS [Check-In], bookings.checkout AS [Check-Out], bookings.cost AS [Total Cost], 
                            bookings.btime AS [Booking Time] 
                    FROM bookings 
                    INNER JOIN customers ON bookings.username = customers.username 
                    WHERE (customers.username = @user )">
        <SelectParameters>
            <asp:ControlParameter ControlID="user" PropertyName="Text" Name="user"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" onSorting="Gridview1_Sorting">
        <Columns>
            <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name"></asp:BoundField>
            <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name"></asp:BoundField>
            <asp:BoundField DataField="Room ID" HeaderText="Room ID" SortExpression="Room ID"></asp:BoundField>
            <asp:BoundField DataField="Check-In" HeaderText="Check-In" SortExpression="Check-In"></asp:BoundField>
            <asp:BoundField DataField="Check-Out" HeaderText="Check-Out" SortExpression="Check-Out"></asp:BoundField>
            <asp:BoundField DataField="Total Cost" HeaderText="Total Cost" SortExpression="Total Cost"></asp:BoundField>
            <asp:BoundField DataField="Booking Time" HeaderText="Booking Time" SortExpression="Booking Time"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
