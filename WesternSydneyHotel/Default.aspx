<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WesternSydneyHotel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div id ="anonWelcome" runat ="server" visible="false">
           <p> Welcome to Western Sydney Hotel! This is a six star hotel located in the finest area of Campbelltown. If you are interested in finding out
            prices and vacancies for rooms then please <asp:HyperLink ID="hyperRegister" runat="server" NavigateUrl="~/Account/Register.aspx">register</asp:HyperLink> to our website and utilize the browsing features we have designed for you. </p>
        </div>
        
        <div id ="cusWelcome" runat ="server" visible="false">
            <p>Welcome back! As a customer  you are able to browse and <asp:HyperLink ID="hyperSearchRooms" runat="server" NavigateUrl="~/Customers/SearchRoom.aspx">search for rooms</asp:HyperLink>  
            as well as <asp:HyperLink ID="hyperBookRooms" runat="server" NavigateUrl="~/Customers/BookRoom.aspx">make bookings</asp:HyperLink>  and  
            <asp:HyperLink ID="hyperViewBookings" runat="server" NavigateUrl="~/Customers/MyBookings.aspx">view all current and previous bookings</asp:HyperLink> you might have made.
            Please contact the hotel for any administrative queries you might have with your account.
            </p>
        </div>

        <div id ="adminWelcome" runat ="server" visible="false">
           <p> Welcome Administrator, you have priviliges enabled to <asp:HyperLink ID="hyperModifyRooms" runat="server" NavigateUrl="~/Administrators/ManageRooms.aspx">modify all rooms</asp:HyperLink> 
            within the hotel as well as <asp:HyperLink ID="hyperStatistics" runat="server" NavigateUrl="~/Administrators/Statistics.aspx">view statstics</asp:HyperLink> 
            to see the number of bookings per month per room ID.</p>
        </div>

</asp:Content>
