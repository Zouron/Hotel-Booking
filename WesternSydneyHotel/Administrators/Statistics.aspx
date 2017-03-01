<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WesternSydneyHotel.Account.Administrators.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="DataRoomCount" runat="server" ConnectionString='<%$ ConnectionStrings:customerConnectionString %>' 
        SelectCommand="SELECT rid AS [Room ID], COUNT(*) AS Number FROM bookings GROUP BY rid"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DataMonthCount" runat="server" ConnectionString='<%$ ConnectionStrings:customerConnectionString %>' 
        SelectCommand="SELECT DATENAME(month,btime) AS [Month], COUNT(*) AS Number FROM bookings GROUP BY DATENAME(month,btime)"></asp:SqlDataSource>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <asp:Label ID="ChartTypeLabel" runat="server" AssociatedControlID="ChartTypeSelection" Text="Type of chart"></asp:Label>
                <asp:DropDownList ID="ChartTypeSelection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ChangeChart">
                    <asp:ListItem>Column</asp:ListItem>
                    <asp:ListItem>Line</asp:ListItem>
                    <asp:ListItem>Pie</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                <asp:Label ID="CharDimensionLabel" runat="server" AssociatedControlID="ChartDimensionSelection" Text="Dimension"></asp:Label>
                <asp:DropDownList ID="ChartDimensionSelection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ChangeChart">
                    <asp:ListItem>2D</asp:ListItem>
                    <asp:ListItem>3D</asp:ListItem>
                </asp:DropDownList>
            </p>

            <asp:Chart ID="RoomCountChart" runat="server" DataSourceID="DataRoomCount">
                <Titles><asp:Title Text="Total Bookings"></asp:Title></Titles>
                <Series>
                    <asp:Series Name="RoomCountSeries" XValueMember="Room ID" YValueMembers="Number"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="RoomCountArea">
                        <AxisX Title="Room ID"></AxisX>
                        <AxisY Title="Number of bookings"></AxisY>
                    </asp:ChartArea>                    
                </ChartAreas>
            </asp:Chart>

            <p></p>

            <asp:Chart ID="MonthCountChart" runat="server" DataSourceID="DataMonthCount">
                <Titles><asp:Title Text="Monthly Bookings"></asp:Title></Titles>
                <Series>
                    <asp:Series Name="MonthCountSeries" XValueMember="Month" YValueMembers="Number"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="MonthCountArea">
                        <AxisX Title="Month"></AxisX>
                        <AxisY Title="Number of bookings"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
