<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tienda.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="form-login">
        <h2>Iniciar Sesión</h2>
        <asp:ValidationSummary ID="vsErrores" runat="server" />
        <label for="txtUsuario">Usuario:</label>
        <div class="validacion">
            <input type="text" id="txtUsuario" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="El nombre de usuario es requerido" ControlToValidate="txtUsuario" ForeColor="Red" CssClass="span-error">*</asp:RequiredFieldValidator>
        </div>
        
        <label for="txtPassword">Password:</label>
        <div class="validacion">
            <input type="password" id="txtPassword" runat="server"/>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Debe ingresar la contraseña" ControlToValidate="txtPassword" ForeColor="Red" CssClass="span-error">*</asp:RequiredFieldValidator>
        </div>
        
        <button type="button" class="boton" runat="server" onserverclick="iniciar_sesion">Iniciar</button>
        </div>
    
</asp:Content>
